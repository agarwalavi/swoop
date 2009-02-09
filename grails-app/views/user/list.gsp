<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN""http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title><g:message code="user.heading.list"/></title>
</head>
<body>

<div class="body">
  <div class="pageHeading"><g:message code="user.heading.list"/></div>
  <g:swoopFlash/>
  <g:ifAnyGranted role="ROLE_MASTER_ADMIN,ROLE_ADMIN">
    <div class="buttons">
      <g:link class="button create" controller="user" action="create">Create</g:link>
    </div>
  </g:ifAnyGranted>
  <div class="tableDiv">
    <table id="userTable" class="table">
      <thead>
      <tr>
        <g:sortableColumn property="id" titleKey="user.column.id"/>
        <g:sortableColumn property="username" titleKey="user.column.username"/>
        <th><g:message code="user.column.fullName"/></th>
        <g:sortableColumn property="companyName" titleKey="user.column.company"/>
        <g:sortableColumn property="contact.emailAddress" titleKey="user.column.email"/>
        <g:sortableColumn property="enabled" titleKey="user.column.enabled"/>
      </tr>
      </thead>
      <tbody>
      <g:each in="${personList}" status="i" var="person">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
          <td class="actionButtons"><span class="actionButton"><g:link action="show"
                  id="${person?.id}">${person.id?.encodeAsHTML()}</g:link></span></td>
          <td>${person?.username?.encodeAsHTML()}</td>
          <td>${person?.fullName?.encodeAsHTML()}</td>
          <td>${person?.companyName?.encodeAsHTML()}</td>
          <td>${person?.contact?.emailAddress?.encodeAsHTML()}</td>
          <td>${person?.enabled?.encodeAsHTML()}</td>
        </tr>
      </g:each>
      </tbody>
    </table>
    <div class="paginateButtons">
      <g:paginate total="${User?.count()}"/>
    </div>
  </div>
</div>
</body>
</html>
