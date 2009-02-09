

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>AssemblyInstance List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New AssemblyInstance</g:link></span>
        </div>
        <div class="body">
            <h1>AssemblyInstance List</h1>
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
                        
                   	        <g:sortableColumn property="active" title="Active" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${assemblyInstanceInstanceList}" status="i" var="assemblyInstanceInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${assemblyInstanceInstance.id}">${fieldValue(bean:assemblyInstanceInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:assemblyInstanceInstance, field:'dateCreated')}</td>
                        
                            <td>${fieldValue(bean:assemblyInstanceInstance, field:'createUser')}</td>
                        
                            <td>${fieldValue(bean:assemblyInstanceInstance, field:'lastUpdated')}</td>
                        
                            <td>${fieldValue(bean:assemblyInstanceInstance, field:'updateUser')}</td>
                        
                            <td>${fieldValue(bean:assemblyInstanceInstance, field:'active')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${AssemblyInstance.count()}" />
            </div>
        </div>
    </body>
</html>
