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
public class YahooMapsRenderer extends AbstractRenderer {

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
			builder.yieldUnescaped "	var ${attrs.mapIntegrationVar} = new YMap(document.getElementById('${attrs.id}'));\n"
			builder.yieldUnescaped "	${attrs.mapIntegrationVar}.addTypeControl();\n"
			builder.yieldUnescaped "	${attrs.mapIntegrationVar}.addZoomLong();\n"
			builder.yieldUnescaped "	${attrs.mapIntegrationVar}.addPanControl();\n"
			//YAHOO_MAP_SAT, YAHOO_MAP_HYB, YAHOO_MAP_REG
			builder.yieldUnescaped "	${attrs.mapIntegrationVar}.setMapType(YAHOO_MAP_REG);\n"
			
			builder.yieldUnescaped "	 function addMarker(latitude, longitude, draggable, description){\n"   
			builder.yieldUnescaped "	 	var pos = new YGeoPoint(latitude, longitude);\n"
			builder.yieldUnescaped "	 	var marker = new YMarker(pos);\n"  
			builder.yieldUnescaped "	 	marker.addAutoExpand(description);\n"      
			builder.yieldUnescaped "	 	YEvent.Capture(marker, EventsList.MouseClick,\n"   
			builder.yieldUnescaped "	 	         function(){\n"
			builder.yieldUnescaped "	 	              marker.openSmartWindow(description);\n"  
			builder.yieldUnescaped "	 	         });\n"  
			builder.yieldUnescaped "	 	${attrs.mapIntegrationVar}.addOverlay(marker);\n"  
			builder.yieldUnescaped "	 }\n" 
			
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
				
			if("${attrs?.lat}" == "" && "${attrs?.lng}" == ""){
				if(attrs?.markers?.size() > 0){
					Map marker = attrs.markers[0]
					String latitude = marker.latitude
					String longitude = marker.longitude
					builder.yieldUnescaped "	var startPos = new YGeoPoint(${latitude}, ${longitude});\n"
					builder.yieldUnescaped "	${attrs.mapIntegrationVar}.drawZoomAndCenter(startPos, ${attrs.zoomLevel});\n"
					builder.yieldUnescaped "	${attrs.mapIntegrationVar}.addMarker(startPos);\n"
				}
			}
			else {
				builder.yieldUnescaped "	var startPos = new YGeoPoint(${attrs.lat}, ${attrs.lng});\n"
				builder.yieldUnescaped "	${attrs.mapIntegrationVar}.drawZoomAndCenter(startPos, ${attrs.zoomLevel});\n"				
				builder.yieldUnescaped "	${attrs.mapIntegrationVar}.addMarker(startPos);\n"
			}
		}
	}
	
	protected void renderResourcesContent(Map attrs, MarkupBuilder builder, String resourcePath) throws RenderException {			
		builder.yieldUnescaped "<!-- Yahoo Maps -->"
		
		if(!attrs?.key){
			throw new RenderException("Attribute 'key' is required")
		}
		
		if(!attrs?.version){
			attrs.version = "3.8"
		}
		
		if(attrs?.skin){
			if(attrs.skin == "default"){
				//builder.link(rel: "stylesheet", type: "text/css", href: "$resourcePath/css/yahoomaps.css")
			}
			else {
				String applicationResourcePath = RenderUtils.getApplicationResourcePath(resourcePath)
				builder.link(rel: "stylesheet", type: "text/css", href: "${applicationResourcePath}/css/${attrs.skin}.css")
			}
		}
		else {
			//builder.link(rel: "stylesheet", type: "text/css", href: "$resourcePath/css/yahoomaps.css")	
		}
		
		builder.script(type: "text/javascript", src: "http://api.maps.yahoo.com/ajaxymap?v=${attrs.version}&appid=${attrs.key}", "")
	}
	
}
