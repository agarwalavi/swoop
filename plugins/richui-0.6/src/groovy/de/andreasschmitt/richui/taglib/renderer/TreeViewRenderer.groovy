package de.andreasschmitt.richui.taglib.renderer

import groovy.xml.MarkupBuilder
import org.codehaus.groovy.grails.web.taglib.GroovyPageTagBody

/*
*
* @author Andreas Schmitt
*/
class TreeViewRenderer extends AbstractRenderer {
	
	protected void renderTagContent(Map attrs, MarkupBuilder builder) throws RenderException {
		renderTagContent(attrs, null, builder)
	}
	
	protected void renderTagContent(Map attrs, GroovyPageTagBody body, MarkupBuilder builder) throws RenderException {			
		if(!attrs?.id){
			attrs.id = "tree" + RenderUtils.getUniqueId()
		}
		
		builder.div(id: attrs?.id, "")					
		builder.script(type: "text/javascript"){  		 
		    builder.yieldUnescaped "	var tree = new YAHOO.widget.TreeView(\"$attrs.id\");\n"
		    builder.yieldUnescaped "	var root = tree.getRoot();\n"		    	
		    
		    builder.yieldUnescaped "    function createNode(text, id, icon, pnode){\n"
            builder.yieldUnescaped "        var n = new YAHOO.widget.TextNode(text, pnode, false);\n"
            builder.yieldUnescaped "        n.labelStyle=icon;\n"
		    if(attrs?.onLabelClick){
		    	builder.yieldUnescaped "		n.additionalId = id;\n"
		    }
            builder.yieldUnescaped "        return n;\n"
            builder.yieldUnescaped "    }\n\n"
	
		    if(attrs?.onLabelClick){
			    builder.yieldUnescaped "	tree.subscribe(\"labelClick\", function(node) {\n"
			    builder.yieldUnescaped "		var id = node.additionalId;"
			    builder.yieldUnescaped "		${attrs.onLabelClick}"
			    builder.yieldUnescaped "	});\n"
		    }
		    
		    if(attrs?.showRoot == "false") {
                createTree(attrs.xml.children(), "root", builder)
            } else {
                createTree(attrs.xml, "root", builder)
            }
				
			builder.yieldUnescaped "	tree.draw();\n"
		}
	}
	
	private void createTree(nodes, parent, builder){
		nodes.each {
			//leaf
			if(it.children().size() == 0){
				builder.yieldUnescaped "    createNode(\"" + it.@name + "\", \"" + it?.@id + "\", \"" + it.@icon + "\", $parent);\n"
			}
			//knot
			else {
				def nodeName = it.@name
				if(it.@name == ""){
					nodeName = "unknown"
				}
				
				def newParent = "t" + RenderUtils.getUniqueId()
				
				builder.yieldUnescaped "    " + newParent + " = createNode(\"" + nodeName + "\", \"" + it?.@id + "\",\"" + it?.@icon + "\", $parent);\n"	
				
				createTree(it.children(), newParent, builder)
			}
		}
	}
	
	protected void renderResourcesContent(Map attrs, MarkupBuilder builder, String resourcePath) throws RenderException {
		builder.yieldUnescaped "<!-- TreeView -->"
		
		String yuiResourcePath = YuiUtils.getResourcePath(resourcePath, attrs?.remote != null)
		
		if(attrs?.skin){
			if(attrs.skin == "default"){
				builder.link(rel: "stylesheet", type: "text/css", href: "$resourcePath/css/treeView.css")
			}
			else {
				String applicationResourcePath = RenderUtils.getApplicationResourcePath(resourcePath)
				builder.link(rel: "stylesheet", type: "text/css", href: "${applicationResourcePath}/css/${attrs.skin}.css")
			}
		}
		else {
			builder.link(rel: "stylesheet", type: "text/css", href: "$yuiResourcePath/treeview/assets/skins/sam/treeview.css")
		}
			
		builder.script(type: "text/javascript", src: "$yuiResourcePath/yahoo-dom-event/yahoo-dom-event.js", "")
		builder.script(type: "text/javascript", src: "$yuiResourcePath/event/event-min.js", "")
		builder.script(type: "text/javascript", src: "$yuiResourcePath/yahoo/yahoo-min.js", "")
		builder.script(type: "text/javascript", src: "$yuiResourcePath/treeview/treeview-min.js", "")
	}


}