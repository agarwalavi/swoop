

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Order</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Order List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Order</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Order</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${orderInstance}">
            <div class="errors">
                <g:renderErrors bean="${orderInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${orderInstance?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateCreated">Date Created:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:orderInstance,field:'dateCreated','errors')}">
                                    <g:datePicker name="dateCreated" value="${orderInstance?.dateCreated}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="createUser">Create User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:orderInstance,field:'createUser','errors')}">
                                    <input type="text" id="createUser" name="createUser" value="${fieldValue(bean:orderInstance,field:'createUser')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastUpdated">Last Updated:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:orderInstance,field:'lastUpdated','errors')}">
                                    <g:datePicker name="lastUpdated" value="${orderInstance?.lastUpdated}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="updateUser">Update User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:orderInstance,field:'updateUser','errors')}">
                                    <input type="text" id="updateUser" name="updateUser" value="${fieldValue(bean:orderInstance,field:'updateUser')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="complete">Complete:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:orderInstance,field:'complete','errors')}">
                                    <g:checkBox name="complete" value="${orderInstance?.complete}" ></g:checkBox>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="internalOrderNumber">Internal Order Number:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:orderInstance,field:'internalOrderNumber','errors')}">
                                    <input type="text" id="internalOrderNumber" name="internalOrderNumber" value="${fieldValue(bean:orderInstance,field:'internalOrderNumber')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="location">Location:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:orderInstance,field:'location','errors')}">
                                    <g:select optionKey="id" from="${Location.list()}" name="location.id" value="${orderInstance?.location?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="orderDate">Order Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:orderInstance,field:'orderDate','errors')}">
                                    <g:datePicker name="orderDate" value="${orderInstance?.orderDate}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="receivedDate">Received Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:orderInstance,field:'receivedDate','errors')}">
                                    <g:datePicker name="receivedDate" value="${orderInstance?.receivedDate}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="vendor">Vendor:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:orderInstance,field:'vendor','errors')}">
                                    <g:select optionKey="id" from="${Vendor.list()}" name="vendor.id" value="${orderInstance?.vendor?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="vendorOrdernumber">Vendor Ordernumber:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:orderInstance,field:'vendorOrdernumber','errors')}">
                                    <input type="text" id="vendorOrdernumber" name="vendorOrdernumber" value="${fieldValue(bean:orderInstance,field:'vendorOrdernumber')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="vendorParts">Vendor Parts:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:orderInstance,field:'vendorParts','errors')}">
                                    
<ul>
<g:each var="v" in="${orderInstance?.vendorParts?}">
    <li><g:link controller="vendorPart" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="vendorPart" params="['order.id':orderInstance?.id]" action="create">Add VendorPart</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="authenticateService">Authenticate Service:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:orderInstance,field:'authenticateService','errors')}">
                                    
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
