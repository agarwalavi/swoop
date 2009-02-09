

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Order List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Order</g:link></span>
        </div>
        <div class="body">
            <h1>Order List</h1>
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
                        
                   	        <g:sortableColumn property="complete" title="Complete" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${orderInstanceList}" status="i" var="orderInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${orderInstance.id}">${fieldValue(bean:orderInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:orderInstance, field:'dateCreated')}</td>
                        
                            <td>${fieldValue(bean:orderInstance, field:'createUser')}</td>
                        
                            <td>${fieldValue(bean:orderInstance, field:'lastUpdated')}</td>
                        
                            <td>${fieldValue(bean:orderInstance, field:'updateUser')}</td>
                        
                            <td>${fieldValue(bean:orderInstance, field:'complete')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Order.count()}" />
            </div>
        </div>
    </body>
</html>
