

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title><g:message code="setting.create" default="Create Setting" /></title>
        <g:settingHelpBalloons />
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}"><g:message code="home" default="Home" /></a></span>
            <g:settingMenuButton/>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="setting.list" default="Setting List" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="setting.create" default="Create Setting" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${setting}">
            <div class="errors">
                <g:renderErrors bean="${setting}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <g:render template="dialog" model="[setting: setting]" contextPath="${pluginContextPath}" />
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="${message(code:'create', 'default':'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
