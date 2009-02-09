class LookupsGrailsPlugin {
    def version = 1.0
    def dependsOn = [:]

    // TODO Fill in these fields
    def author = "Paul Fernley"
    def authorEmail = "paul@pfernley.orangehome.co.uk"
    def title = "Application lookup (reference tables) plugin"
    def description = '''\
This plugin allows the creation and maintenance of pseudo reference (lookup)
tables. Within the lookup system, you create 'realms' such as 'countries' or
'order.status' and can then create code/value pairs within those realms. The
plugin comes with lookup and lookupValue controllers with associated screens
that presume you are using a layout called main.
'''

    // URL to the plugin's documentation
    def documentation = "http://grails.org/Lookups+Plugin"

    def doWithSpring = {
        // TODO Implement runtime spring config (optional)
    }
   
    def doWithApplicationContext = { applicationContext ->
        // TODO Implement post initialization spring config (optional)		
    }

    def doWithWebDescriptor = { xml ->
        // TODO Implement additions to web.xml (optional)
    }
	                                      
    def doWithDynamicMethods = { ctx ->
        // TODO Implement registering dynamic methods to classes (optional)
    }
	
    def onChange = { event ->
        // TODO Implement code that is executed when any artefact that this plugin is
        // watching is modified and reloaded. The event contains: event.source,
        // event.application, event.manager, event.ctx, and event.plugin.
    }

    def onConfigChange = { event ->
        // TODO Implement code that is executed when the project configuration changes.
        // The event is the same as for 'onChange'.
    }
}
