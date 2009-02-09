

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create VehicleReport</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">VehicleReport List</g:link></span>
        </div>
        <div class="body">
            <h1>Create VehicleReport</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${vehicleReportInstance}">
            <div class="errors">
                <g:renderErrors bean="${vehicleReportInstance}" as="list" />
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
                                <td valign="top" class="value ${hasErrors(bean:vehicleReportInstance,field:'dateCreated','errors')}">
                                    <g:datePicker name="dateCreated" value="${vehicleReportInstance?.dateCreated}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="createUser">Create User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleReportInstance,field:'createUser','errors')}">
                                    <input type="text" id="createUser" name="createUser" value="${fieldValue(bean:vehicleReportInstance,field:'createUser')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastUpdated">Last Updated:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleReportInstance,field:'lastUpdated','errors')}">
                                    <g:datePicker name="lastUpdated" value="${vehicleReportInstance?.lastUpdated}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="updateUser">Update User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleReportInstance,field:'updateUser','errors')}">
                                    <input type="text" id="updateUser" name="updateUser" value="${fieldValue(bean:vehicleReportInstance,field:'updateUser')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="completionDate">Completion Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleReportInstance,field:'completionDate','errors')}">
                                    <g:datePicker name="completionDate" value="${vehicleReportInstance?.completionDate}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dueDate">Due Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleReportInstance,field:'dueDate','errors')}">
                                    <g:datePicker name="dueDate" value="${vehicleReportInstance?.dueDate}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="mileage">Mileage:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleReportInstance,field:'mileage','errors')}">
                                    <input type="text" id="mileage" name="mileage" value="${fieldValue(bean:vehicleReportInstance,field:'mileage')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="reporter">Reporter:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleReportInstance,field:'reporter','errors')}">
                                    <g:select optionKey="id" from="${User.list()}" name="reporter.id" value="${vehicleReportInstance?.reporter?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="vehicle">Vehicle:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleReportInstance,field:'vehicle','errors')}">
                                    <g:select optionKey="id" from="${Vehicle.list()}" name="vehicle.id" value="${vehicleReportInstance?.vehicle?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="authenticateService">Authenticate Service:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleReportInstance,field:'authenticateService','errors')}">
                                    
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
