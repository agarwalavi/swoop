

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title><g:message code="setting.list" default="Setting List" /></title>
        <g:settingHelpBalloons />
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}"><g:message code="home" default="Home" /></a></span>
            <g:settingMenuButton/>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="setting.new" default="New Setting" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="setting.list" default="Setting List" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:settingCriteria/>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="code" title="Code" titleKey="setting.code" />
                        
                   	        <g:sortableColumn property="type" title="Type" titleKey="setting.type" />
                        
                   	        <g:sortableColumn property="value" title="Value" titleKey="setting.value" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${settingList}" status="i" var="setting">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${setting.id}">${fieldValue(bean:setting, field:'code')}</g:link></td>
                        
                            <td><g:message code="setting.type.${setting.type}" default="${setting.type}" encodeAs="HTML" /></td>
                        
                            <td>${fieldValue(bean:setting, field:'value')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:settingPaginate />
            </div>
        </div>
    </body>
</html>
