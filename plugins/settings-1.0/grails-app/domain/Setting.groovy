import org.codehaus.groovy.grails.commons.ConfigurationHolder
import java.text.SimpleDateFormat
import java.text.ParseException

class Setting {
    private static loaded = false
    private static cache = new LinkedHashMap((int) 16, (float) 0.75, (boolean) true)
    private static long maxCacheSize = 8L * 1024L // Cache size in KB (default is 8kb)
    private static long currentCacheSize = 0L
    private static final missingValue = "\b" // an impossible value signifying that no such code exists in the database
    private static long cacheHits = 0L
    private static long cacheMisses = 0L

    String code
    String type
    String value
    Date dateCreated
    Date lastUpdated

    static mapping = {
        columns {
            code index: "setting_code_idx"
        }
    }

    static constraints = {
        code(blank:false, size: 1..100, unique: true)
        type(blank:false, inList: ['string', 'integer', 'decimal', 'date'])
        value(blank:false, size: 1..100, validator: {val, obj -> (Setting.decodeValue(obj.type, val) != null) ? true : false})
    }
    
    static valueFor(String code) {
        if (!loaded) load()
        if (!code) return null
        
        def val
        if (maxCacheSize > 0) {
            synchronized(cache) {
                val = cache.get(code)

                if (val) {
                    cacheHits++
                } else {
                    cacheMisses++
                }
            }
        }

        if (!val) {
            val = Setting.findByCode(code)
            if (val) {
                val = Setting.decodeValue(val.type, val.value)
            }

            if (!val) val = missingValue

            if (maxCacheSize > 0) {
                synchronized (cache) {

                    // Put it in the cache
                    def prev = cache.put(code, val)

                    // Another user may have inserted it while we weren't looking
                    if (prev != null) currentCacheSize -= code.length() + valSize(prev)

                    // Increment the cache size with our data
                    currentCacheSize += code.length() + valSize(val)

                    // Adjust the cache size if required
                    if (currentCacheSize > maxCacheSize) {
                        def entries = cache.entrySet().iterator()
                        def entry
                        while (entries.hasNext() && currentCacheSize > maxCacheSize) {
                            entry = entries.next()
                            currentCacheSize -= entry.getKey().length() + valSize(entry.getValue())
                            entries.remove()
                        }
                    }
                }
            }
        }

        return (val != missingValue) ? val : null
    }

    static valueFor(String code, Object dflt) {
        def val = valueFor(code)

        return (val != null) ? val : dflt
    }

    static resetAll() {
        synchronized(cache) {
            cache.clear()
            currentCacheSize = 0L
            cacheHits = 0L
            cacheMisses = 0L
        }
    }

    static resetThis(String code) {
        synchronized(cache) {
            def val = cache.remove(code)
            if (val) {
                currentCacheSize -= code.length() + valSize(val)
            }
        }
    }

    static load() {
        def size = ConfigurationHolder.config.settings.cache.size.kb
        if (size != null && size instanceof Integer && size >= 0 && size <= 1024 * 1024) {
            maxCacheSize = size * 1024L
        }
        
        loaded = true
    }
    
    private static decodeValue(String type, String val) {
        if (val) {
            switch (type) {
                case "integer":
                try {
                    return new Integer(val)
                } catch (NumberFormatException ne) {}
                break
                
                case "decimal":
                try {
                    return new BigDecimal(val)
                } catch (NumberFormatException ne) {}
                break
                
                case "date":
                try {
                    def fmt = (val.length() == 10) ? "yyyy-MM-dd" : "yyyy-MM-dd HH:mm"
                    return new SimpleDateFormat(fmt, Locale.US).parse(val)
                } catch (ParseException pe) {}
                break
                
                default:  // string
                return val
                break
            }
        }

        return null
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
}