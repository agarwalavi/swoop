<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN""http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title><g:message code="role.heading.list"/></title>
</head>
<body>
<div class="body">
  <div class="pageHeading"><g:message code="role.heading.list"/></div>
  <g:swoopFlash/>
  <g:ifAnyGranted role="ROLE_MASTER_ADMIN">
    <div class="buttons">
      <g:link class="button create" controller="role" action="create">Create</g:link>
    </div>
  </g:ifAnyGranted>
  <div class="tableDiv">
    <table id="roleTable" class="table">
      <thead>
      <tr>
        <g:sortableColumn property="id" titleKey="role.column.id"/>
        <g:sortableColumn property="authority" titleKey="role.column.name"/>
        <g:sortableColumn property="description" titleKey="role.column.description"/>
      </tr>
      </thead>
      <tbody>
      <g:each in="${authorityList}" status="i" var="authority">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
          <td><g:link controller="role" action="show" id="${authority?.id}">${authority?.id?.encodeAsHTML()}</g:link></td>
          <td>${authority?.authority?.substring(5)?.toLowerCase()?.encodeAsHTML()}</td>
          <td>${authority?.description?.encodeAsHTML()}</td>
        </tr>
      </g:each>
      </tbody>
    </table>
    <div class="paginateButtons">
      <g:paginate total="${Role?.count()}"/>
    </div>
  </div>
</div>
</body>
</html>

