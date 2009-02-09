

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create MaintenanceScheduleItem</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">MaintenanceScheduleItem List</g:link></span>
        </div>
        <div class="body">
            <h1>Create MaintenanceScheduleItem</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${maintenanceScheduleItemInstance}">
            <div class="errors">
                <g:renderErrors bean="${maintenanceScheduleItemInstance}" as="list" />
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
                                <td valign="top" class="value ${hasErrors(bean:maintenanceScheduleItemInstance,field:'dateCreated','errors')}">
                                    <g:datePicker name="dateCreated" value="${maintenanceScheduleItemInstance?.dateCreated}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="createUser">Create User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceScheduleItemInstance,field:'createUser','errors')}">
                                    <input type="text" id="createUser" name="createUser" value="${fieldValue(bean:maintenanceScheduleItemInstance,field:'createUser')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastUpdated">Last Updated:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceScheduleItemInstance,field:'lastUpdated','errors')}">
                                    <g:datePicker name="lastUpdated" value="${maintenanceScheduleItemInstance?.lastUpdated}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="updateUser">Update User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceScheduleItemInstance,field:'updateUser','errors')}">
                                    <input type="text" id="updateUser" name="updateUser" value="${fieldValue(bean:maintenanceScheduleItemInstance,field:'updateUser')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceScheduleItemInstance,field:'description','errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:maintenanceScheduleItemInstance,field:'description')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceScheduleItemInstance,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:maintenanceScheduleItemInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="required">Required:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceScheduleItemInstance,field:'required','errors')}">
                                    <g:checkBox name="required" value="${maintenanceScheduleItemInstance?.required}" ></g:checkBox>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="scheduledHours">Scheduled Hours:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceScheduleItemInstance,field:'scheduledHours','errors')}">
                                    <input type="text" id="scheduledHours" name="scheduledHours" value="${fieldValue(bean:maintenanceScheduleItemInstance,field:'scheduledHours')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="authenticateService">Authenticate Service:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceScheduleItemInstance,field:'authenticateService','errors')}">
                                    
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
