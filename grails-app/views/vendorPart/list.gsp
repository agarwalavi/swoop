

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>VendorPart List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New VendorPart</g:link></span>
        </div>
        <div class="body">
            <h1>VendorPart List</h1>
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
                        
                   	        <g:sortableColumn property="description" title="Description" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${vendorPartInstanceList}" status="i" var="vendorPartInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${vendorPartInstance.id}">${fieldValue(bean:vendorPartInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:vendorPartInstance, field:'dateCreated')}</td>
                        
                            <td>${fieldValue(bean:vendorPartInstance, field:'createUser')}</td>
                        
                            <td>${fieldValue(bean:vendorPartInstance, field:'lastUpdated')}</td>
                        
                            <td>${fieldValue(bean:vendorPartInstance, field:'updateUser')}</td>
                        
                            <td>${fieldValue(bean:vendorPartInstance, field:'description')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${VendorPart.count()}" />
            </div>
        </div>
    </body>
</html>
