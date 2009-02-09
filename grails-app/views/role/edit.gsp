<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN""http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title><g:message code="role.heading.edit"/></title>
</head>
<body>
<div class="body">
  <div class="pageHeading"><g:message code="role.heading.edit"/></div>
  <g:swoopFlash/>
  <g:hasErrors bean="${authority}">
    <div class="errors">
      <g:renderErrors bean="${authority}" as="list"/>
    </div>
  </g:hasErrors>
  <div class="span-24 last form">
    <g:form method="post">
      <div class="span-3"><g:swoopOutputValue id="role.id" label="role.id" value="${authority?.id}" newline="true"/></div>
      <div class="span-6">
        <div>
          <label for="authority">
            <span class="required">*</span>
            <g:message code="role.name"/>
          </label>
        </div>
        <div class="value ${hasErrors(bean: authority, field: 'authority', 'errors')}">
          <input type="text" id="authority" name="authority" value="${authority?.authority?.substring(5)?.toLowerCase()?.encodeAsHTML()}"/>
        </div>
      </div>
      <div class="span-8 append-7 last"><g:swoopInputText label="role.description" bean="${authority}" field="description" required="false" size="40"/></div>
      <div class="span-24 last">&nbsp;</div>
      <div class="span-24 last">
        <label for="people"><g:message code="role.people"/></label>
      </div>
      <div id="people" class="span-24 last">
        <g:each var="p" in="${authority?.people}">
          <span>${p.username}</span>
        </g:each>
      </div>
      <g:ifAnyGranted role="ROLE_MASTER_ADMIN">
        <div class="span-24 last">&nbsp;</div>
        <div class="buttons">
          <input type="hidden" name="id" value="${authority?.id}"/>
          <g:actionSubmit class="button save" value="Update"/>
        </div>
      </g:ifAnyGranted>
    </g:form>
  </div>
</div>
</body>
</html>
