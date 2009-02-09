

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show VendorPart</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">VendorPart List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New VendorPart</g:link></span>
        </div>
        <div class="body">
            <h1>Show VendorPart</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:vendorPartInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Date Created:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:vendorPartInstance, field:'dateCreated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Create User:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:vendorPartInstance, field:'createUser')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Last Updated:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:vendorPartInstance, field:'lastUpdated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Update User:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:vendorPartInstance, field:'updateUser')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Description:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:vendorPartInstance, field:'description')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Minimum Order Quantity:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:vendorPartInstance, field:'minimumOrderQuantity')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Order Lead Time:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:vendorPartInstance, field:'orderLeadTime')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Part:</td>
                            
                            <td valign="top" class="value"><g:link controller="part" action="show" id="${vendorPartInstance?.part?.id}">${vendorPartInstance?.part?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Price:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:vendorPartInstance, field:'price')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Vendor:</td>
                            
                            <td valign="top" class="value"><g:link controller="vendor" action="show" id="${vendorPartInstance?.vendor?.id}">${vendorPartInstance?.vendor?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Vendor Part Number:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:vendorPartInstance, field:'vendorPartNumber')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Authenticate Service:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:vendorPartInstance, field:'authenticateService')}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${vendorPartInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
