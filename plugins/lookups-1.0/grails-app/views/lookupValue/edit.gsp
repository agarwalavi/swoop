

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title><g:message code="lookupValue.edit" default="Edit Lookup Value" /></title>
        <g:lookupHelpBalloons />
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}"><g:message code="home" default="Home" /></a></span>
            <g:lookupMenuButton/>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="lookupValue.list" default="LookupValue List" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="lookupValue.new" default="New LookupValue" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="lookupValue.edit" default="Edit Lookup Value" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${lookupValue}">
            <div class="errors">
                <g:renderErrors bean="${lookupValue}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${lookupValue?.id}" />
                <g:render template="dialog" model="[lookupValue: lookupValue]" contextPath="${pluginContextPath}" />
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="Update" value="${message(code:'update', 'default':'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('${message(code:'delete.confirm', 'default':'Are you sure?')}');" action="Delete" value="${message(code:'delete', 'default':'Delete')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
