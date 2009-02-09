

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show AssemblyInstance</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">AssemblyInstance List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New AssemblyInstance</g:link></span>
        </div>
        <div class="body">
            <h1>Show AssemblyInstance</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:assemblyInstanceInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Date Created:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:assemblyInstanceInstance, field:'dateCreated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Create User:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:assemblyInstanceInstance, field:'createUser')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Last Updated:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:assemblyInstanceInstance, field:'lastUpdated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Update User:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:assemblyInstanceInstance, field:'updateUser')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Active:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:assemblyInstanceInstance, field:'active')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Actual Cost:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:assemblyInstanceInstance, field:'actualCost')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Assembly:</td>
                            
                            <td valign="top" class="value"><g:link controller="assembly" action="show" id="${assemblyInstanceInstance?.assembly?.id}">${assemblyInstanceInstance?.assembly?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Vehicle:</td>
                            
                            <td valign="top" class="value"><g:link controller="vehicle" action="show" id="${assemblyInstanceInstance?.vehicle?.id}">${assemblyInstanceInstance?.vehicle?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Location:</td>
                            
                            <td valign="top" class="value"><g:link controller="location" action="show" id="${assemblyInstanceInstance?.location?.id}">${assemblyInstanceInstance?.location?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Vendor Part:</td>
                            
                            <td valign="top" class="value"><g:link controller="vendorPart" action="show" id="${assemblyInstanceInstance?.vendorPart?.id}">${assemblyInstanceInstance?.vendorPart?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Serial Number:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:assemblyInstanceInstance, field:'serialNumber')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Sku:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:assemblyInstanceInstance, field:'sku')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Date Received:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:assemblyInstanceInstance, field:'dateReceived')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Date Changed:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:assemblyInstanceInstance, field:'dateChanged')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Notes:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:assemblyInstanceInstance, field:'notes')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Order:</td>
                            
                            <td valign="top" class="value"><g:link controller="order" action="show" id="${assemblyInstanceInstance?.order?.id}">${assemblyInstanceInstance?.order?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Parts:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="p" in="${assemblyInstanceInstance.parts}">
                                    <li><g:link controller="partInstance" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Sercvice Requests:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="s" in="${assemblyInstanceInstance.sercviceRequests}">
                                    <li><g:link controller="serviceRequest" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Authenticate Service:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:assemblyInstanceInstance, field:'authenticateService')}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${assemblyInstanceInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
