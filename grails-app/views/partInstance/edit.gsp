

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit PartInstance</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">PartInstance List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New PartInstance</g:link></span>
        </div>
        <div class="body">
            <h1>Edit PartInstance</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${partInstanceInstance}">
            <div class="errors">
                <g:renderErrors bean="${partInstanceInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${partInstanceInstance?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateCreated">Date Created:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:partInstanceInstance,field:'dateCreated','errors')}">
                                    <g:datePicker name="dateCreated" value="${partInstanceInstance?.dateCreated}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="createUser">Create User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:partInstanceInstance,field:'createUser','errors')}">
                                    <input type="text" id="createUser" name="createUser" value="${fieldValue(bean:partInstanceInstance,field:'createUser')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastUpdated">Last Updated:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:partInstanceInstance,field:'lastUpdated','errors')}">
                                    <g:datePicker name="lastUpdated" value="${partInstanceInstance?.lastUpdated}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="updateUser">Update User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:partInstanceInstance,field:'updateUser','errors')}">
                                    <input type="text" id="updateUser" name="updateUser" value="${fieldValue(bean:partInstanceInstance,field:'updateUser')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="actualCost">Actual Cost:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:partInstanceInstance,field:'actualCost','errors')}">
                                    <input type="text" id="actualCost" name="actualCost" value="${fieldValue(bean:partInstanceInstance,field:'actualCost')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="assemblyInstance">Assembly Instance:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:partInstanceInstance,field:'assemblyInstance','errors')}">
                                    <g:select optionKey="id" from="${AssemblyInstance.list()}" name="assemblyInstance.id" value="${partInstanceInstance?.assemblyInstance?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateChanged">Date Changed:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:partInstanceInstance,field:'dateChanged','errors')}">
                                    <g:datePicker name="dateChanged" value="${partInstanceInstance?.dateChanged}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateReceived">Date Received:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:partInstanceInstance,field:'dateReceived','errors')}">
                                    <g:datePicker name="dateReceived" value="${partInstanceInstance?.dateReceived}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="location">Location:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:partInstanceInstance,field:'location','errors')}">
                                    <g:select optionKey="id" from="${Location.list()}" name="location.id" value="${partInstanceInstance?.location?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="minimumQuantityOnHand">Minimum Quantity On Hand:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:partInstanceInstance,field:'minimumQuantityOnHand','errors')}">
                                    <input type="text" id="minimumQuantityOnHand" name="minimumQuantityOnHand" value="${fieldValue(bean:partInstanceInstance,field:'minimumQuantityOnHand')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="part">Part:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:partInstanceInstance,field:'part','errors')}">
                                    <g:select optionKey="id" from="${Part.list()}" name="part.id" value="${partInstanceInstance?.part?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="preferredQuantityOnHand">Preferred Quantity On Hand:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:partInstanceInstance,field:'preferredQuantityOnHand','errors')}">
                                    <input type="text" id="preferredQuantityOnHand" name="preferredQuantityOnHand" value="${fieldValue(bean:partInstanceInstance,field:'preferredQuantityOnHand')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="quantityOnHand">Quantity On Hand:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:partInstanceInstance,field:'quantityOnHand','errors')}">
                                    <input type="text" id="quantityOnHand" name="quantityOnHand" value="${fieldValue(bean:partInstanceInstance,field:'quantityOnHand')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="serialNumber">Serial Number:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:partInstanceInstance,field:'serialNumber','errors')}">
                                    <input type="text" id="serialNumber" name="serialNumber" value="${fieldValue(bean:partInstanceInstance,field:'serialNumber')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="serviceItem">Service Item:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:partInstanceInstance,field:'serviceItem','errors')}">
                                    <g:select optionKey="id" from="${ServiceItem.list()}" name="serviceItem.id" value="${partInstanceInstance?.serviceItem?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sku">Sku:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:partInstanceInstance,field:'sku','errors')}">
                                    <input type="text" id="sku" name="sku" value="${fieldValue(bean:partInstanceInstance,field:'sku')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="vehicle">Vehicle:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:partInstanceInstance,field:'vehicle','errors')}">
                                    <g:select optionKey="id" from="${Vehicle.list()}" name="vehicle.id" value="${partInstanceInstance?.vehicle?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="vendorPart">Vendor Part:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:partInstanceInstance,field:'vendorPart','errors')}">
                                    <g:select optionKey="id" from="${VendorPart.list()}" name="vendorPart.id" value="${partInstanceInstance?.vendorPart?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="authenticateService">Authenticate Service:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:partInstanceInstance,field:'authenticateService','errors')}">
                                    
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
