

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title><g:message code="lookupValue.show" default="Show Lookup Value" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}"><g:message code="home" default="Home" /></a></span>
            <g:lookupMenuButton/>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="lookupValue.list" default="LookupValue List" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="lookupValue.new" default="New LookupValue" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="lookupValue.show" default="Show Lookup Value" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lookupValue.id" default="Id" />:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:lookupValue, field:'id')}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lookupValue.lookup" default="Lookup" />:</td>

                            <td valign="top" class="value">${lookupValue.lookup.realm.encodeAsHTML()}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lookupValue.code" default="Code" />:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:lookupValue, field:'code')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lookupValue.value" default="Value" />:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:lookupValue, field:'value')}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lookupValue.sequencer" default="Sequencer" />:</td>

                            <td valign="top" class="value">${fieldValue(bean:lookupValue, field:'sequencer')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lookupValue.numericSequencer" default="Numeric Sequencer" />:</td>

                            <td valign="top" class="value">${fieldValue(bean:lookupValue, field:'numericSequencer')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lookupValue.stringSequencer" default="String Sequencer" />:</td>

                            <td valign="top" class="value">${fieldValue(bean:lookupValue, field:'stringSequencer')}</td>

                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lookupValue.dateCreated" default="Date Created" />:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:lookupValue, field:'dateCreated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lookupValue.lastUpdated" default="Last Updated" />:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:lookupValue, field:'lastUpdated')}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lookupValue.version" default="Version" />:</td>

                            <td valign="top" class="value">${fieldValue(bean:lookupValue, field:'version')}</td>

                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${lookupValue?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="Edit" value="${message(code:'edit', 'default':'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('${message(code:'delete.confirm', 'default':'Are you sure?')}');" action="Delete" value="${message(code:'delete', 'default':'Delete')}" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
