import de.andreasschmitt.richui.taglib.renderer.*

/*
*
* @author Andreas Schmitt
*/
class RichUIResourceTagLib {
	
	static namespace = "resource"
	Renderer accordionRenderer
	Renderer autoCompleteRenderer
	Renderer dateChooserRenderer
	Renderer calendarMonthViewRenderer
	Renderer calendarDayViewRenderer
	Renderer calendarWeekViewRenderer
	Renderer carouselRenderer
	Renderer checkedTreeViewRenderer
	Renderer flowRenderer
	Renderer mapRenderer
	Renderer portletRenderer
	Renderer portletViewRenderer
	Renderer ratingRenderer
	Renderer tabViewRenderer
	Renderer tagCloudRenderer
	Renderer timelineRenderer
	Renderer tooltipRenderer
	Renderer treeViewRenderer
	Renderer reflectionImageRenderer
	Renderer richTextEditorRenderer
	Renderer sliderRenderer
	Renderer googleMapsRenderer
	Renderer yahooMapsRenderer
	Renderer microsoftVirtualEarthRenderer
	
	def autoComplete = { attrs ->	
		//Render output
		try {
			out << autoCompleteRenderer.renderResources(attrs, request?.contextPath)
		}
		catch(RenderException e){
			log.error(e)
		}	
	}
	
	def calendarMonthView = { attrs ->
		//Render output
		try {
			out << calendarMonthViewRenderer.renderResources(attrs, request?.contextPath)
		}
		catch(RenderException e){
			log.error(e)
		}
	}
	
	def calendarDayView = { attrs ->
		//Render output
		try {
			out << calendarDayViewRenderer.renderResources(attrs, request?.contextPath)
		}
		catch(RenderException e){
			log.error(e)
		}
	}
	
	def calendarWeekView = { attrs ->
		//Render output
		try {
			out << calendarWeekViewRenderer.renderResources(attrs, request?.contextPath)
		}
		catch(RenderException e){
			log.error(e)
		}
	}
	
	def carousel = { attrs ->
		//Render output
		try {
			out << carouselRenderer.renderResources(attrs, request?.contextPath)
		}
		catch(RenderException e){
			log.error(e)
		}
	}
	
	def dateChooser = {	attrs ->
		//Render output
		try {
			out << dateChooserRenderer.renderResources(attrs, request?.contextPath)
		}
		catch(RenderException e){
			log.error(e)
		}
	}
	
	def map = { attrs ->	
		//Render output
		try {
			if(attrs?.type){
				switch(attrs.type.toLowerCase()){
					case "yahoomaps":
						out << yahooMapsRenderer.renderResources(attrs, request?.contextPath)
						break
						
					case "microsoftvirtualearth":
						out << microsoftVirtualEarthRenderer.renderResources(attrs, request?.contextPath)
						break
						
					case "googlemaps":
						out << googleMapsRenderer.renderResources(attrs, request?.contextPath)
						break	
						
					default:
						out << mapRenderer.renderResources(attrs, request?.contextPath)	
				}
			}
			else {
				out << mapRenderer.renderResources(attrs, request?.contextPath)
			}
		}
		catch(RenderException e){
			log.error(e)
		}
	}
	
	def rating = { attrs ->
		//Render output
		try {
			out << ratingRenderer.renderResources(attrs, request?.contextPath)
		}
		catch(RenderException e){
			log.error(e)
		}
	}
	
	def tabView = { attrs ->
		//Render output
		try {
			out << tabViewRenderer.renderResources(attrs, request?.contextPath)
		}
		catch(RenderException e){
			log.error(e)
		}
	}
	
	def tagCloud = { attrs ->
		//Render output
		try {
			out << tagCloudRenderer.renderResources(attrs, request?.contextPath)
		}
		catch(RenderException e){
			log.error(e)
		}		
	}
	
	def timeline = { attrs ->
		//Render output
		try {
			out << timelineRenderer.renderResources(attrs, request?.contextPath)
		}
		catch(RenderException e){
			log.error(e)
		}		
	}
	
	def tooltip = { attrs ->
		//Render output
		try {
			out << tooltipRenderer.renderResources(attrs, request?.contextPath)
		}
		catch(RenderException e){
			log.error(e)
		}		
	}
	
	def treeView = { attrs ->	
		//Render output
		try {
			out << treeViewRenderer.renderResources(attrs, request?.contextPath)
		}
		catch(RenderException e){
			log.error(e)
		}
	}
	
	def reflectionImage = { attrs ->
		//Render output
		try {
			out << reflectionImageRenderer.renderResources(attrs, request?.contextPath)
		}
		catch(RenderException e){
			log.error(e)
		}	
	}
	
	def richTextEditor = { attrs ->
		//Render output
		try {
			out << richTextEditorRenderer.renderResources(attrs, request?.contextPath)
		}
		catch(RenderException e){
			log.error(e)
		}	
	}
	
	def portlet = { attrs ->
		//Render output
		try {
			out << portletRenderer.renderResources(attrs, request?.contextPath)
		}
		catch(RenderException e){
			log.error(e)
		}	
	}
	
	def portletView = { attrs ->
		//Render output
		try {
			out << portletViewRenderer.renderResources(attrs, request?.contextPath)
		}
		catch(RenderException e){
			log.error(e)
		}	
	}
	
	def flow = { attrs ->
		//Render output
		try {
			out << flowRenderer.renderResources(attrs, request?.contextPath)
		}
		catch(RenderException e){
			log.error(e)
		}	
	}
	
	def accordion = { attrs ->
		//Render output
		try {
			out << accordionRenderer.renderResources(attrs, request?.contextPath)
		}
		catch(RenderException e){
			log.error(e)
		}	
	}
	
	 def checkedTreeView = { attrs ->
	 	//Render output
	    try {
	    	out << checkedTreeViewRenderer.renderResources(attrs, request?.contextPath)
	    }
	    catch(RenderException e){
	    	log.error(e)
	    }
	}
	
	 def slider = { attrs ->
	 	//Render output
	    try {
	    	out << sliderRenderer.renderResources(attrs, request?.contextPath)
	    }
	    catch(RenderException e){
	    	log.error(e)
	    }
	}

}