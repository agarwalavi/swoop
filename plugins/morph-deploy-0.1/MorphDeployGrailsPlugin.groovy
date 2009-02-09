import grails.util.GrailsUtil
import org.codehaus.groovy.grails.commons.GrailsApplication

class MorphDeployGrailsPlugin {
    def version = 0.1
    def dependsOn = [:]

    // TODO Fill in these fields
    def author = "Marc Palmer"
    def authorEmail = "marc@anyware.co.uk"
    def title = "Deploy applications to Mor.ph hosting"
    def description = '''\
Adds the JNDI datasource and mail sessions for Mor.ph hosting and provides deploy script
'''

    // URL to the plugin's documentation
    def documentation = "http://grails.org/MorphDeploy+Plugin"

    def doWithWebDescriptor = { xml ->
		if(GrailsUtil.environment == GrailsApplication.ENV_PRODUCTION){
			xml << {
			    'resource-ref' {
        			description "Morphlabs Datasource"
        			'res-ref-name'("jdbc/morph-ds")
        			'res-type'("javax.sql.DataSource")
        			'res-auth'("Container")
    			}
			}
			
			xml << {
			    'resource-ref' {
    			    description "Morphlabs Mail Session"
                    'res-ref-name'('mail/Session')
                    'res-type'('javax.mail.Session')
                    'res-auth'('Container')
                }
            }
		}
    }
	                                      
}
