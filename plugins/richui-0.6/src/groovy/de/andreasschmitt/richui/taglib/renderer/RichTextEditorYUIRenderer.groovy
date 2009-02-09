package de.andreasschmitt.richui.taglib.renderer;

import groovy.xml.MarkupBuilder
import org.codehaus.groovy.grails.web.taglib.GroovyPageTagBody

/*
*
* @author Andreas Schmitt
*/
class RichTextEditorYUIRenderer extends AbstractRenderer {

	protected void renderTagContent(Map attrs, MarkupBuilder builder) throws RenderException {
		renderTagContent(attrs, null, builder)
	}
	
	protected void renderTagContent(Map attrs, GroovyPageTagBody body, MarkupBuilder builder) throws RenderException {
		builder."div"("class": "yui-skin-sam"){
			textarea(name: "${attrs?.name}", id: "${attrs?.id}", "${attrs.value}")
		}

		builder.script(type: "text/javascript"){
			if(attrs?.type == "advanced"){
				builder.yieldUnescaped "	var editor = new YAHOO.widget.Editor('${attrs?.id}', {\n"
			}
			else {
				builder.yieldUnescaped "	var editor = new YAHOO.widget.SimpleEditor('${attrs?.id}', {\n"
			}
			builder.yieldUnescaped "	    height: '${attrs?.height}px',\n"
			builder.yieldUnescaped "	    width: '${attrs?.width}px',\n"
			builder.yieldUnescaped "	    handleSubmit: true\n"
			builder.yieldUnescaped "	});\n"
			builder.yieldUnescaped "	editor.render();\n"
		}
	}
	
	protected void renderResourcesContent(Map attrs, MarkupBuilder builder, String resourcePath) throws RenderException {			
		builder.yieldUnescaped "<!-- RichTextEditor -->"
		
		String yuiResourcePath = YuiUtils.getResourcePath(resourcePath, attrs?.remote != null)
	
		if(attrs?.skin){
			if(attrs.skin == "default"){
				builder.link(rel: "stylesheet", type: "text/css", href: "$yuiResourcePath/assets/skins/sam/skin.css")
			}
			else {
				String applicationResourcePath = RenderUtils.getApplicationResourcePath(resourcePath)
				builder.link(rel: "stylesheet", type: "text/css", href: "${applicationResourcePath}/css/${attrs.skin}.css")
			}
		}
		else {
			builder.link(rel: "stylesheet", type: "text/css", href: "$yuiResourcePath/assets/skins/sam/skin.css")	
		}
		
		builder.script(type: "text/javascript", src: "$yuiResourcePath/yahoo-dom-event/yahoo-dom-event.js", "")
		builder.script(type: "text/javascript", src: "$yuiResourcePath/element/element-beta-min.js", "")
		builder.script(type: "text/javascript", src: "$yuiResourcePath/animation/animation-min.js", "")
		builder.script(type: "text/javascript", src: "$yuiResourcePath/container/container_core-min.js", "")
		builder.script(type: "text/javascript", src: "$yuiResourcePath/menu/menu-min.js", "")
		builder.script(type: "text/javascript", src: "$yuiResourcePath/button/button-min.js", "")
		if(attrs?.type == "advanced"){
			builder.script(type: "text/javascript", src: "$yuiResourcePath/editor/editor-beta-min.js", "")	
		}
		else {
			builder.script(type: "text/javascript", src: "$yuiResourcePath/editor/simpleeditor-beta-min.js", "")
		}
	}

}