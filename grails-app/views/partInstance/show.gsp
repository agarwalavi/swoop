

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show PartInstance</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">PartInstance List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New PartInstance</g:link></span>
        </div>
        <div class="body">
            <h1>Show PartInstance</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:partInstanceInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Date Created:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:partInstanceInstance, field:'dateCreated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Create User:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:partInstanceInstance, field:'createUser')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Last Updated:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:partInstanceInstance, field:'lastUpdated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Update User:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:partInstanceInstance, field:'updateUser')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Actual Cost:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:partInstanceInstance, field:'actualCost')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Assembly Instance:</td>
                            
                            <td valign="top" class="value"><g:link controller="assemblyInstance" action="show" id="${partInstanceInstance?.assemblyInstance?.id}">${partInstanceInstance?.assemblyInstance?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Date Changed:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:partInstanceInstance, field:'dateChanged')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Date Received:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:partInstanceInstance, field:'dateReceived')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Location:</td>
                            
                            <td valign="top" class="value"><g:link controller="location" action="show" id="${partInstanceInstance?.location?.id}">${partInstanceInstance?.location?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Minimum Quantity On Hand:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:partInstanceInstance, field:'minimumQuantityOnHand')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Part:</td>
                            
                            <td valign="top" class="value"><g:link controller="part" action="show" id="${partInstanceInstance?.part?.id}">${partInstanceInstance?.part?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Preferred Quantity On Hand:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:partInstanceInstance, field:'preferredQuantityOnHand')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Quantity On Hand:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:partInstanceInstance, field:'quantityOnHand')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Serial Number:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:partInstanceInstance, field:'serialNumber')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Service Item:</td>
                            
                            <td valign="top" class="value"><g:link controller="serviceItem" action="show" id="${partInstanceInstance?.serviceItem?.id}">${partInstanceInstance?.serviceItem?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Sku:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:partInstanceInstance, field:'sku')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Vehicle:</td>
                            
                            <td valign="top" class="value"><g:link controller="vehicle" action="show" id="${partInstanceInstance?.vehicle?.id}">${partInstanceInstance?.vehicle?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Vendor Part:</td>
                            
                            <td valign="top" class="value"><g:link controller="vendorPart" action="show" id="${partInstanceInstance?.vendorPart?.id}">${partInstanceInstance?.vendorPart?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Authenticate Service:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:partInstanceInstance, field:'authenticateService')}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${partInstanceInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
