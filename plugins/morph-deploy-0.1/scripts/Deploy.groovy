

Ant.property(environment:"env")
grailsHome = Ant.antProject.properties."env.GRAILS_HOME"

includeTargets << grailsScript("Init")

target ('default': "Deploys your application to Mor.ph") {
	depends( checkVersion)
	
	def warName
	if (args) {
	    warName = args[0]
	} else {
	    warName = "${grailsAppName}-${grailsAppVersion}.war"
    }
	if (!new File(warName).exists()) {
	    event('StatusFinal', ["Unable to deploy, you need to run the 'war' task first or specify a WAR name"])
	    exit(1)
	}
	
	if (!new File('morph_deploy.properties').exists()) {
	    event('StatusFinal', ["Unable to deploy, you need to have morph_deploy.properties in your project directory. Download it from Mor.ph"])
	    exit(1)
	}

	if (!new File('morph-deploy.jar').exists()) {
	    event('StatusFinal', ["Unable to deploy, you need to have morph-deploy.jar in your project directory. Download it from Mor.ph"])
	    exit(1)
	}

    println "This will deploy the file ${warName}"

    Ant.input(message:"Enter your Mor.ph username:", addProperty:"morphusername")
    Ant.input(message:"Enter your Mor.ph password:", addProperty:"morphpassword")
    
    println "Please wait..."
    
	Ant.java(jar:'morph-deploy.jar', fork:true) {
	    arg(value:"--user")
	    arg(value:Ant.antProject.properties.morphusername)
	    arg(value:"--password")
	    arg(value:Ant.antProject.properties.morphpassword)
	    arg(value:warName)
	}
}                            
