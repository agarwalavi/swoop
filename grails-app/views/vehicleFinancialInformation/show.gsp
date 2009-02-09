

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show VehicleFinancialInformation</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">VehicleFinancialInformation List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New VehicleFinancialInformation</g:link></span>
        </div>
        <div class="body">
            <h1>Show VehicleFinancialInformation</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:vehicleFinancialInformationInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Date Created:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:vehicleFinancialInformationInstance, field:'dateCreated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Create User:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:vehicleFinancialInformationInstance, field:'createUser')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Last Updated:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:vehicleFinancialInformationInstance, field:'lastUpdated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Update User:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:vehicleFinancialInformationInstance, field:'updateUser')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Finance Provider:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:vehicleFinancialInformationInstance, field:'financeProvider')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Price:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:vehicleFinancialInformationInstance, field:'price')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Purchase Date:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:vehicleFinancialInformationInstance, field:'purchaseDate')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Purchase Order:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:vehicleFinancialInformationInstance, field:'purchaseOrder')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Sale Date:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:vehicleFinancialInformationInstance, field:'saleDate')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Transaction Location:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:vehicleFinancialInformationInstance, field:'transactionLocation')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Transaction Type:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:vehicleFinancialInformationInstance, field:'transactionType')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Vehicle:</td>
                            
                            <td valign="top" class="value"><g:link controller="vehicle" action="show" id="${vehicleFinancialInformationInstance?.vehicle?.id}">${vehicleFinancialInformationInstance?.vehicle?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Authenticate Service:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:vehicleFinancialInformationInstance, field:'authenticateService')}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${vehicleFinancialInformationInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
