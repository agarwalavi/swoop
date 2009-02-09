

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show ServiceRequest</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">ServiceRequest List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New ServiceRequest</g:link></span>
        </div>
        <div class="body">
            <h1>Show ServiceRequest</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:serviceRequestInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Date Created:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:serviceRequestInstance, field:'dateCreated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Create User:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:serviceRequestInstance, field:'createUser')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Last Updated:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:serviceRequestInstance, field:'lastUpdated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Update User:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:serviceRequestInstance, field:'updateUser')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Assembly:</td>
                            
                            <td valign="top" class="value"><g:link controller="assembly" action="show" id="${serviceRequestInstance?.assembly?.id}">${serviceRequestInstance?.assembly?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Completion Date:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:serviceRequestInstance, field:'completionDate')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Location:</td>
                            
                            <td valign="top" class="value"><g:link controller="location" action="show" id="${serviceRequestInstance?.location?.id}">${serviceRequestInstance?.location?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Maintenances:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="m" in="${serviceRequestInstance.maintenances}">
                                    <li><g:link controller="maintenance" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Number:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:serviceRequestInstance, field:'number')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Scheduled Date:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:serviceRequestInstance, field:'scheduledDate')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Service Item:</td>
                            
                            <td valign="top" class="value"><g:link controller="serviceItem" action="show" id="${serviceRequestInstance?.serviceItem?.id}">${serviceRequestInstance?.serviceItem?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Start Date:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:serviceRequestInstance, field:'startDate')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Type:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:serviceRequestInstance, field:'type')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Vehicle:</td>
                            
                            <td valign="top" class="value"><g:link controller="vehicle" action="show" id="${serviceRequestInstance?.vehicle?.id}">${serviceRequestInstance?.vehicle?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Authenticate Service:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:serviceRequestInstance, field:'authenticateService')}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${serviceRequestInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
