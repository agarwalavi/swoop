

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Part List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Part</g:link></span>
        </div>
        <div class="body">
            <h1>Part List</h1>
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
                        
                   	        <g:sortableColumn property="bulk" title="Bulk" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${partInstanceList}" status="i" var="partInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${partInstance.id}">${fieldValue(bean:partInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:partInstance, field:'dateCreated')}</td>
                        
                            <td>${fieldValue(bean:partInstance, field:'createUser')}</td>
                        
                            <td>${fieldValue(bean:partInstance, field:'lastUpdated')}</td>
                        
                            <td>${fieldValue(bean:partInstance, field:'updateUser')}</td>
                        
                            <td>${fieldValue(bean:partInstance, field:'bulk')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Part.count()}" />
            </div>
        </div>
    </body>
</html>
