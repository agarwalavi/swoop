

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create ServiceRequest</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">ServiceRequest List</g:link></span>
        </div>
        <div class="body">
            <h1>Create ServiceRequest</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${serviceRequestInstance}">
            <div class="errors">
                <g:renderErrors bean="${serviceRequestInstance}" as="list" />
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
                                <td valign="top" class="value ${hasErrors(bean:serviceRequestInstance,field:'dateCreated','errors')}">
                                    <g:datePicker name="dateCreated" value="${serviceRequestInstance?.dateCreated}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="createUser">Create User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceRequestInstance,field:'createUser','errors')}">
                                    <input type="text" id="createUser" name="createUser" value="${fieldValue(bean:serviceRequestInstance,field:'createUser')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastUpdated">Last Updated:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceRequestInstance,field:'lastUpdated','errors')}">
                                    <g:datePicker name="lastUpdated" value="${serviceRequestInstance?.lastUpdated}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="updateUser">Update User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceRequestInstance,field:'updateUser','errors')}">
                                    <input type="text" id="updateUser" name="updateUser" value="${fieldValue(bean:serviceRequestInstance,field:'updateUser')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="assembly">Assembly:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceRequestInstance,field:'assembly','errors')}">
                                    <g:select optionKey="id" from="${Assembly.list()}" name="assembly.id" value="${serviceRequestInstance?.assembly?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="completionDate">Completion Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceRequestInstance,field:'completionDate','errors')}">
                                    <g:datePicker name="completionDate" value="${serviceRequestInstance?.completionDate}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="location">Location:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceRequestInstance,field:'location','errors')}">
                                    <g:select optionKey="id" from="${Location.list()}" name="location.id" value="${serviceRequestInstance?.location?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="number">Number:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceRequestInstance,field:'number','errors')}">
                                    <input type="text" id="number" name="number" value="${fieldValue(bean:serviceRequestInstance,field:'number')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="scheduledDate">Scheduled Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceRequestInstance,field:'scheduledDate','errors')}">
                                    <g:datePicker name="scheduledDate" value="${serviceRequestInstance?.scheduledDate}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="serviceItem">Service Item:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceRequestInstance,field:'serviceItem','errors')}">
                                    <g:select optionKey="id" from="${ServiceItem.list()}" name="serviceItem.id" value="${serviceRequestInstance?.serviceItem?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startDate">Start Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceRequestInstance,field:'startDate','errors')}">
                                    <g:datePicker name="startDate" value="${serviceRequestInstance?.startDate}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="type">Type:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceRequestInstance,field:'type','errors')}">
                                    <input type="text" id="type" name="type" value="${fieldValue(bean:serviceRequestInstance,field:'type')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="vehicle">Vehicle:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceRequestInstance,field:'vehicle','errors')}">
                                    <g:select optionKey="id" from="${Vehicle.list()}" name="vehicle.id" value="${serviceRequestInstance?.vehicle?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="authenticateService">Authenticate Service:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceRequestInstance,field:'authenticateService','errors')}">
                                    
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
