package de.andreasschmitt.richui.taglib.renderer

import groovy.xml.MarkupBuilder
import org.codehaus.groovy.grails.web.taglib.GroovyPageTagBody

/*
*
* @author Andreas Schmitt
*/
class RatingRenderer extends AbstractRenderer {
	
	protected void renderTagContent(Map attrs, MarkupBuilder builder) throws RenderException {
		renderTagContent(attrs, null, builder)
	}
	
	protected void renderTagContent(Map attrs, GroovyPageTagBody body, MarkupBuilder builder) throws RenderException {
		String id = "r" + RenderUtils.getUniqueId()
		int imageWidth = 30
		int currentRating = attrs?.rating * imageWidth
		int units = attrs?.units * imageWidth
		String currentRatingId = "r" + RenderUtils.getUniqueId()
				
		String updateId = id
		if(attrs?.updateId) {
			updateId = attrs.updateId
		}
		
		if(!attrs?.inputId){
			attrs.inputId = "r" + RenderUtils.getUniqueId()
		}
		if(!attrs?.inputName){
			attrs.inputName = "rating"
		}
		
		builder.div(id: "${id}"){
			div("class": "ratingblock"){
				div(id: "unit_long$id"){
					if(attrs?.dynamic){
						ul(id: "unit_ul$id", "class": "unit-rating", style: "width: ${units}px"){
							li(id: "${currentRatingId}", "class": "current-rating", style:  "width: ${currentRating}px;", "Currently $attrs.rating")
							for(i in 1..attrs.units){
								li(){
									if(attrs?.noAjax){
										a("class": "r${i}-unit rater", onclick: "window.document.getElementById('${attrs.inputId}').value = ${i}; window.document.getElementById('${currentRatingId}').style.width = '${i * imageWidth}px'; window.document.getElementById('${currentRatingId}').innerHTML = 'Currently ${i}';", "${i}")
									}
									else {
										String link = attrs.link.replace(":class:", "r${i}-unit rater").replace(":title:", "$i").replace("update", "${updateId}").replace("number", "$i").replace("%3Arating%3A", "${i}")
										builder.yieldUnescaped "$link"	
									}
								}
							}
						}
					}
					else {
						ul(id: "unit_ul$id", "class": "unit-rating", style: "width: ${units}px"){
							li("class": "current-rating", style:  "width: ${currentRating}px;", "Currently $attrs.rating")
						}
					}
					
					if(attrs.showCurrent){
						p("class": "static"){
							strong(attrs?.rating)
						}
					}
				}
			}
			
			if(attrs?.noAjax){
				input(id: attrs.inputId, name: attrs.inputName, type: "hidden")
			}
		}
	}
	
	protected void renderResourcesContent(Map attrs, MarkupBuilder builder, String resourcePath) throws RenderException {			
		builder.yieldUnescaped "<!-- Rating -->"
		builder.script(type: "text/javascript", src: "$resourcePath/js/prototype/prototype.js", "")
		builder.script(type: "text/javascript", src: "$resourcePath/js/rating/behavior.js", "")
		builder.script(type: "text/javascript", src: "$resourcePath/js/rating/rating.js", "")
		//builder.link(rel: "stylesheet", href: "$resourcePath/css/rating.css", "")
		
		if(attrs?.skin){
			if(attrs.skin == "default"){
				builder.link(rel: "stylesheet", href: "$resourcePath/css//rating.css", "")
			}
			else {
				String applicationResourcePath = RenderUtils.getApplicationResourcePath(resourcePath)
				builder.link(rel: "stylesheet", type: "text/css", href: "${applicationResourcePath}/css/${attrs.skin}.css")
			}
		}
		else {
			builder.link(rel: "stylesheet", href: "$resourcePath/css//rating.css", "")	
		}
	}
}