import org.springframework.web.servlet.support.RequestContextUtils
import org.springframework.web.context.request.RequestContextHolder
import org.codehaus.groovy.grails.commons.ApplicationHolder
import org.codehaus.groovy.grails.commons.ConfigurationHolder
import java.text.ParseException
import java.text.SimpleDateFormat
import javax.servlet.http.HttpServletRequest

class Lookup {
    private static loaded = false
    private static final realms = [:]  // Realm definitions - we hold them all, loaded as needed
    private static cache = new LinkedHashMap((int) 16, (float) 0.75, (boolean) true)
    private static long maxCacheSize = 64L * 1024L // Cache size in KB (default is 64kb)
    private static long currentCacheSize = 0L
    private static final missingValue = "\b" // an impossible value signifying that no such code exists in the database
    private static final keyDelimiter = missingValue
    private static long cacheHits = 0L
    private static long cacheMisses = 0L

    static hasMany = [values: LookupValue]

    String realm
    String codeType
    String codeMinimum
    String codeMaximum
    Integer codeScale
    String valueType
    String valueMinimum
    String valueMaximum
    Integer valueScale
    String ordering
    Boolean internationalize
    Date dateCreated
    Date lastUpdated

    static mapping = {
        columns {
            realm index: "lookup_realm_idx"
        }
    }

    static constraints = {
        realm(blank:false, size: 1..100, unique: true)
        codeType(blank:false, inList: ['string', 'integer', 'decimal', 'date'])
        codeScale(nullable:true, range: 1..10, validator: {val, obj -> return Lookup.checkScale(val, obj.codeType)})
        codeMinimum(nullable:true, validator: {val, obj ->
                if (val == null) return true
                def value = (obj.codeType == "string") ? Lookup.stringValue("integer", 1, 100, null, val) : Lookup.stringValue(obj.codeType, null, null, obj.codeScale, val)
                if (value != null) {
                    obj.codeMinimum = value
                    return true
                }

                return false
            })
        codeMaximum(nullable:true, validator: {val, obj ->
                if (val == null) return true
                def min = Lookup.getValue((obj.codeType == "string") ? "integer" : obj.codeType, null, null, obj.codeScale, obj.codeMinimum)
                def value = (obj.codeType == "string") ? Lookup.stringValue("integer", min, 100, null, val) : Lookup.stringValue(obj.codeType, min, null, obj.codeScale, val)
                if (value != null) {
                    obj.codeMaximum = value
                    return true
                }

                return false
            })
        valueType(blank:false, inList: ['string', 'integer', 'decimal', 'date'])
        valueScale(nullable:true, range: 1..10, validator: {val, obj -> return Lookup.checkScale(val, obj.valueType)})
        valueMinimum(nullable:true, validator: {val, obj ->
                if (val == null) return true
                def value = (obj.valueType == "string") ? Lookup.stringValue("integer", 1, 100, null, val) : Lookup.stringValue(obj.valueType, null, null, obj.valueScale, val)
                if (value != null) {
                    obj.valueMinimum = value
                    return true
                }

                return false
            })
        valueMaximum(nullable:true, validator: {val, obj ->
                if (val == null) return true
                def min = Lookup.getValue((obj.valueType == "string") ? "integer" : obj.valueType, null, null, obj.valueScale, obj.valueMinimum)
                def value = (obj.valueType == "string") ? Lookup.stringValue("integer", min, 100, null, val) : Lookup.stringValue(obj.valueType, min, null, obj.valueScale, val)
                if (value != null) {
                    obj.valueMaximum = value
                    return true
                }

                return false
            })
        ordering(blank:false, inList: ['code', 'value', 'sequencer'])
        internationalize(validator: {val, obj ->
                if (val && obj.valueType != "string") obj.internationalize = false
            })
    }
    
