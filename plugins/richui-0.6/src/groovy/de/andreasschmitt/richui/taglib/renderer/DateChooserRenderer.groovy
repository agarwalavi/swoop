package de.andreasschmitt.richui.taglib.renderer

import groovy.xml.MarkupBuilder
import org.codehaus.groovy.grails.web.taglib.GroovyPageTagBody
import java.text.SimpleDateFormat
import java.text.DateFormat

/*
*
* @author Andreas Schmitt
*/
class DateChooserRenderer extends AbstractRenderer {
	
	protected void renderTagContent(Map attrs, MarkupBuilder builder) throws RenderException {
		renderTagContent(attrs, null, builder)
	}
	
	protected void renderTagContent(Map attrs, GroovyPageTagBody body, MarkupBuilder builder) throws RenderException {
		String id = "c" + RenderUtils.getUniqueId()
		String inputId = "i" + RenderUtils.getUniqueId()
		
		if(!attrs.id){
			attrs.id = attrs.name
		}
		
		if(!attrs?.'class'){
			attrs.'class' = ""
		}
		
		if(!attrs?.style){
			attrs.style = ""
		}
		
		if(!attrs.timezone) {
            attrs.timezone = TimeZone.getDefault()
		}
		
		String formattedValue = ""
		String day = ""
		String month = ""
		String year = ""
		String hour = "00"
		String minute = "00"
		
		if(attrs?.value) {
			try {
				DateFormat fmt = new SimpleDateFormat(attrs.format)
				fmt.setTimeZone(attrs.timezone)
				formattedValue = fmt.format(attrs.value)
				
				Calendar cal = new GregorianCalendar(attrs.timezone)
				cal.setTime(attrs.value)
				day = Integer.toString(cal.get(Calendar.DAY_OF_MONTH))
				month = Integer.toString(cal.get(Calendar.MONTH)+1)
				year = Integer.toString(cal.get(Calendar.YEAR))
				
				hour = Integer.toString(cal.get(Calendar.HOUR_OF_DAY))
				if(hour == "0"){
					hour = "00"
				}
				
				minute = Integer.toString(cal.get(Calendar.MINUTE))
				if(minute == "0"){
					minute = "00"
				}
			}
			catch(Exception e){
				log.error("Error formatting date", e)
			}
		}		
		
		//Default HTML attributes
		Map htmlAttributes = ["class": "${attrs?.'class'}", style: "${attrs?.style}", type:"text", name: "${inputId}", id: "${inputId}", value: "${formattedValue}"]

		//Add additional attributes
		attrs.each { key, value ->
			if(key.startsWith("html:")){
				htmlAttributes[key.replace("html:", "")] = value
			}
		}		
		
		builder.input(htmlAttributes)
		//builder.input("class": "${attrs?.'class'}", style: "${attrs?.style}", type:"text", name: "${inputId}", id: "${inputId}", value: "${formattedValue}", "")
		builder.div("id": id, "class": "datechooser yui-skin-sam", "")
			
		builder.script(type: "text/javascript"){
			builder.yieldUnescaped "	var dateChooser = new DateChooser();\n"
			builder.yieldUnescaped "	dateChooser.setDisplayContainer(\"$id\");\n"
			builder.yieldUnescaped "	dateChooser.setInputId(\"${inputId}\");\n"
			builder.yieldUnescaped "	dateChooser.setStructId(\"${attrs?.id}\");\n"
			builder.yieldUnescaped "	dateChooser.setFormat(\"${attrs?.format}\");\n"
			if(attrs?.locale){
				builder.yieldUnescaped "	dateChooser.setLocale(\"${attrs?.locale}\");\n"
			}
			
			if(attrs?.firstDayOfWeek){
				Map days = [su: 0, mo: 1, tu: 2, we: 3, th: 4, fr: 5, sa: 6]
				
				if(days.containsKey(attrs.firstDayOfWeek.toLowerCase())){
					String dayOfWeek = days[attrs.firstDayOfWeek.toLowerCase()]
					builder.yieldUnescaped "	dateChooser.setFirstDayOfWeek(\"${dayOfWeek}\");\n"	
				}
			}
			builder.yieldUnescaped "	dateChooser.init();\n"
		}
		
		builder.input(type: "hidden", name: "${attrs?.name}", id: "${attrs?.id}", value: "struct")
		
		if(attrs?.time){
			builder.input("class": "${attrs?.hourClass}", style: "${attrs?.hourStyle}", type: "text", name: "${attrs?.name}_hour", id: "${attrs?.id}_hour", value: hour)
			builder.yieldUnescaped ":"
			builder.input("class": "${attrs?.minuteClass}", style: "${attrs?.minuteStyle}", type: "text", name: "${attrs?.name}_minute", id: "${attrs?.id}_minute", value: minute)	
		
		}
		
		builder.input(type: "hidden", name: "${attrs?.name}_day", id: "${attrs?.id}_day", value: day)
		builder.input(type: "hidden", name: "${attrs?.name}_month", id: "${attrs?.id}_month", value: month)
		builder.input(type: "hidden", name: "${attrs?.name}_year", id: "${attrs?.id}_year", value: year)
	}
	
	protected void renderResourcesContent(Map attrs, MarkupBuilder builder, String resourcePath) throws RenderException {			
		builder.yieldUnescaped "<!-- DateChooser -->"
		
		String yuiResourcePath = YuiUtils.getResourcePath(resourcePath, attrs?.remote != null)
		
		if(attrs?.skin){
			if(attrs.skin == "default"){
				builder.link(rel: "stylesheet", type: "text/css", href: "$resourcePath/css/datechooser.css")
			}
			else {
				String applicationResourcePath = RenderUtils.getApplicationResourcePath(resourcePath)
				builder.link(rel: "stylesheet", type: "text/css", href: "${applicationResourcePath}/css/${attrs.skin}.css")
			}
		}
		else {
			builder.link(rel: "stylesheet", type: "text/css", href: "$resourcePath/css/datechooser.css")	
		}
		
		builder.link(rel: "stylesheet", type: "text/css", href: "$yuiResourcePath/calendar/assets/calendar.css")
		builder.link(rel: "stylesheet", type: "text/css", href: "$yuiResourcePath/calendar/assets/skins/sam/calendar.css")
		builder.script(type: "text/javascript", src: "$yuiResourcePath/yahoo-dom-event/yahoo-dom-event.js", "")
		builder.script(type: "text/javascript", src: "$resourcePath/js/datechooser/datechooser.js", "")
		builder.script(type: "text/javascript", src: "$yuiResourcePath/calendar/calendar-min.js", "")
	}
}