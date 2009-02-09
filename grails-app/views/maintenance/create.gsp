

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Maintenance</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Maintenance List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Maintenance</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${maintenanceInstance}">
            <div class="errors">
                <g:renderErrors bean="${maintenanceInstance}" as="list" />
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
                                <td valign="top" class="value ${hasErrors(bean:maintenanceInstance,field:'dateCreated','errors')}">
                                    <g:datePicker name="dateCreated" value="${maintenanceInstance?.dateCreated}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="createUser">Create User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceInstance,field:'createUser','errors')}">
                                    <input type="text" id="createUser" name="createUser" value="${fieldValue(bean:maintenanceInstance,field:'createUser')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastUpdated">Last Updated:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceInstance,field:'lastUpdated','errors')}">
                                    <g:datePicker name="lastUpdated" value="${maintenanceInstance?.lastUpdated}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="updateUser">Update User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceInstance,field:'updateUser','errors')}">
                                    <input type="text" id="updateUser" name="updateUser" value="${fieldValue(bean:maintenanceInstance,field:'updateUser')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="mechanic">Mechanic:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceInstance,field:'mechanic','errors')}">
                                    <g:select optionKey="id" from="${User.list()}" name="mechanic.id" value="${maintenanceInstance?.mechanic?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="performedDate">Performed Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceInstance,field:'performedDate','errors')}">
                                    <g:datePicker name="performedDate" value="${maintenanceInstance?.performedDate}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="schedule">Schedule:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceInstance,field:'schedule','errors')}">
                                    <g:select optionKey="id" from="${MaintenanceSchedule.list()}" name="schedule.id" value="${maintenanceInstance?.schedule?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="scheduledDate">Scheduled Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceInstance,field:'scheduledDate','errors')}">
                                    <g:datePicker name="scheduledDate" value="${maintenanceInstance?.scheduledDate}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="serviceLocation">Service Location:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceInstance,field:'serviceLocation','errors')}">
                                    <g:select optionKey="id" from="${Location.list()}" name="serviceLocation.id" value="${maintenanceInstance?.serviceLocation?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="serviceRequest">Service Request:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceInstance,field:'serviceRequest','errors')}">
                                    <g:select optionKey="id" from="${ServiceRequest.list()}" name="serviceRequest.id" value="${maintenanceInstance?.serviceRequest?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="type">Type:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceInstance,field:'type','errors')}">
                                    <input type="text" id="type" name="type" value="${fieldValue(bean:maintenanceInstance,field:'type')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="authenticateService">Authenticate Service:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceInstance,field:'authenticateService','errors')}">
                                    
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
