

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Location</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Location List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Location</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${locationInstance}">
            <div class="errors">
                <g:renderErrors bean="${locationInstance}" as="list" />
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
                                <td valign="top" class="value ${hasErrors(bean:locationInstance,field:'dateCreated','errors')}">
                                    <g:datePicker name="dateCreated" value="${locationInstance?.dateCreated}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="createUser">Create User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:locationInstance,field:'createUser','errors')}">
                                    <input type="text" id="createUser" name="createUser" value="${fieldValue(bean:locationInstance,field:'createUser')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastUpdated">Last Updated:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:locationInstance,field:'lastUpdated','errors')}">
                                    <g:datePicker name="lastUpdated" value="${locationInstance?.lastUpdated}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="updateUser">Update User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:locationInstance,field:'updateUser','errors')}">
                                    <input type="text" id="updateUser" name="updateUser" value="${fieldValue(bean:locationInstance,field:'updateUser')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="address">Address:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:locationInstance,field:'address','errors')}">
                                    
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="contact">Contact:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:locationInstance,field:'contact','errors')}">
                                    
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="latitude">Latitude:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:locationInstance,field:'latitude','errors')}">
                                    <input type="text" id="latitude" name="latitude" value="${fieldValue(bean:locationInstance,field:'latitude')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="locationId">Location Id:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:locationInstance,field:'locationId','errors')}">
                                    <input type="text" id="locationId" name="locationId" value="${fieldValue(bean:locationInstance,field:'locationId')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="locationName">Location Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:locationInstance,field:'locationName','errors')}">
                                    <input type="text" id="locationName" name="locationName" value="${fieldValue(bean:locationInstance,field:'locationName')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="longitude">Longitude:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:locationInstance,field:'longitude','errors')}">
                                    <input type="text" id="longitude" name="longitude" value="${fieldValue(bean:locationInstance,field:'longitude')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="mailAddress">Mail Address:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:locationInstance,field:'mailAddress','errors')}">
                                    
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="manager">Manager:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:locationInstance,field:'manager','errors')}">
                                    <g:select optionKey="id" from="${User.list()}" name="manager.id" value="${locationInstance?.manager?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="authenticateService">Authenticate Service:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:locationInstance,field:'authenticateService','errors')}">
                                    
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
