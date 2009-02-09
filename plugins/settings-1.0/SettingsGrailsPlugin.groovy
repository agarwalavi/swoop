class SettingsGrailsPlugin {
    def version = 1.0
    def dependsOn = [:]

    // TODO Fill in these fields
    def author = "Paul Fernley"
    def authorEmail = "paul@pfernley.orangehome.co.uk"
    def title = "Application settings (global constants) plugin"
    def description = '''\
Allows for the creation, maintenance and use of system-wide application settings
(global constants) stored in a database. The values of the various settings can
be of type String, Intger, BigDecimal or Date. The usual List, Show, Edit and
Create views are included and, after installing the plugin, will be available at
a URL such as http://myServer/myApp/setting/list etc. These views assume you are
using a layout called 'main'.
'''

    // URL to the plugin's documentation
    def documentation = "http://grails.org/Settings+Plugin"

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
