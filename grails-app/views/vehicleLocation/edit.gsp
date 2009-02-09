

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit VehicleLocation</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">VehicleLocation List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New VehicleLocation</g:link></span>
        </div>
        <div class="body">
            <h1>Edit VehicleLocation</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${vehicleLocationInstance}">
            <div class="errors">
                <g:renderErrors bean="${vehicleLocationInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${vehicleLocationInstance?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateCreated">Date Created:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleLocationInstance,field:'dateCreated','errors')}">
                                    <g:datePicker name="dateCreated" value="${vehicleLocationInstance?.dateCreated}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="createUser">Create User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleLocationInstance,field:'createUser','errors')}">
                                    <input type="text" id="createUser" name="createUser" value="${fieldValue(bean:vehicleLocationInstance,field:'createUser')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastUpdated">Last Updated:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleLocationInstance,field:'lastUpdated','errors')}">
                                    <g:datePicker name="lastUpdated" value="${vehicleLocationInstance?.lastUpdated}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="updateUser">Update User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleLocationInstance,field:'updateUser','errors')}">
                                    <input type="text" id="updateUser" name="updateUser" value="${fieldValue(bean:vehicleLocationInstance,field:'updateUser')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="latitude">Latitude:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleLocationInstance,field:'latitude','errors')}">
                                    <input type="text" id="latitude" name="latitude" value="${fieldValue(bean:vehicleLocationInstance,field:'latitude')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="longitude">Longitude:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleLocationInstance,field:'longitude','errors')}">
                                    <input type="text" id="longitude" name="longitude" value="${fieldValue(bean:vehicleLocationInstance,field:'longitude')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="reportTime">Report Time:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleLocationInstance,field:'reportTime','errors')}">
                                    <g:datePicker name="reportTime" value="${vehicleLocationInstance?.reportTime}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="speed">Speed:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleLocationInstance,field:'speed','errors')}">
                                    <input type="text" id="speed" name="speed" value="${fieldValue(bean:vehicleLocationInstance,field:'speed')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="speedType">Speed Type:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleLocationInstance,field:'speedType','errors')}">
                                    <input type="text" id="speedType" name="speedType" value="${fieldValue(bean:vehicleLocationInstance,field:'speedType')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="vehicle">Vehicle:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleLocationInstance,field:'vehicle','errors')}">
                                    <g:select optionKey="id" from="${Vehicle.list()}" name="vehicle.id" value="${vehicleLocationInstance?.vehicle?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="authenticateService">Authenticate Service:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleLocationInstance,field:'authenticateService','errors')}">
                                    
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
