

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title><g:message code="setting.show" default="Show Setting" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}"><g:message code="home" default="Home" /></a></span>
            <g:settingMenuButton/>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="setting.list" default="Setting List" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="setting.new" default="New Setting" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="setting.show" default="Show Setting" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="setting.id" default="Id" />:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:setting, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="setting.code" default="Code" />:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:setting, field:'code')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="setting.type" default="Type" />:</td>
                            
                            <td valign="top" class="value"><g:message code="setting.type.${setting.type}" default="${setting.type}" encodeAs="HTML" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="setting.value" default="Value" />:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:setting, field:'value')}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="setting.dateCreated" default="Date Created" />:</td>

                            <td valign="top" class="value">${fieldValue(bean:setting, field:'dateCreated')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="setting.lastUpdated" default="Last Updated" />:</td>

                            <td valign="top" class="value">${fieldValue(bean:setting, field:'lastUpdated')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="setting.version" default="Version" />:</td>

                            <td valign="top" class="value">${fieldValue(bean:setting, field:'version')}</td>

                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${setting?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="Edit" value="${message(code:'edit', 'default':'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('${message(code:'delete.confirm', 'default':'Are you sure?')}');" action="Delete" value="${message(code:'delete', 'default':'Delete')}" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
