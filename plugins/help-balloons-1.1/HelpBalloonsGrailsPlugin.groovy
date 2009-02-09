class HelpBalloonsGrailsPlugin {
    def version = 1.1
    def dependsOn = [:]

    // TODO Fill in these fields
    def author = "Paul Fernley"
    def authorEmail = "paul@pfernley.orangehome.co.uk"
    def title = "Grails TagLib plugin for the HelpBalloon system from Beau Scott"
    def description = '''\
The help-balloons plugin provides a Grails TagLib wrapper around the HelpBalloon
system from Beau Scott. This plugin provides the most basic support possible to
give a simple balloon help (a.k.a. Callout) facility in GSPs typically for use
in intranet applications.
'''

    // URL to the plugin's documentation
    def documentation = "http://grails.org/HelpBalloons+Plugin"

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
