

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit MaintenanceSchedule</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">MaintenanceSchedule List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New MaintenanceSchedule</g:link></span>
        </div>
        <div class="body">
            <h1>Edit MaintenanceSchedule</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${maintenanceScheduleInstance}">
            <div class="errors">
                <g:renderErrors bean="${maintenanceScheduleInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${maintenanceScheduleInstance?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateCreated">Date Created:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceScheduleInstance,field:'dateCreated','errors')}">
                                    <g:datePicker name="dateCreated" value="${maintenanceScheduleInstance?.dateCreated}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="createUser">Create User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceScheduleInstance,field:'createUser','errors')}">
                                    <input type="text" id="createUser" name="createUser" value="${fieldValue(bean:maintenanceScheduleInstance,field:'createUser')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastUpdated">Last Updated:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceScheduleInstance,field:'lastUpdated','errors')}">
                                    <g:datePicker name="lastUpdated" value="${maintenanceScheduleInstance?.lastUpdated}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="updateUser">Update User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceScheduleInstance,field:'updateUser','errors')}">
                                    <input type="text" id="updateUser" name="updateUser" value="${fieldValue(bean:maintenanceScheduleInstance,field:'updateUser')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="assemblyType">Assembly Type:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceScheduleInstance,field:'assemblyType','errors')}">
                                    <input type="text" id="assemblyType" name="assemblyType" value="${fieldValue(bean:maintenanceScheduleInstance,field:'assemblyType')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceScheduleInstance,field:'description','errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:maintenanceScheduleInstance,field:'description')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fuelType">Fuel Type:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceScheduleInstance,field:'fuelType','errors')}">
                                    <input type="text" id="fuelType" name="fuelType" value="${fieldValue(bean:maintenanceScheduleInstance,field:'fuelType')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="maintenanceInterval">Maintenance Interval:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceScheduleInstance,field:'maintenanceInterval','errors')}">
                                    <input type="text" id="maintenanceInterval" name="maintenanceInterval" value="${fieldValue(bean:maintenanceScheduleInstance,field:'maintenanceInterval')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="maintenanceIntervalType">Maintenance Interval Type:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceScheduleInstance,field:'maintenanceIntervalType','errors')}">
                                    <input type="text" id="maintenanceIntervalType" name="maintenanceIntervalType" value="${fieldValue(bean:maintenanceScheduleInstance,field:'maintenanceIntervalType')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="make">Make:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceScheduleInstance,field:'make','errors')}">
                                    <input type="text" id="make" name="make" value="${fieldValue(bean:maintenanceScheduleInstance,field:'make')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="model">Model:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceScheduleInstance,field:'model','errors')}">
                                    <input type="text" id="model" name="model" value="${fieldValue(bean:maintenanceScheduleInstance,field:'model')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceScheduleInstance,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:maintenanceScheduleInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="scheduleItems">Schedule Items:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceScheduleInstance,field:'scheduleItems','errors')}">
                                    
<ul>
<g:each var="s" in="${maintenanceScheduleInstance?.scheduleItems?}">
    <li><g:link controller="maintenanceScheduleItem" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="maintenanceScheduleItem" params="['maintenanceSchedule.id':maintenanceScheduleInstance?.id]" action="create">Add MaintenanceScheduleItem</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="vehicleType">Vehicle Type:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceScheduleInstance,field:'vehicleType','errors')}">
                                    <input type="text" id="vehicleType" name="vehicleType" value="${fieldValue(bean:maintenanceScheduleInstance,field:'vehicleType')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="authenticateService">Authenticate Service:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:maintenanceScheduleInstance,field:'authenticateService','errors')}">
                                    
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
