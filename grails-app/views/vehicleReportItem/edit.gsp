

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit VehicleReportItem</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">VehicleReportItem List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New VehicleReportItem</g:link></span>
        </div>
        <div class="body">
            <h1>Edit VehicleReportItem</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${vehicleReportItemInstance}">
            <div class="errors">
                <g:renderErrors bean="${vehicleReportItemInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${vehicleReportItemInstance?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateCreated">Date Created:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleReportItemInstance,field:'dateCreated','errors')}">
                                    <g:datePicker name="dateCreated" value="${vehicleReportItemInstance?.dateCreated}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="createUser">Create User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleReportItemInstance,field:'createUser','errors')}">
                                    <input type="text" id="createUser" name="createUser" value="${fieldValue(bean:vehicleReportItemInstance,field:'createUser')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastUpdated">Last Updated:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleReportItemInstance,field:'lastUpdated','errors')}">
                                    <g:datePicker name="lastUpdated" value="${vehicleReportItemInstance?.lastUpdated}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="updateUser">Update User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleReportItemInstance,field:'updateUser','errors')}">
                                    <input type="text" id="updateUser" name="updateUser" value="${fieldValue(bean:vehicleReportItemInstance,field:'updateUser')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="assembly">Assembly:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleReportItemInstance,field:'assembly','errors')}">
                                    <g:select optionKey="id" from="${AssemblyInstance.list()}" name="assembly.id" value="${vehicleReportItemInstance?.assembly?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="report">Report:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleReportItemInstance,field:'report','errors')}">
                                    <g:select optionKey="id" from="${VehicleReport.list()}" name="report.id" value="${vehicleReportItemInstance?.report?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="reportInterval">Report Interval:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleReportItemInstance,field:'reportInterval','errors')}">
                                    <input type="text" id="reportInterval" name="reportInterval" value="${fieldValue(bean:vehicleReportItemInstance,field:'reportInterval')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="reportIntervalType">Report Interval Type:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleReportItemInstance,field:'reportIntervalType','errors')}">
                                    <input type="text" id="reportIntervalType" name="reportIntervalType" value="${fieldValue(bean:vehicleReportItemInstance,field:'reportIntervalType')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="authenticateService">Authenticate Service:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vehicleReportItemInstance,field:'authenticateService','errors')}">
                                    
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
