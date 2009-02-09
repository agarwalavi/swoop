

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Assembly</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Assembly List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Assembly</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Assembly</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${assemblyInstance}">
            <div class="errors">
                <g:renderErrors bean="${assemblyInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${assemblyInstance?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateCreated">Date Created:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:assemblyInstance,field:'dateCreated','errors')}">
                                    <g:datePicker name="dateCreated" value="${assemblyInstance?.dateCreated}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="createUser">Create User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:assemblyInstance,field:'createUser','errors')}">
                                    <input type="text" id="createUser" name="createUser" value="${fieldValue(bean:assemblyInstance,field:'createUser')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastUpdated">Last Updated:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:assemblyInstance,field:'lastUpdated','errors')}">
                                    <g:datePicker name="lastUpdated" value="${assemblyInstance?.lastUpdated}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="updateUser">Update User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:assemblyInstance,field:'updateUser','errors')}">
                                    <input type="text" id="updateUser" name="updateUser" value="${fieldValue(bean:assemblyInstance,field:'updateUser')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="partNumber">Part Number:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:assemblyInstance,field:'partNumber','errors')}">
                                    <input type="text" id="partNumber" name="partNumber" value="${fieldValue(bean:assemblyInstance,field:'partNumber')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="make">Make:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:assemblyInstance,field:'make','errors')}">
                                    <input type="text" id="make" name="make" value="${fieldValue(bean:assemblyInstance,field:'make')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="model">Model:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:assemblyInstance,field:'model','errors')}">
                                    <input type="text" id="model" name="model" value="${fieldValue(bean:assemblyInstance,field:'model')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="reportInterval">Report Interval:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:assemblyInstance,field:'reportInterval','errors')}">
                                    <input type="text" id="reportInterval" name="reportInterval" value="${fieldValue(bean:assemblyInstance,field:'reportInterval')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="reportIntervalType">Report Interval Type:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:assemblyInstance,field:'reportIntervalType','errors')}">
                                    <input type="text" id="reportIntervalType" name="reportIntervalType" value="${fieldValue(bean:assemblyInstance,field:'reportIntervalType')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="requiresReport">Requires Report:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:assemblyInstance,field:'requiresReport','errors')}">
                                    <g:checkBox name="requiresReport" value="${assemblyInstance?.requiresReport}" ></g:checkBox>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="size">Size:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:assemblyInstance,field:'size','errors')}">
                                    <input type="text" id="size" name="size" value="${fieldValue(bean:assemblyInstance,field:'size')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="parts">Parts:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:assemblyInstance,field:'parts','errors')}">
                                    
<ul>
<g:each var="p" in="${assemblyInstance?.parts?}">
    <li><g:link controller="partInstance" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="partInstance" params="['assembly.id':assemblyInstance?.id]" action="create">Add PartInstance</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="vendorParts">Vendor Parts:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:assemblyInstance,field:'vendorParts','errors')}">
                                    
<ul>
<g:each var="v" in="${assemblyInstance?.vendorParts?}">
    <li><g:link controller="vendorPart" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="vendorPart" params="['assembly.id':assemblyInstance?.id]" action="create">Add VendorPart</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="authenticateService">Authenticate Service:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:assemblyInstance,field:'authenticateService','errors')}">
                                    
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
