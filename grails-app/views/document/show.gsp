

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Document</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Document List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Document</g:link></span>
        </div>
        <div class="body">
            <h1>Show Document</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:documentInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Date Created:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:documentInstance, field:'dateCreated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Create User:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:documentInstance, field:'createUser')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Last Updated:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:documentInstance, field:'lastUpdated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Update User:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:documentInstance, field:'updateUser')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Cost:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:documentInstance, field:'cost')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Effective Date:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:documentInstance, field:'effectiveDate')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Expiration Date:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:documentInstance, field:'expirationDate')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Number:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:documentInstance, field:'number')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Province:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:documentInstance, field:'province')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Type:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:documentInstance, field:'type')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Vehicle:</td>
                            
                            <td valign="top" class="value"><g:link controller="vehicle" action="show" id="${documentInstance?.vehicle?.id}">${documentInstance?.vehicle?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Authenticate Service:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:documentInstance, field:'authenticateService')}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${documentInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
