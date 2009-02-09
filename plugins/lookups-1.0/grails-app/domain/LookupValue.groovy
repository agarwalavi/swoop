import java.text.SimpleDateFormat
import java.text.ParseException

class LookupValue {

    static belongsTo = Lookup

    Lookup lookup
    String code
    String value
    Integer sequencer = 0
    BigDecimal numericSequencer = 0
    String stringSequencer = "_"
    Date dateCreated
    Date lastUpdated

    static mapping = {
        columns {
            code index: "lv_code_idx"
        }
    }

    static constraints = {
        code(blank:false, unique: 'lookup', validator: {val, obj ->
                def c = Lookup.stringValue(obj.lookup.codeType,
                    LookupValue.getParameter(obj.lookup.codeType, obj.lookup.codeScale, obj.lookup.codeMinimum),
                    LookupValue.getParameter(obj.lookup.codeType, obj.lookup.codeScale, obj.lookup.codeMaximum),
                    obj.lookup.codeScale, val)
                
                if (c) {
                    obj.code = c
                    return true
                }

                return false
            })
        value(blank:false, validator: {val, obj ->
                def v = Lookup.stringValue(obj.lookup.valueType,
                    LookupValue.getParameter(obj.lookup.valueType, obj.lookup.valueScale, obj.lookup.valueMinimum),
                    LookupValue.getParameter(obj.lookup.valueType, obj.lookup.valueScale, obj.lookup.valueMaximum),
                    obj.lookup.valueScale, val)
                
                if (v) {
                    obj.value = v
                    return true
                }

                return false
            })
        sequencer(validator: {val, obj ->
                switch (obj.lookup.ordering) {
                    case "code":
                    obj.sequencer = 0
                    if (obj.lookup.codeType == "string") {
                        obj.stringSequencer = obj.code
                        obj.numericSequencer = 0
                    } else {
                        def value = Lookup.getValue(obj.lookup.codeType, null, null, obj.lookup.codeScale, obj.code)
                        if (value == null) {
                            value = 0
                        } else if (obj.lookup.codeType == "date") {
                            value = value.getTime()
                        }
                        obj.stringSequencer = "_"
                        obj.numericSequencer = value
                    }
                    break

                    case "value":
                    obj.sequencer = 0
                    if (obj.lookup.valueType == "string") {
                        obj.stringSequencer = obj.value
                        obj.numericSequencer = 0
                    } else {
                        def value = Lookup.getValue(obj.lookup.valueType, null, null, obj.lookup.valueScale, obj.value)
                        if (value == null) {
                            value = 0
                        } else if (obj.lookup.valueType == "date") {
                            value = value.getTime()
                        }
                        obj.stringSequencer = "_"
                        obj.numericSequencer = value
                    }
                    break

                    case "sequencer":
                    obj.numericSequencer = 0
                    obj.stringSequencer = "_"
                    break
                }
            })
    }
    
    static getParameter(type, scale, val) {
        if (val != null) {
            switch (type) {
                case "string":
                case "integer":
                val = new Integer(val)
                break
                
                case "decimal":
                val = new BigDecimal(val)
                break
                
                case "date":
                def fmt = (scale == 1) ? "yyyy-MM-dd" : "yyyy-MM-dd HH:mm"
                val = new SimpleDateFormat(fmt, Locale.US).parse(val)
            }
        }
        
        return val
    }
}
