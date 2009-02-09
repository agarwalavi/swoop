

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Location</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Location List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Location</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Location</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${locationInstance}">
            <div class="errors">
                <g:renderErrors bean="${locationInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${locationInstance?.id}" />
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
                                    <label for="assemblies">Assemblies:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:locationInstance,field:'assemblies','errors')}">
                                    
<ul>
<g:each var="a" in="${locationInstance?.assemblies?}">
    <li><g:link controller="assemblyInstance" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="assemblyInstance" params="['location.id':locationInstance?.id]" action="create">Add AssemblyInstance</g:link>

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
                                    <label for="orders">Orders:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:locationInstance,field:'orders','errors')}">
                                    
<ul>
<g:each var="o" in="${locationInstance?.orders?}">
    <li><g:link controller="order" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="order" params="['location.id':locationInstance?.id]" action="create">Add Order</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="parts">Parts:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:locationInstance,field:'parts','errors')}">
                                    
<ul>
<g:each var="p" in="${locationInstance?.parts?}">
    <li><g:link controller="partInstance" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="partInstance" params="['location.id':locationInstance?.id]" action="create">Add PartInstance</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="people">People:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:locationInstance,field:'people','errors')}">
                                    
<ul>
<g:each var="p" in="${locationInstance?.people?}">
    <li><g:link controller="user" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="user" params="['location.id':locationInstance?.id]" action="create">Add User</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="vehicles">Vehicles:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:locationInstance,field:'vehicles','errors')}">
                                    
<ul>
<g:each var="v" in="${locationInstance?.vehicles?}">
    <li><g:link controller="vehicle" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="vehicle" params="['location.id':locationInstance?.id]" action="create">Add Vehicle</g:link>

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
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