    static valueFor(String realm, Object code) {

        if (!loaded) Lookup.load()

        if (!realm || code == null) return null
        def lookup = Lookup.getRealm(realm)
        if (!lookup) return null

        // Allow them to pass the code in as a string, even if it's supposed to
        // be some other data type'
        if ((code instanceof String) && lookup.codeType != "string") {
            code = Lookup.getValue(lookup.codeType, null, null, lookup.codeScale, code)
            if (code == null) {
                return null
            }
        } else if ((code instanceof BigDecimal) && code.scale() != lookup.codeScale) {
            try {
                code = code.setScale(lookup.codeScale)
            } catch (ArithmeticException ae) {}
        }
        
        def coding
        def strCode = Lookup.formatString(lookup.codeType, lookup.codeScale, code)
        def key = realm + keyDelimiter + strCode
        if (maxCacheSize > 0) {
            synchronized(cache) {
                coding = cache.get(key)

                if (coding) {
                    cacheHits++
                } else {
                    cacheMisses++
                }
            }
        }
        
        // Wasn't in the LRU cache
        if (coding == null) {
            def lv = LookupValue.findByLookupAndCode(lookup, strCode)
            if (lv == null) return null
            coding = [:]
            coding.realm = realm
            coding.code = code
            coding.strCode = strCode
            coding.value = Lookup.getValue(lookup.valueType, null, null, lookup.valueScale, lv.value)
        
            if (maxCacheSize > 0) {
                synchronized(cache) {

                    // Put it in the cache
                    def prev = cache.put(key, coding)

                    // Another user may have inserted it while we weren't looking
                    if (prev != null) currentCacheSize -= Lookup.sizeOf(key, prev)

                    // Increment the cache size with our data
                    currentCacheSize += Lookup.sizeOf(key, coding)

                    // Adjust the cache size if required
                    if (currentCacheSize > maxCacheSize) {
                        def entries = cache.entrySet().iterator()
                        def entry
                        while (entries.hasNext() && currentCacheSize > maxCacheSize) {
                            entry = entries.next()
                            currentCacheSize -= Lookup.sizeOf(entry.getKey(), entry.getValue())
                            entries.remove()
                        }
                    }
                }
            }
        }
        
        if (lookup.internationalize) {
            def webRequest = RequestContextHolder.currentRequestAttributes()
            def locale = RequestContextUtils.getLocale(webRequest.getCurrentRequest())

            if (Lookup.hasPlugin("localizations")) {
                def grailsAttributes = webRequest.getAttributes()
                def messageSource = grailsAttributes.getApplicationContext().getBean("messageSource")
                return messageSource.getMessage("lookups.${realm}.${coding.strCode}", null, coding.value, locale)
            } else {
                try {
                    return ResourceBundle.getBundle("grails-app.i18n.lookupValues", locale).getString("lookups.${realm}.${coding.strCode}")
                } catch (MissingResourceException mre) {}
            }
        }
        
        return coding.value
    }

    static hasPlugin(name) {
        return org.codehaus.groovy.grails.plugins.PluginManagerHolder.getPluginManager()?.hasGrailsPlugin(name)
    }

    static sizeOf(key, coding) {
        return key.length() + coding.realm.length() + Lookup.valSize(coding.code) + coding.strCode.length() + Lookup.valSize(coding.value)
    }

    static valSize(val) {
        if (val == null) {
            return 0
        }

        if (val instanceof String) {
            return val.length()
        }

        if (val instanceof Integer) {
            return 4
        }

        if (val instanceof BigDecimal) {
            return 8
        }

        if (val instanceof Date) {
            return 8
        }

        return 8    // A reasonable default
    }

    static codeList(String realm) {

        if (!loaded) Lookup.load()

        def list = []
        if (!realm) return list
        def lookup = Lookup.getRealm(realm)
        if (!lookup) return list
        def sort
        switch (lookup.ordering) {
            case "code":
            sort = (lookup.codeType == "string") ? "stringSequencer" : "numericSequencer"
            break
                    
            case "value":
            sort = (lookup.valueType == "string") ? "stringSequencer" : "numericSequencer"
            break

            case "sequencer":
            sort = "sequencer"
            break
        }
        
        def code, value
        LookupValue.findAllByLookup(lookup, [sort: sort]).each {
            code = Lookup.getValue(lookup.codeType, null, null, lookup.codeScale, it.code)
            value = Lookup.getValue(lookup.valueType, null, null, lookup.valueScale, it.value)
            list << [code: code, value: value]
        }
        
        if (lookup.internationalize) {
            def webRequest = RequestContextHolder.currentRequestAttributes()
            def locale = RequestContextUtils.getLocale(webRequest.getCurrentRequest())
            def grailsAttributes = null
            def messageSource = null
            def res = null

            if (Lookup.hasPlugin("localizations")) {
                grailsAttributes = webRequest.getAttributes()
                messageSource = grailsAttributes.getApplicationContext().getBean("messageSource")
            } else {
                try {
                    res = ResourceBundle.getBundle("grails-app.i18n.lookupValues", locale)
                } catch (MissingResourceException mre1) {
                    return list
                }
            }
            
            code = "lookups.${realm}."
            def modified = false
            list.each {

                if (messageSource) {
                    value = messageSource.getMessage(code + Lookup.formatString(lookup.codeType, lookup.codeScale, it.code), null, it.value, locale)
                } else {
                    try {
                        value = res.getString(code + Lookup.formatString(lookup.codeType, lookup.codeScale, it.code))
                    } catch (MissingResourceException mre) {
                        value = it.value
                    }
                }

                if (value != it.value) {
                    it.value = value
                    modified = true
                }
            }
            
            if (lookup.ordering == "value" && modified) {
                list.sort {it.value}
            }
        }
        
        return list
    }
    
