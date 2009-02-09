
// Remove the JDBC jar before the war is bundled
eventWarStart = { warName ->
    if (grailsEnv == "production") {
        println "Removing JDBC 2 Extensions JAR from WAR for Mor.ph deployment"
        Ant.delete(file:"${stagingDir}/WEB-INF/lib/jdbc2_0-stdext.jar")
    }
}