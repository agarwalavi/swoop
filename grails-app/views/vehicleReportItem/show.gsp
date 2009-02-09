

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show VehicleReportItem</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">VehicleReportItem List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New VehicleReportItem</g:link></span>
        </div>
        <div class="body">
            <h1>Show VehicleReportItem</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:vehicleReportItemInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Date Created:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:vehicleReportItemInstance, field:'dateCreated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Create User:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:vehicleReportItemInstance, field:'createUser')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Last Updated:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:vehicleReportItemInstance, field:'lastUpdated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Update User:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:vehicleReportItemInstance, field:'updateUser')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Assembly:</td>
                            
                            <td valign="top" class="value"><g:link controller="assemblyInstance" action="show" id="${vehicleReportItemInstance?.assembly?.id}">${vehicleReportItemInstance?.assembly?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Report:</td>
                            
                            <td valign="top" class="value"><g:link controller="vehicleReport" action="show" id="${vehicleReportItemInstance?.report?.id}">${vehicleReportItemInstance?.report?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Report Interval:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:vehicleReportItemInstance, field:'reportInterval')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Report Interval Type:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:vehicleReportItemInstance, field:'reportIntervalType')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Authenticate Service:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:vehicleReportItemInstance, field:'authenticateService')}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${vehicleReportItemInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
