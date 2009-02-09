

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Notification</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Notification List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Notification</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${notificationInstance}">
            <div class="errors">
                <g:renderErrors bean="${notificationInstance}" as="list" />
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
                                <td valign="top" class="value ${hasErrors(bean:notificationInstance,field:'dateCreated','errors')}">
                                    <g:datePicker name="dateCreated" value="${notificationInstance?.dateCreated}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="createUser">Create User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:notificationInstance,field:'createUser','errors')}">
                                    <input type="text" id="createUser" name="createUser" value="${fieldValue(bean:notificationInstance,field:'createUser')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastUpdated">Last Updated:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:notificationInstance,field:'lastUpdated','errors')}">
                                    <g:datePicker name="lastUpdated" value="${notificationInstance?.lastUpdated}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="updateUser">Update User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:notificationInstance,field:'updateUser','errors')}">
                                    <input type="text" id="updateUser" name="updateUser" value="${fieldValue(bean:notificationInstance,field:'updateUser')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="beginDate">Begin Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:notificationInstance,field:'beginDate','errors')}">
                                    <g:datePicker name="beginDate" value="${notificationInstance?.beginDate}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:notificationInstance,field:'description','errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:notificationInstance,field:'description')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="emailSubject">Email Subject:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:notificationInstance,field:'emailSubject','errors')}">
                                    <input type="text" id="emailSubject" name="emailSubject" value="${fieldValue(bean:notificationInstance,field:'emailSubject')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="emailText">Email Text:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:notificationInstance,field:'emailText','errors')}">
                                    <input type="text" id="emailText" name="emailText" value="${fieldValue(bean:notificationInstance,field:'emailText')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endDate">End Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:notificationInstance,field:'endDate','errors')}">
                                    <g:datePicker name="endDate" value="${notificationInstance?.endDate}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="interval">Interval:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:notificationInstance,field:'interval','errors')}">
                                    <input type="text" id="interval" name="interval" value="${fieldValue(bean:notificationInstance,field:'interval')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="period">Period:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:notificationInstance,field:'period','errors')}">
                                    <input type="text" id="period" name="period" value="${fieldValue(bean:notificationInstance,field:'period')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="type">Type:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:notificationInstance,field:'type','errors')}">
                                    <input type="text" id="type" name="type" value="${fieldValue(bean:notificationInstance,field:'type')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="authenticateService">Authenticate Service:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:notificationInstance,field:'authenticateService','errors')}">
                                    
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
