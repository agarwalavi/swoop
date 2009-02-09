import org.codehaus.groovy.grails.commons.GrailsDomainClass
import org.codehaus.groovy.grails.commons.DomainClassArtefactHandler
import org.codehaus.groovy.grails.commons.ApplicationHolder

class LookupController {

    private static loaded = false
    
    def lookupService
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST', reset:'POST']

    def list = {
        if (!loaded) {
            if (lookupService.hasPlugin("localizations")) {
                def test = message(code: "lookup.id", default: "_missing!")
                if (test == "_missing!") {
                    Localization.loadPluginData("lookups")
                    Localization.loadPluginData("lookupValues")
                }
            }

            loaded = true
        }

        def max = 50
        def dflt = 20

        // If the settings plugin is available, try and use it for pagination
        if (lookupService.hasPlugin("settings")) {

            // This convolution is necessary because this plugin can't see the
            // domain classes of another plugin
            def setting = ((GrailsDomainClass) ApplicationHolder.getApplication().getArtefact(DomainClassArtefactHandler.TYPE, "Setting")).newInstance()
            max = setting.valueFor("pagination.max", max)
            dflt = setting.valueFor("pagination.default", dflt)
        }

        params.max = (params.max && params.max.toInteger() > 0) ? Math.min(params.max.toInteger(), max) : dflt
        params.sort = params.sort ?: "realm"
        
        def lst
        if (lookupService.hasPlugin("criteria") || lookupService.hasPlugin("drilldowns")) {
            lst = Lookup.selectList( session, params )
        } else {
            lst = Lookup.list( params )
        }

        [ lookupList: lst ]
    }

    def show = {
        def lookup = Lookup.get( params.id )

        if(!lookup) {
            flash.message = "lookup.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Lookup not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ lookup : lookup ] }
    }

    def delete = {
        def lookup = Lookup.get( params.id )
        if(lookup) {
            lookup.delete()
            Lookup.resetThis(lookup.realm)
            flash.message = "lookup.deleted"
            flash.args = [params.id]
            flash.defaultMessage = "Lookup ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "lookup.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Lookup not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def lookup = Lookup.get( params.id )

        if(!lookup) {
            flash.message = "lookup.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Lookup not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ lookup : lookup ]
        }
    }

    def update = {
        def lookup = Lookup.get( params.id )
        if(lookup) {

            // Grab details of the original before making the changes
            def original = [:]
            original.realm = lookup.realm
            original.codeType = lookup.codeType
            original.codeMinimum = lookup.codeMinimum
            original.codeMaximum = lookup.codeMaximum
            original.codeScale = lookup.codeScale
            original.valueType = lookup.valueType
            original.valueMinimum = lookup.valueMinimum
            original.valueMaximum = lookup.valueMaximum
            original.valueScale = lookup.valueScale
            original.ordering = lookup.ordering

            lookup.properties = params
            def valid = !lookup.hasErrors()
            if (valid) {
                Lookup.withTransaction { status ->
                    if (lookup.save()) {
                        if (original.codeType != lookup.codeType ||
                            original.codeMinimum != lookup.codeMinimum ||
                            original.codeMaximum != lookup.codeMaximum ||
                            original.codeScale != lookup.codeScale ||
                            original.valueType != lookup.valueType ||
                            original.valueMinimum != lookup.valueMinimum ||
                            original.valueMaximum != lookup.valueMaximum ||
                            original.valueScale != lookup.valueScale ||
                            original.ordering != lookup.ordering) {

                            def result
                            for (LookupValue lv : lookup.values) {

                                result = lookupService.updateChild(original, lookup, lv)

                                if (result == null) continue    // No update required
                                if (result) result = lv.save()  // Update required
                                if (!result) {  // Either changes would have been invalid or save() failed
                                    lookup.errors.reject("lookup.update.error",
                                        "Unable to update the lookup definition as this would invalidate existing codes and/or values")
                                    valid = false
                                    status.setRollbackOnly()
                                    break
                                }
                            }
                        }
                    } else {
                        valid = false
                        status.setRollbackOnly()
                    }
                }
            }
            
            if (valid) {
                Lookup.resetThis(original.realm)
                if (lookup.realm != original.realm) Lookup.resetThis(lookup.realm)
                flash.message = "lookup.updated"
                flash.args = [params.id]
                flash.defaultMessage = "Lookup ${params.id} updated"
                redirect(action:show,id:lookup.id)
            } else {
                render(view:'edit',model:[lookup:lookup])
            }
        }
        else {
            flash.message = "lookup.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Lookup not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def lookup = new Lookup()
        lookup.properties = params
        return ['lookup':lookup]
    }

    def save = {
        def lookup = new Lookup(params)
        if(!lookup.hasErrors() && lookup.save()) {
            Lookup.resetThis(lookup.realm)
            flash.message = "lookup.created"
            flash.args = ["${lookup.id}"]
            flash.defaultMessage = "Lookup ${lookup.id} created"
            redirect(action:show,id:lookup.id)
        }
        else {
            render(view:'create',model:[lookup:lookup])
        }
    }

    def cache = {
        return [stats: Lookup.statistics()]
    }

    def reset = {
        Lookup.resetAll()
        redirect(action:cache)
    }
}