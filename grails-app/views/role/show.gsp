<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN""http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title><g:message code="role.heading.show"/></title>
</head>
<body>
<div class="body">
  <div class="pageHeading"><g:message code="role.heading.show"/></div>
  <g:swoopFlash/>
  <div class="span-24 last form">
    <g:form>
      <div class="span-4"><g:swoopOutputValue id="role.id" label="role.id" value="${authority?.id}" newline="true"/></div>
      <div class="span-8"><g:swoopOutputValue id="role.name" label="role.name" value="${authority.authority.substring(5).toLowerCase()?.encodeAsHTML()}" newline="true"/></div>
      <div class="span-12 last"><g:swoopOutputValue id="role.description" label="role.description" value="${authority?.description?.encodeAsHTML()}" newline="true"/></div>
      <div class="span-24 last">&nbsp;</div>
      <div class="span-24 last">
        <label for="people"><g:message code="role.people"/></label>
      </div>
      <div id="people" class="span-24 last">
        <g:each var="p" in="${authority?.people}">
          <span>${p.username}</span>
        </g:each>
      </div>
      <div class="span-24 last">&nbsp;</div>
      <div class="buttons">
        <input type="hidden" name="id" value="${authority?.id}"/>
        <g:ifAnyGranted role="ROLE_MASTER_ADMIN">
          <g:actionSubmit class="button edit" value="Edit"/>
        </g:ifAnyGranted>
      </div>
    </g:form>
  </div>
</div>
</body>
</html>

