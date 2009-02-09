

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title><g:message code="lookup.list" default="Lookup List" /></title>
        <g:lookupHelpBalloons />
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}"><g:message code="home" default="Home" /></a></span>
            <g:lookupMenuButton/>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="lookup.new" default="New Lookup" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="lookup.list" default="Lookup List" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:lookupCriteria/>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="realm" title="Realm" titleKey="lookup.realm" />
                        
                   	        <g:sortableColumn property="codeType" title="Code Type" titleKey="lookup.codeType" />

                   	        <g:sortableColumn property="codeMinimum" title="Code Minimum" titleKey="lookup.codeMinimum" />

                   	        <g:sortableColumn property="codeMaximum" title="Code Maximum" titleKey="lookup.codeMaximum" />

                   	        <g:sortableColumn property="codeScale" title="Code Scale" titleKey="lookup.codeScale" />

                   	        <g:sortableColumn property="valueType" title="Value Type" titleKey="lookup.valueType" />

                   	        <g:sortableColumn property="valueMinimum" title="Value Minimum" titleKey="lookup.valueMinimum" />

                   	        <g:sortableColumn property="valueMaximum" title="Value Maximum" titleKey="lookup.valueMaximum" />

                   	        <g:sortableColumn property="valueScale" title="Value Scale" titleKey="lookup.valueScale" />

                   	        <g:sortableColumn property="ordering" title="Ordering" titleKey="lookup.ordering" />

                   	        <g:sortableColumn property="internationalize" title="Internationalize" titleKey="lookup.internationalize" />

                                <g:lookupHeading/>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${lookupList}" status="i" var="lookup">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${lookup.id}">${fieldValue(bean:lookup, field:'realm')}</g:link></td>
                        
                            <td><g:message code="lookup.type.${lookup.codeType}" default="${lookup.codeType}" encodeAs="HTML" /></td>

                            <td>${fieldValue(bean:lookup, field:'codeMinimum')}</td>

                            <td>${fieldValue(bean:lookup, field:'codeMaximum')}</td>

                            <td>${fieldValue(bean:lookup, field:'codeScale')}</td>

                            <td><g:message code="lookup.type.${lookup.valueType}" default="${lookup.valueType}" encodeAs="HTML" /></td>

                            <td>${fieldValue(bean:lookup, field:'valueMinimum')}</td>

                            <td>${fieldValue(bean:lookup, field:'valueMaximum')}</td>

                            <td>${fieldValue(bean:lookup, field:'valueScale')}</td>

                            <td><g:message code="lookup.ordering.${lookup.ordering}" default="${lookup.ordering}" encodeAs="HTML" /></td>

                            <td><img src="<g:createLinkTo dir="${pluginContextPath}/images" file="${lookup.internationalize}.png"/>" border="0"/></td>

                            <g:lookupData value="${lookup.id}"/>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:lookupPaginate />
            </div>
        </div>
    </body>
</html>
