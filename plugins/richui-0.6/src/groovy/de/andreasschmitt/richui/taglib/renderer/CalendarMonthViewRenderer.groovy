package de.andreasschmitt.richui.taglib.renderer

import groovy.xml.MarkupBuilder
import org.codehaus.groovy.grails.web.taglib.GroovyPageTagBody
import java.text.SimpleDateFormat
import java.util.regex.*

/*
*
* @author Andreas Schmitt
*/
class CalendarMonthViewRenderer extends AbstractRenderer {

	protected void renderTagContent(Map attrs, MarkupBuilder builder) throws RenderException {
		renderTagContent(attrs, null, builder)
	}
	
	protected void renderTagContent(Map attrs, GroovyPageTagBody body, MarkupBuilder builder) throws RenderException {
		if(!attrs?.month){
			attrs.month = new Date()
		}
		
		if(!attrs?.createLink){
			attrs?.createLink = "true"
		}
		
		Calendar calendarToday = new GregorianCalendar()
		
		Calendar calendar = new GregorianCalendar()
		calendar.setTime(attrs.month)
		calendar.set(GregorianCalendar.DAY_OF_MONTH, 1)
		
		int month = calendar.get(GregorianCalendar.MONTH) + 1
		int year = calendar.get(GregorianCalendar.YEAR)
		int maxDaysOfMonth = calendar.getActualMaximum(GregorianCalendar.DAY_OF_MONTH)
		
		Map daysOfWeek = [0: GregorianCalendar.MONDAY, 1: GregorianCalendar.TUESDAY, 2: GregorianCalendar.WEDNESDAY,
		                  3: GregorianCalendar.THURSDAY, 4: GregorianCalendar.FRIDAY, 5: GregorianCalendar.SATURDAY,
		                  6: GregorianCalendar.SUNDAY]
		
		Map events = [:]

		//Date range pattern
		Pattern pattern = Pattern.compile("(.*)-(.*)")
		
		for(int i = 1; i <= maxDaysOfMonth; i++){
			attrs?.items?.each { item ->			
				
				attrs?.constraintDateFields?.each { constraintDateField ->

					//Date range
					Matcher matcher = pattern.matcher(constraintDateField)
					if(matcher.matches()){
						String constraintDateFieldStart = matcher.group(1)
						String constraintDateFieldEnd = matcher.group(2)
						
						Calendar calendarStart = new GregorianCalendar()
						calendarStart.setTime(item?."${constraintDateFieldStart}")
						
						Calendar calendarEnd = new GregorianCalendar()
						calendarEnd.setTime(item?."${constraintDateFieldEnd}")
						
						Calendar calendarItem = new GregorianCalendar(attrs.month.year + 1900, attrs.month.month, i)
						
						if(calendarItem.compareTo(calendarStart) >= 0 && calendarItem.compareTo(calendarEnd) <= 0){
							List eventItems = []
							if(events.containsKey(i)){
								eventItems = events[i]
							}
							
							if(!eventItems.contains(item)){
								eventItems.add(item)
								events[i] = eventItems
							}
						}
					}
					else if(item?."${constraintDateField}".month == attrs.month.month && item?."${constraintDateField}".year == attrs.month.year){
						List eventItems = []
						if(events.containsKey(item."${constraintDateField}".date)){
							eventItems = events[item."${constraintDateField}".date]
						}
						
						if(!eventItems.contains(item)){
							eventItems.add(item)
							events[item."${constraintDateField}".date] = eventItems
						}
					}
				}
			}
		}
		
		def teaser = { String value, int length ->
			if(value.length() > length){
				return value.substring(0, length) + "..."
			}
			else {
				return value
			}
		}
		
		builder.table("class": "calendar"){
			thead {
				tr {
					if(attrs?.weekOfYear && attrs?.weekOfYear == "true"){
						th(attrs?.week)
					}
					th(attrs?.weekDays?.monday)
					th(attrs?.weekDays?.tuesday)
					th(attrs?.weekDays?.wednesday)
					th(attrs?.weekDays?.thursday)
					th(attrs?.weekDays?.friday)
					th(attrs?.weekDays?.saturday)
					th(attrs?.weekDays?.sunday)
				}
			}
			tbody {
				int day = 1
				int lastWeek = 0
				for(int i = 0; i < 6; i++){
					tr {
						//Show week of Year
						if(attrs?.weekOfYear && attrs?.weekOfYear == "true"){
							td("class": "weekOfYear") {
								if(day <= maxDaysOfMonth){
									int weekOfYear = calendar.get(GregorianCalendar.WEEK_OF_YEAR)
									
									// Sometimes there are 53 or 54 weeks
									if(weekOfYear >= 1 && lastWeek >= 52){
										weekOfYear = lastWeek + 1
									}
									
									if(attrs?.weekAction){
										a(href: "${attrs.weekUrl}?week=${weekOfYear}&year=${calendar.get(GregorianCalendar.YEAR)}"){
											h1(weekOfYear)	
										}
									}
									else {
										h1(weekOfYear)	
									}
									
									lastWeek = weekOfYear
								}
							}
						}
						
						for(int k = 0; k < 7; k++){
							int dayOfWeek = calendar.get(GregorianCalendar.DAY_OF_WEEK)
							int dayOfMonth = calendar.get(GregorianCalendar.DAY_OF_MONTH)
							
							if(dayOfWeek == daysOfWeek[k] && day <= maxDaysOfMonth){								
								boolean today = calendar.get(GregorianCalendar.DAY_OF_WEEK) == calendarToday.get(GregorianCalendar.DAY_OF_WEEK) && calendar.get(GregorianCalendar.DAY_OF_MONTH) == calendarToday.get(GregorianCalendar.DAY_OF_MONTH) && calendar.get(GregorianCalendar.YEAR) == calendarToday.get(GregorianCalendar.YEAR)
								
								td("class": "${today ? 'today ' : ''}day ${day % 2 ? 'evenDay' : 'oddDay'} ${events.containsKey(day) ? 'dayWithItems' : ''}"){
									if(attrs?.dayAction){
										a(href: "${attrs.dayUrl}?day=${day}&month=${month}&year=${year}"){
											h1(day)	
										}
									}
									else {
										h1(day)	
									}
									
									ul {
										if(events.containsKey(day)){
											events[day].each { eventItem ->										
												li {
													String title = eventItem.toString()
													if(attrs?.displayField){
														try {
															title = eventItem."${attrs.displayField}"	
														}
														catch(Exception e){
															//log.error("Unexpected error using displayField", e)
														}
													}
													
													//Teaser
													if(attrs?.teaser && attrs?.teaser == "true"){
														int teaserLength = 30
														if(attrs?.teaserLength){
															try {
																teaserLength = new Integer(attrs.teaserLength)
															}
															catch(Exception e){
																//log.error("Unexpected error creating teaser", e)
															}
														}
														
														title = teaser(title, teaserLength)
													}
													
													if(attrs?.createLink == "true"){
														a(href: attrs.itemUrl.replace("itemId", "${eventItem?.id}"), title)
													}
													else {
														span(title)
													}
												}
											}	
										}
									}
								}
								calendar.add(GregorianCalendar.DAY_OF_MONTH, 1)
								day += 1
							}
							else {
								td("class": "day outsideOfMonth")
							}
						}	
					}
				}
			}
		}
	}
	
	protected void renderResourcesContent(Map attrs, MarkupBuilder builder, String resourcePath) throws RenderException {			
		builder.yieldUnescaped "<!-- Calendar Month View -->"
		
		if(!attrs.skin || attrs.skin == "default"){
			builder.link(rel: "stylesheet", type: "text/css", href: "$resourcePath/css/calendarmonthview.css")	
		}
		else {
			String applicationResourcePath = RenderUtils.getApplicationResourcePath(resourcePath)
			builder.link(rel: "stylesheet", type: "text/css", href: "${applicationResourcePath}/css/${attrs.skin}.css")
		}
	}

}