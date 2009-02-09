

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Notification List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Notification</g:link></span>
        </div>
        <div class="body">
            <h1>Notification List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="dateCreated" title="Date Created" />
                        
                   	        <g:sortableColumn property="createUser" title="Create User" />
                        
                   	        <g:sortableColumn property="lastUpdated" title="Last Updated" />
                        
                   	        <g:sortableColumn property="updateUser" title="Update User" />
                        
                   	        <g:sortableColumn property="beginDate" title="Begin Date" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${notificationInstanceList}" status="i" var="notificationInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${notificationInstance.id}">${fieldValue(bean:notificationInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:notificationInstance, field:'dateCreated')}</td>
                        
                            <td>${fieldValue(bean:notificationInstance, field:'createUser')}</td>
                        
                            <td>${fieldValue(bean:notificationInstance, field:'lastUpdated')}</td>
                        
                            <td>${fieldValue(bean:notificationInstance, field:'updateUser')}</td>
                        
                            <td>${fieldValue(bean:notificationInstance, field:'beginDate')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Notification.count()}" />
            </div>
        </div>
    </body>
</html>
