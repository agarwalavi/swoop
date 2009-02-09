class SettingController {

    private static loaded = false

    def settingService
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST', reset:'POST']

    def list = {
        if (!loaded) {
            if (settingService.hasPlugin("localizations")) {
                def test = message(code: "setting.id", default: "_missing!")
                if (test == "_missing!") {
                    Localization.loadPluginData("settings")
                }
            }

            loaded = true
        }

        params.max = (params.max && params.max.toInteger() > 0) ? Math.min(params.max.toInteger(), Setting.valueFor("pagination.max", 50)) : Setting.valueFor("pagination.default", 20)
        params.sort = params.sort ?: "code"
        
        def lst
        if (settingService.hasPlugin("criteria") || settingService.hasPlugin("drilldowns")) {
            lst = Setting.selectList( session, params )
        } else {
            lst = Setting.list( params )
        }

        [ settingList: lst ]
    }

    def show = {
        def setting = Setting.get( params.id )

        if(!setting) {
            flash.message = "setting.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Setting not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ setting : setting ] }
    }

    def delete = {
        def setting = Setting.get( params.id )
        if(setting) {
            setting.delete()
            Setting.resetThis(setting.code)
            flash.message = "setting.deleted"
            flash.args = [params.id]
            flash.defaultMessage = "Setting ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "setting.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Setting not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def setting = Setting.get( params.id )

        if(!setting) {
            flash.message = "setting.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Setting not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ setting : setting ]
        }
    }

    def update = {
        def setting = Setting.get( params.id )
        if(setting) {
            def oldCode = setting.code
            setting.properties = params
            if(!setting.hasErrors() && setting.save()) {
                Setting.resetThis(oldCode)
                if (setting.code != oldCode) Setting.resetThis(setting.code)
                flash.message = "setting.updated"
                flash.args = [params.id]
                flash.defaultMessage = "Setting ${params.id} updated"
                redirect(action:show,id:setting.id)
            }
            else {
                render(view:'edit',model:[setting:setting])
            }
        }
        else {
            flash.message = "setting.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Setting not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def setting = new Setting()
        setting.properties = params
        return ['setting':setting]
    }

    def save = {
        def setting = new Setting(params)
        if(!setting.hasErrors() && setting.save()) {
            Setting.resetThis(setting.code)
            flash.message = "setting.created"
            flash.args = ["${setting.id}"]
            flash.defaultMessage = "Setting ${setting.id} created"
            redirect(action:show,id:setting.id)
        }
        else {
            render(view:'create',model:[setting:setting])
        }
    }

    def cache = {
        return [stats: Setting.statistics()]
    }

    def reset = {
        Setting.resetAll()
        redirect(action:cache)
    }
}