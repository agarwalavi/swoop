

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Assembly</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Assembly List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Assembly</g:link></span>
        </div>
        <div class="body">
            <h1>Show Assembly</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:assemblyInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Date Created:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:assemblyInstance, field:'dateCreated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Create User:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:assemblyInstance, field:'createUser')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Last Updated:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:assemblyInstance, field:'lastUpdated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Update User:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:assemblyInstance, field:'updateUser')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Part Number:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:assemblyInstance, field:'partNumber')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Make:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:assemblyInstance, field:'make')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Model:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:assemblyInstance, field:'model')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Report Interval:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:assemblyInstance, field:'reportInterval')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Report Interval Type:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:assemblyInstance, field:'reportIntervalType')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Requires Report:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:assemblyInstance, field:'requiresReport')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Size:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:assemblyInstance, field:'size')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Parts:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="p" in="${assemblyInstance.parts}">
                                    <li><g:link controller="partInstance" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Vendor Parts:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="v" in="${assemblyInstance.vendorParts}">
                                    <li><g:link controller="vendorPart" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Authenticate Service:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:assemblyInstance, field:'authenticateService')}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${assemblyInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