    static valueFor(String realm, Object code, Object dflt) {
        def val = valueFor(realm, code)

        return (val != null) ? val : dflt
    }

    static resetAll() {
        synchronized(realms) {
            realms.clear()
        }
        
        synchronized(cache) {
            cache.clear()
            currentCacheSize = 0L
            cacheHits = 0L
            cacheMisses = 0L
        }
    }

    static resetThis(realm) {
        synchronized(realms) {
            realms.remove(realm)
        }

        realm += keyDelimiter
        synchronized(cache) {
            def entries = cache.entrySet().iterator()
            def entry
            while (entries.hasNext()) {
                entry = entries.next()
                if (entry.getKey().startsWith(realm)) {
                    currentCacheSize -= Lookup.sizeOf(entry.getKey() + entry.getValue())
                    entries.remove()
                }
            }
        }
    }

    static getRealm(realm) {
        def rlm
        
        synchronized(realms) {
            rlm = realms[realm]
        }

        if (!rlm) {
            rlm = Lookup.findByRealm(realm)
            if (!rlm) rlm = missingValue
            
            synchronized(realms) {
                realms[realm] = rlm
            }
        }

        return (rlm != missingValue) ? rlm : null
    }
    
    static stringValue(type, min, max, scale, val) {
        val = Lookup.getValue(type, min, max, scale, val)
        if (val != null) {
            val = Lookup.formatString(type, scale, val)
        }
        
        return val
    }
    
    static formatString(type, scale, val) {
        switch (type) {
            case "integer":
            val = Integer.toString(val)
            break
            
            case "decimal":
            val = val.toPlainString()
            break
            
            case "date":
            def fmt = (scale == 1) ? "yyyy-MM-dd" : "yyyy-MM-dd HH:mm"
            val = new SimpleDateFormat(fmt, Locale.US).format(val)
            break
        }

        return val
    }
    
    static getValue(type, min, max, scale, val) {
        def value

        if (val != null) {
            switch (type) {
                case "string":
                if ((min == null || val.length() >= min) && (max == null || val.length() <= max)) {
                    value = val
                }
                break

                case "integer":
                try {
                    value = new Integer(val)
                    if ((min != null && value < min) || (max != null && value > max)) {
                        value = null
                    }
                } catch (NumberFormatException ne) {}
                break
            
                case "decimal":
                try {
                    value = new BigDecimal(val)
                    if ((min != null && value < min) || (max != null && value > max)) {
                        value = null
                    } else if (scale != null) {
                        try {
                            value = value.setScale(scale)
                        } catch (ArithmeticException ae) {
                            value = null
                        }
                    }
                } catch (NumberFormatException ne) {}
                break
            
                case "date":
                try {
                    def fmt = (scale == 1 || val.length() == 10) ? "yyyy-MM-dd" : "yyyy-MM-dd HH:mm"
                    value = new SimpleDateFormat(fmt, Locale.US).parse(val)
                    if ((min != null && value.before(min)) || (max != null && value.after(max))) {
                        value = null
                    }
                } catch (ParseException pe) {}
                break
            }
        }
        
        return value
    }

    static checkScale(val, type) {
        if (type == "decimal") {
            return (val != null)
        } else if (type == "date") {
            return (val == 1 || val == 2)
        } else {
            return (val == null)
        }
    }

    static statistics() {
        def stats = [:]
        synchronized (cache) {
            stats.max = maxCacheSize
            stats.size = currentCacheSize
            stats.count = cache.size()
            stats.hits = cacheHits
            stats.misses = cacheMisses
        }

        return stats
    }

    static load() {
        def size = ConfigurationHolder.config.lookups.cache.size.kb
        if (size != null && size instanceof Integer && size >= 0 && size <= 1024 * 1024) {
            maxCacheSize = size * 1024L
        }

        loaded = true
    }
    
    String toString() {
        return realm
    }
}