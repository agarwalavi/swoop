<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN""http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title><g:message code="role.heading.create"/></title>
</head>
<body>
<div class="body">
  <div class="pageHeading"><g:message code="role.heading.create"/></div>
  <g:swoopFlash/>
  <g:hasErrors bean="${authority}">
    <div class="errors">
      <g:renderErrors bean="${authority}" as="list"/>
    </div>
  </g:hasErrors>
  <div class="span-24 last form">
    <g:form action="save" method="post">
      <div class="span-8"><g:swoopInputText label="role.name" bean="${authority}" field="authority" required="true"/></div>
      <div class="span-8 append-8 last"><g:swoopInputText label="role.description" bean="${authority}" field="description" required="false" size="40"/></div>
      <g:ifAnyGranted role="ROLE_MASTER_ADMIN">
        <div class="span-24 last">&nbsp;</div>
        <div class="buttons">
          <input class="button save" type="submit" value="Create"/>
        </div>
      </g:ifAnyGranted>
    </g:form>
  </div>
</div>
</body>
</html>

