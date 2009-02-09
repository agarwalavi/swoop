import org.codehaus.groovy.grails.commons.GrailsServiceClass
import org.codehaus.groovy.grails.commons.ServiceArtefactHandler
import org.codehaus.groovy.grails.commons.ApplicationHolder
import java.text.SimpleDateFormat

class LookupService {

    boolean transactional = true

    def hasPlugin(name) {
        return org.codehaus.groovy.grails.plugins.PluginManagerHolder.getPluginManager()?.hasGrailsPlugin(name)
    }

    def source(session, params, test){
        def result
        if (hasPlugin("drilldowns")) {
            def drilldownService = ((GrailsServiceClass) ApplicationHolder.getApplication().getArtefact(ServiceArtefactHandler.TYPE, "DrilldownService")).newInstance()
            result = drilldownService.source(session, params, test)
        }
        
        return result
    }
    
    def asInteger(val) {
        return ((val == null) ? null : new Integer(val))
    }
    
    def asDecimal(val) {
        return ((val == null) ? null : new BigDecimal(val))
    }
    
    def asDate(val, scale) {
        if (val != null) {
            def fmt = (scale == 1) ? "yyyy-MM-dd" : "yyyy-MM-dd HH:mm"
            val = new SimpleDateFormat(fmt, Locale.US).parse(val)
        }

        return val
    }

    // Returns null if no change is required, true if a change has been made and
    // is to written back to the database, false if the change would be invalid
    // and therefore is an error
    def updateChild(original, modified, child) {
        def changed
        
        if (original.codeType != modified.codeType ||
            original.codeMinimum != modified.codeMinimum ||
            original.codeMaximum != modified.codeMaximum ||
            original.codeScale != modified.codeScale) {
            
            def newCode = validateChange(original.codeType, modified.codeType,
                original.codeMinimum, modified.codeMinimum, original.codeMaximum,
                modified.codeMaximum, original.codeScale, modified.codeScale, child.code)
            if (newCode == null) return false // New code would be invalid
            if (newCode != child.code) {
                child.code = newCode
                changed = true
            }
        }
        
        if (original.valueType != modified.valueType ||
            original.valueMinimum != modified.valueMinimum ||
            original.valueMaximum != modified.valueMaximum ||
            original.valueScale != modified.valueScale) {

            def newValue = validateChange(original.valueType, modified.valueType,
                original.valueMinimum, modified.valueMinimum, original.valueMaximum,
                modified.valueMaximum, original.valueScale, modified.valueScale, child.value)
            if (newValue == null) return false  // New value would be invalid
            if (newValue != child.value) {
                child.value = newValue
                changed = true
            }
        }
        
        if (!changed) {
            if (original.ordering != modified.ordering) {
                changed = true
            } else if (modified.ordering == "code" && (original.codeType != modified.codeType || original.codeScale != modified.codeScale)) {
                changed = true
            } else if (modified.ordering == "value" && (original.valueType != modified.valueType || original.valueScale != modified.valueScale)) {
                changed = true
            }
        }

        return changed
    }
    
    private validateChange(oldType, newType, oldMin, newMin, oldMax, newMax, oldScale, newScale, value) {
        switch (newType) {
            case "string":
            value = Lookup.getValue(newType, asInteger(newMin), asInteger(newMax), newScale, value)
            break

            case "integer":
            if (oldType == "decimal") {
                try {
                    value = Integer.toString(asDecimal(value).intValueExact())
                } catch (ArithmeticException ae) {
                    value = null
                }
            }

            value = Lookup.stringValue(newType, asInteger(newMin), asInteger(newMax), newScale, value)
            break
                
            case "decimal":
            value = Lookup.stringValue(newType, asDecimal(newMin), asDecimal(newMax), newScale, value)
            break
                
            case "date":
            if (oldType == "date" && oldScale != newScale) {
                def val = asDate(value, oldScale)
                    
                if (newScale == 1) {  // Changing from datetime to date
                    def cal = Calendar.getInstance(Locale.US)
                    cal.setTime(val)
                    if (cal.get(Calendar.HOUR_OF_DAY) != 0 || cal.get(Calendar.MINUTE) != 0) {
                        value = null
                    } else {
                        value = new SimpleDateFormat("yyyy-MM-dd", Locale.US).format(val)
                    }
                } else {  // Changing from date to datetime
                    value = new SimpleDateFormat("yyyy-MM-dd HH:mm", Locale.US).format(val)
                }
            }

            value = Lookup.stringValue(newType, asDate(newMin, newScale), asDate(newMax, newScale), newScale, value)
            break
        }
        
        return value
    }
}
