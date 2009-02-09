

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title><g:message code="lookupValue.list" default="Lookup Value List" /></title>
        <g:lookupHelpBalloons />
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}"><g:message code="home" default="Home" /></a></span>
            <g:lookupMenuButton/>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="lookupValue.new" default="New LookupValue" /></g:link></span>
        </div>
        <div class="body">
            <g:if test="${ddLookup}">
                <h1><g:message code="lookupValue.list.for" default="Lookup Value List for" /> ${ddLookup.realm.encodeAsHTML()} <g:lookupDrilldownReturn/></h1>
            </g:if>
            <g:else>
                <h1><g:message code="lookupValue.list" default="Lookup Value List" /></h1>
            </g:else>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:lookupCriteria exclude="stringSequencer, numericSequencer"/>
            <div class="list">
                <table>
                    <thead>
                        <tr>

                                <g:if test="${!ddLookup}">
                                    <g:sortableColumn property="lookup" title="Lookup" titleKey="lookupValue.lookup" />
                                </g:if>
                        
                   	        <g:sortableColumn property="code" title="Code" titleKey="lookupValue.code" />
                        
                   	        <g:sortableColumn property="value" title="Value" titleKey="lookupValue.value" />

                   	        <g:sortableColumn property="sequencer" title="Sequencer" titleKey="lookupValue.sequencer" />
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${lookupValueList}" status="i" var="lookupValue">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <g:if test="${!ddLookup}">
                                <td>${fieldValue(bean:lookupValue, field:'lookup')}</td>
                            </g:if>
                        
                            <td><g:link action="show" id="${lookupValue.id}">${fieldValue(bean:lookupValue, field:'code')}</g:link></td>
                        
                            <td>${fieldValue(bean:lookupValue, field:'value')}</td>

                            <td>${fieldValue(bean:lookupValue, field:'sequencer')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:lookupValuePaginate />
            </div>
        </div>
    </body>
</html>
