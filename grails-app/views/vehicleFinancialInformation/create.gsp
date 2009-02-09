

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create VehicleFinancialInformation</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">VehicleFinancialInformation List</g:link></span>
        </div>
        <div class="body">
            <h1>Create VehicleFinancialInformation</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${vehicleFinancialInformationInstance}">
            <div class="errors">
                <g:renderErrors bean="${vehicleFinancialInformationInstance}" as="list" />
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
                                <td valign="top" class="value ${hasErrors(bean:vehicleFinancialInformationInstance,field:'dateCreated','errors')}">
                                    <g:datePicker name="dateCreated" value="${vehicleFinancialInformationInstance?.dateCreated}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="createUser">Create User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleFinancialInformationInstance,field:'createUser','errors')}">
                                    <input type="text" id="createUser" name="createUser" value="${fieldValue(bean:vehicleFinancialInformationInstance,field:'createUser')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastUpdated">Last Updated:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleFinancialInformationInstance,field:'lastUpdated','errors')}">
                                    <g:datePicker name="lastUpdated" value="${vehicleFinancialInformationInstance?.lastUpdated}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="updateUser">Update User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleFinancialInformationInstance,field:'updateUser','errors')}">
                                    <input type="text" id="updateUser" name="updateUser" value="${fieldValue(bean:vehicleFinancialInformationInstance,field:'updateUser')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="financeProvider">Finance Provider:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleFinancialInformationInstance,field:'financeProvider','errors')}">
                                    <input type="text" id="financeProvider" name="financeProvider" value="${fieldValue(bean:vehicleFinancialInformationInstance,field:'financeProvider')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="price">Price:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleFinancialInformationInstance,field:'price','errors')}">
                                    <input type="text" id="price" name="price" value="${fieldValue(bean:vehicleFinancialInformationInstance,field:'price')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="purchaseDate">Purchase Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleFinancialInformationInstance,field:'purchaseDate','errors')}">
                                    <g:datePicker name="purchaseDate" value="${vehicleFinancialInformationInstance?.purchaseDate}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="purchaseOrder">Purchase Order:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleFinancialInformationInstance,field:'purchaseOrder','errors')}">
                                    <input type="text" id="purchaseOrder" name="purchaseOrder" value="${fieldValue(bean:vehicleFinancialInformationInstance,field:'purchaseOrder')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="saleDate">Sale Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleFinancialInformationInstance,field:'saleDate','errors')}">
                                    <g:datePicker name="saleDate" value="${vehicleFinancialInformationInstance?.saleDate}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="transactionLocation">Transaction Location:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleFinancialInformationInstance,field:'transactionLocation','errors')}">
                                    <input type="text" id="transactionLocation" name="transactionLocation" value="${fieldValue(bean:vehicleFinancialInformationInstance,field:'transactionLocation')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="transactionType">Transaction Type:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleFinancialInformationInstance,field:'transactionType','errors')}">
                                    <input type="text" id="transactionType" name="transactionType" value="${fieldValue(bean:vehicleFinancialInformationInstance,field:'transactionType')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="vehicle">Vehicle:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleFinancialInformationInstance,field:'vehicle','errors')}">
                                    <g:select optionKey="id" from="${Vehicle.list()}" name="vehicle.id" value="${vehicleFinancialInformationInstance?.vehicle?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="authenticateService">Authenticate Service:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleFinancialInformationInstance,field:'authenticateService','errors')}">
                                    
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
