import org.codehaus.groovy.grails.commons.GrailsDomainClass
import org.codehaus.groovy.grails.commons.DomainClassArtefactHandler
import org.codehaus.groovy.grails.commons.ApplicationHolder

class LookupValueController {
    
    def lookupService
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
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
        
        def lst
        def ddLookup = lookupService.source(session, params, "lookup.list")
        
        if (!params.sort) {
            if (ddLookup) {
                switch (ddLookup.ordering) {
                    case "code":
                    params.sort = (ddLookup.codeType == "string") ? "stringSequencer" : "numericSequencer"
                    break
                    
                    case "value":
                    params.sort = (ddLookup.valueType == "string") ? "stringSequencer" : "numericSequencer"
                    break

                    case "sequencer":
                    params.sort = "sequencer"
                    break
                }
            } else {
                params.sort = "lookup"
            }
        }
        
        if (lookupService.hasPlugin("criteria") || lookupService.hasPlugin("drilldowns")) {
            lst = LookupValue.selectList( session, params )
        } else {
            lst = LookupValue.list( params )
        }

        [ lookupValueList: lst, ddLookup: ddLookup ]
    }

    def show = {
        def lookupValue = LookupValue.get( params.id )

        if(!lookupValue) {
            flash.message = "lookupValue.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Lookup Value not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ lookupValue : lookupValue ] }
    }

    def delete = {
        def lookupValue = LookupValue.get( params.id )
        if(lookupValue) {
            lookupValue.delete()
            Lookup.resetThis(lookupValue.lookup.realm)
            flash.message = "lookupValue.deleted"
            flash.args = [params.id]
            flash.defaultMessage = "Lookup Value ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "lookupValue.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Lookup Value not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def lookupValue = LookupValue.get( params.id )

        if(!lookupValue) {
            flash.message = "lookupValue.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Lookup Value not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ lookupValue : lookupValue ]
        }
    }

    def update = {
        def lookupValue = LookupValue.get( params.id )
        if(lookupValue) {
            lookupValue.properties = params
            if(!lookupValue.hasErrors() && lookupValue.save()) {
                Lookup.resetThis(lookupValue.lookup.realm)
                flash.message = "lookupValue.updated"
                flash.args = [params.id]
                flash.defaultMessage = "Lookup Value ${params.id} updated"
                redirect(action:show,id:lookupValue.id)
            }
            else {
                render(view:'edit',model:[lookupValue:lookupValue])
            }
        }
        else {
            flash.message = "lookupValue.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Lookup Value not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def lookupValue = new LookupValue()
        lookupValue.properties = params
        lookupValue.lookup = lookupService.source(session, [controller: params.controller, action: "list"], "lookup.list")
        return ['lookupValue':lookupValue]
    }

    def save = {
        def lookupValue = new LookupValue(params)
        if(!lookupValue.hasErrors() && lookupValue.save()) {
            Lookup.resetThis(lookupValue.lookup.realm)
            flash.message = "lookupValue.created"
            flash.args = ["${lookupValue.id}"]
            flash.defaultMessage = "Lookup Value ${lookupValue.id} created"
            redirect(action:show,id:lookupValue.id)
        }
        else {
            render(view:'create',model:[lookupValue:lookupValue])
        }
    }
}