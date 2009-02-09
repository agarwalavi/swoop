

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit MaintenanceItem</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">MaintenanceItem List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New MaintenanceItem</g:link></span>
        </div>
        <div class="body">
            <h1>Edit MaintenanceItem</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${maintenanceItemInstance}">
            <div class="errors">
                <g:renderErrors bean="${maintenanceItemInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${maintenanceItemInstance?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateCreated">Date Created:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceItemInstance,field:'dateCreated','errors')}">
                                    <g:datePicker name="dateCreated" value="${maintenanceItemInstance?.dateCreated}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="createUser">Create User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceItemInstance,field:'createUser','errors')}">
                                    <input type="text" id="createUser" name="createUser" value="${fieldValue(bean:maintenanceItemInstance,field:'createUser')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastUpdated">Last Updated:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceItemInstance,field:'lastUpdated','errors')}">
                                    <g:datePicker name="lastUpdated" value="${maintenanceItemInstance?.lastUpdated}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="updateUser">Update User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceItemInstance,field:'updateUser','errors')}">
                                    <input type="text" id="updateUser" name="updateUser" value="${fieldValue(bean:maintenanceItemInstance,field:'updateUser')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="actualHours">Actual Hours:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceItemInstance,field:'actualHours','errors')}">
                                    <input type="text" id="actualHours" name="actualHours" value="${fieldValue(bean:maintenanceItemInstance,field:'actualHours')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceItemInstance,field:'description','errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:maintenanceItemInstance,field:'description')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="maintenance">Maintenance:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceItemInstance,field:'maintenance','errors')}">
                                    <g:select optionKey="id" from="${Maintenance.list()}" name="maintenance.id" value="${maintenanceItemInstance?.maintenance?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="notes">Notes:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceItemInstance,field:'notes','errors')}">
                                    <input type="text" id="notes" name="notes" value="${fieldValue(bean:maintenanceItemInstance,field:'notes')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="performed">Performed:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceItemInstance,field:'performed','errors')}">
                                    <g:checkBox name="performed" value="${maintenanceItemInstance?.performed}" ></g:checkBox>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="scheduleItem">Schedule Item:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceItemInstance,field:'scheduleItem','errors')}">
                                    <g:select optionKey="id" from="${MaintenanceScheduleItem.list()}" name="scheduleItem.id" value="${maintenanceItemInstance?.scheduleItem?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="authenticateService">Authenticate Service:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceItemInstance,field:'authenticateService','errors')}">
                                    
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
