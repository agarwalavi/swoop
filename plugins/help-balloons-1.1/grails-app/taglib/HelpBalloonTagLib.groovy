class HelpBalloonTagLib {

    private static final Object lockable = new Object();
    private static long count = 0L;

    def helpBalloonService

    def helpBalloons = {attrs, body ->
        def icon = attrs["icon"] ?: g.createLinkTo(dir: "${pluginContextPath}/images", file: "balloon-icon.gif")
        def button = attrs["button"] ?: g.createLinkTo(dir: "${pluginContextPath}/images", file: "balloon-button.png")
        def prefix = attrs["balloonPrefix"] ?: g.createLinkTo(dir: "${pluginContextPath}/images") + "/balloon-"
        def base = attrs["base"] ?: grailsAttributes.getApplicationUri(request) + "/js/"

        out << g.javascript(library: "prototype", base: base)
        out << """<script type="text/javascript" src="${g.createLinkTo(dir: "${pluginContextPath}/js", file: "HelpBalloon.js")}"></script>\n"""
        out << """<script type="text/javascript">
  HelpBalloon.Options.prototype = Object.extend(HelpBalloon.Options.prototype, {
    icon: '$icon',
    button: '$button',
    balloonPrefix: '$prefix'
  });
</script>
"""
    }

    def helpBalloon = {attrs, body ->
        def title = attrs["title"]
        def content = attrs["content"]
        def code = attrs["code"]
        def suffix = attrs["suffix"] ?: ".help"
        def encodeAs = attrs["encodeAs"]

        if (!title && code) title = g.message(code: code)
        if (!content && code) content = g.message(code: code + suffix)

        title = title ?: ""
        content = content ?: ""

        if (encodeAs) {
            switch (encodeAs.toUpperCase()) {

                case "HTML":
                title = title.encodeAsHTML()
                content = content.encodeAsHTML()
                break

                case "XML":
                title = title.encodeAsXML()
                content = content.encodeAsXML()
                break
            }
        }

        def num
        synchronized(lockable) {
            num = count++;
        }
        out << """<script type="text/javascript">
  var hb$num = new HelpBalloon({
    title: '${title.encodeAsJavaScript()}',
    content: '${content.encodeAsJavaScript()}'
  });
</script>
"""
    }
}
