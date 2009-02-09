

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create VendorPart</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">VendorPart List</g:link></span>
        </div>
        <div class="body">
            <h1>Create VendorPart</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${vendorPartInstance}">
            <div class="errors">
                <g:renderErrors bean="${vendorPartInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateCreated">Date Created:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vendorPartInstance,field:'dateCreated','errors')}">
                                    <g:datePicker name="dateCreated" value="${vendorPartInstance?.dateCreated}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="createUser">Create User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vendorPartInstance,field:'createUser','errors')}">
                                    <input type="text" id="createUser" name="createUser" value="${fieldValue(bean:vendorPartInstance,field:'createUser')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastUpdated">Last Updated:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vendorPartInstance,field:'lastUpdated','errors')}">
                                    <g:datePicker name="lastUpdated" value="${vendorPartInstance?.lastUpdated}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="updateUser">Update User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vendorPartInstance,field:'updateUser','errors')}">
                                    <input type="text" id="updateUser" name="updateUser" value="${fieldValue(bean:vendorPartInstance,field:'updateUser')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vendorPartInstance,field:'description','errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:vendorPartInstance,field:'description')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="minimumOrderQuantity">Minimum Order Quantity:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vendorPartInstance,field:'minimumOrderQuantity','errors')}">
                                    <input type="text" id="minimumOrderQuantity" name="minimumOrderQuantity" value="${fieldValue(bean:vendorPartInstance,field:'minimumOrderQuantity')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="orderLeadTime">Order Lead Time:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vendorPartInstance,field:'orderLeadTime','errors')}">
                                    <input type="text" id="orderLeadTime" name="orderLeadTime" value="${fieldValue(bean:vendorPartInstance,field:'orderLeadTime')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="part">Part:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vendorPartInstance,field:'part','errors')}">
                                    <g:select optionKey="id" from="${Part.list()}" name="part.id" value="${vendorPartInstance?.part?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="price">Price:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vendorPartInstance,field:'price','errors')}">
                                    <input type="text" id="price" name="price" value="${fieldValue(bean:vendorPartInstance,field:'price')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="vendor">Vendor:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vendorPartInstance,field:'vendor','errors')}">
                                    <g:select optionKey="id" from="${Vendor.list()}" name="vendor.id" value="${vendorPartInstance?.vendor?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="vendorPartNumber">Vendor Part Number:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vendorPartInstance,field:'vendorPartNumber','errors')}">
                                    <input type="text" id="vendorPartNumber" name="vendorPartNumber" value="${fieldValue(bean:vendorPartInstance,field:'vendorPartNumber')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="authenticateService">Authenticate Service:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vendorPartInstance,field:'authenticateService','errors')}">
                                    
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
