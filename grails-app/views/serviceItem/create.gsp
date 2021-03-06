

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create ServiceItem</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">ServiceItem List</g:link></span>
        </div>
        <div class="body">
            <h1>Create ServiceItem</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${serviceItemInstance}">
            <div class="errors">
                <g:renderErrors bean="${serviceItemInstance}" as="list" />
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
                                <td valign="top" class="value ${hasErrors(bean:serviceItemInstance,field:'dateCreated','errors')}">
                                    <g:datePicker name="dateCreated" value="${serviceItemInstance?.dateCreated}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="createUser">Create User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceItemInstance,field:'createUser','errors')}">
                                    <input type="text" id="createUser" name="createUser" value="${fieldValue(bean:serviceItemInstance,field:'createUser')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastUpdated">Last Updated:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceItemInstance,field:'lastUpdated','errors')}">
                                    <g:datePicker name="lastUpdated" value="${serviceItemInstance?.lastUpdated}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="updateUser">Update User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceItemInstance,field:'updateUser','errors')}">
                                    <input type="text" id="updateUser" name="updateUser" value="${fieldValue(bean:serviceItemInstance,field:'updateUser')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="datePerformed">Date Performed:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceItemInstance,field:'datePerformed','errors')}">
                                    <g:datePicker name="datePerformed" value="${serviceItemInstance?.datePerformed}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceItemInstance,field:'description','errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:serviceItemInstance,field:'description')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="hourlyRate">Hourly Rate:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceItemInstance,field:'hourlyRate','errors')}">
                                    <input type="text" id="hourlyRate" name="hourlyRate" value="${fieldValue(bean:serviceItemInstance,field:'hourlyRate')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="hours">Hours:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceItemInstance,field:'hours','errors')}">
                                    <input type="text" id="hours" name="hours" value="${fieldValue(bean:serviceItemInstance,field:'hours')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="notes">Notes:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceItemInstance,field:'notes','errors')}">
                                    <input type="text" id="notes" name="notes" value="${fieldValue(bean:serviceItemInstance,field:'notes')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="servicePerson">Service Person:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceItemInstance,field:'servicePerson','errors')}">
                                    <g:select optionKey="id" from="${User.list()}" name="servicePerson.id" value="${serviceItemInstance?.servicePerson?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="serviceRequest">Service Request:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceItemInstance,field:'serviceRequest','errors')}">
                                    <g:select optionKey="id" from="${ServiceRequest.list()}" name="serviceRequest.id" value="${serviceItemInstance?.serviceRequest?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="totalCost">Total Cost:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceItemInstance,field:'totalCost','errors')}">
                                    <input type="text" id="totalCost" name="totalCost" value="${fieldValue(bean:serviceItemInstance,field:'totalCost')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="authenticateService">Authenticate Service:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceItemInstance,field:'authenticateService','errors')}">
                                    
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
