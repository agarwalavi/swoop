<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title><g:message code="lookup.cache" default="Lookup Cache" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}"><g:message code="home" default="Home" /></a></span>
            <g:lookupMenuButton/>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="lookup.list" default="Lookup List" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="lookup.cache" default="Lookup Cache" /></h1>
            <div class="dialog">
                <g:if test="${stats.max > 0}">
                <table>
                    <tbody>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lookup.cache.max" default="Maximum cache size" />:</td>

                            <td valign="top" class="value"><g:formatNumber number="${stats.max / 1024}" format="0.00"/></td>

                            <td><g:formatNumber number="${1}" format="0.00%"/></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lookup.cache.size" default="Current cache size" />:</td>

                            <td valign="top" class="value"><g:formatNumber number="${stats.size / 1024}" format="0.00"/></td>

                            <td><g:formatNumber number="${stats.size / stats.max}" format="0.00%"/></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lookup.cache.count" default="Current number of entries" />:</td>

                            <td valign="top" class="value">${stats.count}</td>

                            <td>&nbsp;</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lookup.cache.hits" default="Number of hits" />:</td>

                            <td valign="top" class="value">${stats.hits}</td>

                            <td><g:formatNumber number="${(stats.hits == 0) ? 0 : stats.hits / (stats.hits + stats.misses)}" format="0.00%"/></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lookup.cache.misses" default="Number of misses" />:</td>

                            <td valign="top" class="value">${stats.misses}</td>

                            <td><g:formatNumber number="${(stats.misses == 0) ? 0 : stats.misses / (stats.hits + stats.misses)}" format="0.00%"/></td>

                        </tr>

                    </tbody>
                </table>
                </g:if>
                <g:else>
                    <p><g:message code="lookup.cache.disabled" default="Caching has been disabled. Alter the lookups.cache.size.kb setting in Config.groovy to enable caching." /></p>
                </g:else>
            </div>
            <g:if test="${stats.max > 0}">
                <g:form action="reset" method="post" >
                    <div class="buttons">
                        <span class="button"><input class="save" type="submit" value="${message(code:'lookup.cache.reset', 'default':'Reset')}" /></span>
                    </div>
                </g:form>
            </g:if>
        </div>
    </body>
</html>
