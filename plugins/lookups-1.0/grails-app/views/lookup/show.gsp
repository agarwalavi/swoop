

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title><g:message code="lookup.show" default="Show Lookup" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}"><g:message code="home" default="Home" /></a></span>
            <g:lookupMenuButton/>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="lookup.list" default="Lookup List" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="lookup.new" default="New Lookup" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="lookup.show" default="Show Lookup" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lookup.id" default="Id" />:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:lookup, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lookup.realm" default="Realm" />:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:lookup, field:'realm')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lookup.codeType" default="Code Type" />:</td>
                            
                            <td valign="top" class="value"><g:message code="lookup.codeType.${lookup.codeType}" default="${lookup.codeType}" encodeAs="HTML" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lookup.codeMinimum" default="Code Minimum" />:</td>

                            <td valign="top" class="value">${fieldValue(bean:lookup, field:'codeMinimum')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lookup.codeMaximum" default="Code Maximum" />:</td>

                            <td valign="top" class="value">${fieldValue(bean:lookup, field:'codeMaximum')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lookup.codeScale" default="Code Scale" />:</td>

                            <td valign="top" class="value">${fieldValue(bean:lookup, field:'codeScale')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lookup.valueType" default="Value Type" />:</td>

                            <td valign="top" class="value"><g:message code="lookup.valueType.${lookup.valueType}" default="${lookup.valueType}" encodeAs="HTML" /></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lookup.valueMinimum" default="Value Minimum" />:</td>

                            <td valign="top" class="value">${fieldValue(bean:lookup, field:'valueMinimum')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lookup.valueMaximum" default="Value Maximum" />:</td>

                            <td valign="top" class="value">${fieldValue(bean:lookup, field:'valueMaximum')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lookup.valueScale" default="Value Scale" />:</td>

                            <td valign="top" class="value">${fieldValue(bean:lookup, field:'valueScale')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lookup.ordering" default="Ordering" />:</td>

                            <td valign="top" class="value"><g:message code="lookup.ordering.${lookup.ordering}" default="${lookup.ordering}" encodeAs="HTML" /></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lookup.internationalize" default="Internationalize" />:</td>

                            <td valign="top" class="value"><img src="<g:createLinkTo dir="${pluginContextPath}/images" file="${lookup.internationalize}.png"/>" border="0"/></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lookup.dateCreated" default="Date Created" />:</td>

                            <td valign="top" class="value">${fieldValue(bean:lookup, field:'dateCreated')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lookup.lastUpdated" default="Last Updated" />:</td>

                            <td valign="top" class="value">${fieldValue(bean:lookup, field:'lastUpdated')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lookup.version" default="Version" />:</td>

                            <td valign="top" class="value">${fieldValue(bean:lookup, field:'version')}</td>

                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${lookup?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="Edit" value="${message(code:'edit', 'default':'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('${message(code:'delete.confirm', 'default':'Are you sure?')}');" action="Delete" value="${message(code:'delete', 'default':'Delete')}" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
