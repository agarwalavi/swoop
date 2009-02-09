/**
 * 
 */
package de.andreasschmitt.richui.taglib.renderer

import groovy.xml.MarkupBuilder
import org.codehaus.groovy.grails.web.taglib.GroovyPageTagBody

/**
 * @author andreas
 *
 */
public class MicrosoftVirtualEarthRenderer extends AbstractRenderer {

	protected void renderTagContent(Map attrs, MarkupBuilder builder) throws RenderException {
		renderTagContent(attrs, null, builder)
	}
	
	protected void renderTagContent(Map attrs, GroovyPageTagBody body, MarkupBuilder builder) throws RenderException {
		String id = "m" + RenderUtils.getUniqueId()
		
		if(!attrs.id){
			attrs.id = id
		}
		
		if(!attrs?.'class'){
			attrs.'class' = ""
		}
		
		if(!attrs?.style){
			attrs.style = ""
		}
		
		if(!attrs?.mapIntegrationVar){
			attrs.mapIntegrationVar = "map" + RenderUtils.getUniqueId()
		}
		
		if(!attrs?.zoomLevel){
			attrs.zoomLevel = 5
		}
		
		//Default HTML attributes
		Map htmlAttributes = [id: attrs?.id, "class": "${attrs?.mapStyleClass}", style: "${attrs?.mapStyle}"]

		//Add additional attributes
		attrs.each { key, value ->
			if(key.startsWith("html:")){
				htmlAttributes[key.replace("html:", "")] = value
			}
		}		
		
		builder.div(htmlAttributes)			
		builder.script(type: "text/javascript"){			
			builder.yieldUnescaped "	var ${attrs.mapIntegrationVar} = new VEMap('${attrs.id}');\n"

			// Control size
			if(attrs?.small){
				builder.yieldUnescaped "	${attrs.mapIntegrationVar}.SetDashboardSize(VEDashboardSize.Small);"
			}
			else if(attrs?.tiny){
				builder.yieldUnescaped "	${attrs.mapIntegrationVar}.SetDashboardSize(VEDashboardSize.Tiny);"
			}
			else {
				builder.yieldUnescaped "	${attrs.mapIntegrationVar}.SetDashboardSize(VEDashboardSize.Normal);"	
			}
			
			builder.yieldUnescaped "	 function addMarker(latitude, longitude, draggable, description){\n"   
			builder.yieldUnescaped "	 	var marker = new VEShape(VEShapeType.Pushpin, new VELatLong(latitude, longitude));\n"
			builder.yieldUnescaped "	    marker.SetDescription(description);\n"
			builder.yieldUnescaped "	    ${attrs.mapIntegrationVar}.AddShape(marker);\n"  
			builder.yieldUnescaped "	 }\n" 

			if("${attrs?.lat}" == "" && "${attrs?.lng}" == ""){
				if(attrs?.markers?.size() > 0){
					Map marker = attrs.markers[0]
					String latitude = marker.latitude
					String longitude = marker.longitude
					builder.yieldUnescaped "	${attrs.mapIntegrationVar}.LoadMap(new VELatLong(${latitude}, ${longitude}), ${attrs.zoomLevel} ,'h' ,false);\n"
					builder.yieldUnescaped "	addMarker(${latitude}, ${latitude}, false, '');\n"
				}
				else {
					builder.yieldUnescaped "	${attrs.mapIntegrationVar}.LoadMap();\n"
				}
			}
			else {
				builder.yieldUnescaped "	${attrs.mapIntegrationVar}.LoadMap(new VELatLong(${attrs.lat}, ${attrs.lng}), ${attrs.zoomLevel} ,'h' ,false);\n"
				builder.yieldUnescaped "	addMarker(${attrs.lat}, ${attrs.lng}, false, '');\n"
			}
			
			//Markers
			if(attrs?.markers){
				attrs.markers.each {
					try {
						builder.yieldUnescaped "	addMarker(${it.latitude}, ${it.longitude}, ${it.draggable}, '${it.description}');\n"
					}
					catch(exception) {
						println exception
					}
				}	
			}
			
			builder.yieldUnescaped "	${attrs.mapIntegrationVar}.SetMapStyle(VEMapStyle.Road);\n"
		}
	}
	
	protected void renderResourcesContent(Map attrs, MarkupBuilder builder, String resourcePath) throws RenderException {			
		builder.yieldUnescaped "<!-- Virtual Earth -->"
		
		if(!attrs?.version){
			attrs.version = "6.2"
		}
		
		if(attrs?.skin){
			if(attrs.skin == "default"){
				//builder.link(rel: "stylesheet", type: "text/css", href: "$resourcePath/css/virtualearth.css")
			}
			else {
				String applicationResourcePath = RenderUtils.getApplicationResourcePath(resourcePath)
				builder.link(rel: "stylesheet", type: "text/css", href: "${applicationResourcePath}/css/${attrs.skin}.css")
			}
		}
		else {
			//builder.link(rel: "stylesheet", type: "text/css", href: "$resourcePath/css/virtualearth.css")	
		}
		
		builder.script(type: "text/javascript", src: "http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=${attrs.version}", "")
	}
	
}
