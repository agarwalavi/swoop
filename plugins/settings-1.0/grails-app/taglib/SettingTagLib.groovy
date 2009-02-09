class SettingTagLib {

    def settingService
    
    def settingHelpBalloons = {attrs, body ->
        if (settingService.hasPlugin("helpBalloons")) {
            out << g.helpBalloons(attrs)
        }
    }
    
    def settingHelpBalloon = {attrs, body ->
        if (settingService.hasPlugin("helpBalloons")) {
            out << g.helpBalloon(attrs)
        }
    }
    
    def settingCriteria = {attrs, body ->
        if (settingService.hasPlugin("criteria")) {
            out << """<div class="criteria">\n"""
            out << g.criteria(attrs)
            out << """</div>\n"""
        }
    }
    
    def settingPaginate = {attrs, body ->
        attrs.total = (settingService.hasPlugin("criteria") || settingService.hasPlugin("drilldown")) ? Setting.selectCount(session, params) : Setting.count()
       
        out << g.paginate(attrs)
    }
    
    def settingMenuButton = {attrs, body ->
        if (settingService.hasPlugin("menus")) {
            out << '<span class="menuButton">'
            out << g.link(class: "menu", controller: "menu", action: "display") {
                g.message(code: "menu.display", default: "Menu")
            }
            out << '</span>'
        }
    }
}
