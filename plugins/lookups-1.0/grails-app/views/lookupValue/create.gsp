

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title><g:message code="lookupValue.create" default="Create Lookup Value" /></title>
        <g:lookupHelpBalloons />
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}"><g:message code="home" default="Home" /></a></span>
            <g:lookupMenuButton/>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="lookupValue.list" default="LookupValue List" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="lookupValue.create" default="Create Lookup Value" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${lookupValue}">
            <div class="errors">
                <g:renderErrors bean="${lookupValue}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <g:render template="dialog" model="[lookupValue: lookupValue]" contextPath="${pluginContextPath}" />
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="${message(code:'create', 'default':'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
