

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create AssemblyInstance</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">AssemblyInstance List</g:link></span>
        </div>
        <div class="body">
            <h1>Create AssemblyInstance</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${assemblyInstanceInstance}">
            <div class="errors">
                <g:renderErrors bean="${assemblyInstanceInstance}" as="list" />
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
                                <td valign="top" class="value ${hasErrors(bean:assemblyInstanceInstance,field:'dateCreated','errors')}">
                                    <g:datePicker name="dateCreated" value="${assemblyInstanceInstance?.dateCreated}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="createUser">Create User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:assemblyInstanceInstance,field:'createUser','errors')}">
                                    <input type="text" id="createUser" name="createUser" value="${fieldValue(bean:assemblyInstanceInstance,field:'createUser')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastUpdated">Last Updated:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:assemblyInstanceInstance,field:'lastUpdated','errors')}">
                                    <g:datePicker name="lastUpdated" value="${assemblyInstanceInstance?.lastUpdated}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="updateUser">Update User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:assemblyInstanceInstance,field:'updateUser','errors')}">
                                    <input type="text" id="updateUser" name="updateUser" value="${fieldValue(bean:assemblyInstanceInstance,field:'updateUser')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="active">Active:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:assemblyInstanceInstance,field:'active','errors')}">
                                    <g:checkBox name="active" value="${assemblyInstanceInstance?.active}" ></g:checkBox>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="actualCost">Actual Cost:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:assemblyInstanceInstance,field:'actualCost','errors')}">
                                    <input type="text" id="actualCost" name="actualCost" value="${fieldValue(bean:assemblyInstanceInstance,field:'actualCost')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="assembly">Assembly:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:assemblyInstanceInstance,field:'assembly','errors')}">
                                    <g:select optionKey="id" from="${Assembly.list()}" name="assembly.id" value="${assemblyInstanceInstance?.assembly?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="vehicle">Vehicle:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:assemblyInstanceInstance,field:'vehicle','errors')}">
                                    <g:select optionKey="id" from="${Vehicle.list()}" name="vehicle.id" value="${assemblyInstanceInstance?.vehicle?.id}" noSelection="['null':'']"></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="location">Location:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:assemblyInstanceInstance,field:'location','errors')}">
                                    <g:select optionKey="id" from="${Location.list()}" name="location.id" value="${assemblyInstanceInstance?.location?.id}" noSelection="['null':'']"></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="vendorPart">Vendor Part:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:assemblyInstanceInstance,field:'vendorPart','errors')}">
                                    <g:select optionKey="id" from="${VendorPart.list()}" name="vendorPart.id" value="${assemblyInstanceInstance?.vendorPart?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="serialNumber">Serial Number:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:assemblyInstanceInstance,field:'serialNumber','errors')}">
                                    <input type="text" id="serialNumber" name="serialNumber" value="${fieldValue(bean:assemblyInstanceInstance,field:'serialNumber')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sku">Sku:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:assemblyInstanceInstance,field:'sku','errors')}">
                                    <input type="text" id="sku" name="sku" value="${fieldValue(bean:assemblyInstanceInstance,field:'sku')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateReceived">Date Received:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:assemblyInstanceInstance,field:'dateReceived','errors')}">
                                    <g:datePicker name="dateReceived" value="${assemblyInstanceInstance?.dateReceived}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateChanged">Date Changed:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:assemblyInstanceInstance,field:'dateChanged','errors')}">
                                    <g:datePicker name="dateChanged" value="${assemblyInstanceInstance?.dateChanged}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="notes">Notes:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:assemblyInstanceInstance,field:'notes','errors')}">
                                    <input type="text" id="notes" name="notes" value="${fieldValue(bean:assemblyInstanceInstance,field:'notes')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="order">Order:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:assemblyInstanceInstance,field:'order','errors')}">
                                    <g:select optionKey="id" from="${Order.list()}" name="order.id" value="${assemblyInstanceInstance?.order?.id}" noSelection="['null':'']"></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="authenticateService">Authenticate Service:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:assemblyInstanceInstance,field:'authenticateService','errors')}">
                                    
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
