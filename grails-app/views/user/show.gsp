<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN""http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title><g:message code="user.heading.show"/></title>
</head>
<body>
<div class="body">
  <div class="pageHeading"><g:message code="user.heading.show"/></div>
  <g:swoopFlash/>
  <div class="form span-24 last">
    <g:form>
      <div class="span-8"><g:swoopOutputValue id="user.id" label="user.id" value="${person?.id}" newline="true"/></div>
      <div class="span-8 append-8 last"><g:swoopOutputValue id="user.username" label="user.username" value="${person?.username?.encodeAsHTML()}" newline="true"/></div>
      <div class="span-8"><g:swoopOutputValue id="user.firstName" label="user.firstName" value="${person?.contact?.firstName?.encodeAsHTML()}" newline="true"/></div>
      <div class="span-8 append-8 last"><g:swoopOutputValue id="user.lastName" label="user.lastName" value="${person?.contact?.lastName?.encodeAsHTML()}" newline="true"/></div>
      <div class="span-8"><g:swoopOutputValue id="user.company" label="user.company" value="${person?.companyName?.encodeAsHTML()}" newline="true"/></div>
      <div class="span-4"><g:swoopOutputValue id="user.phone" label="user.phone" value="${person?.contact?.phone?.encodeAsHTML()}" newline="true"/></div>
      <div class="span-4"><g:swoopOutputValue id="user.mobile" label="user.mobile" value="${person?.contact?.mobilePhone?.encodeAsHTML()}" newline="true"/></div>
      <div class="span-4 append-4 last"><g:swoopOutputValue id="user.email" label="user.email" value="${person?.contact?.emailAddress?.encodeAsHTML()}" newline="true"/></div>
      <div class="span-8"><g:swoopOutputValue id="user.addressLineOne" label="user.addressLineOne" value="${person?.mailAddress?.addressLineOne?.encodeAsHTML()}" newline="true"/></div>
      <div class="span-8 append-8 last"><g:swoopOutputValue id="user.addressLineTwo" label="user.addressLineTwo" value="${person?.mailAddress?.addressLineTwo?.encodeAsHTML()}" newline="true"/></div>
      <div class="span-24 last">&nbsp;</div>
      <div class="span-8"><g:swoopOutputValue id="user.city" label="user.city" value="${person?.mailAddress?.city?.encodeAsHTML()}" newline="true"/></div>
      <div class="span-2"><g:swoopOutputValue id="user.province" label="user.province" value="${person?.mailAddress?.province?.value?.encodeAsHTML()}" newline="true"/></div>
      <div class="span-8 append-6 last"><g:swoopOutputValue id="user.postalCode" label="user.postalCode" value="${person?.mailAddress?.postalCode?.encodeAsHTML()}" newline="true"/></div>
      <div class="span-24 last">&nbsp;</div>
      <div class="span-24 last input-label-element">
        <label for="roles">
          <g:message code="user.roles"/>
        </label>
      </div>
      <div id="roles" class="span-24 last">
        <g:collect in="${person.authorities}" expr="${it.authority}">
          <span>${it?.substring(5)?.toLowerCase()}</span>
        </g:collect>
      </div>
      <div class="span-24 last">&nbsp;</div>
      <div class="span-24 last buttons">
        <input type="hidden" name="id" value="${person.id}"/>
        <g:actionSubmit class="button edit" value="Edit"/>
        <g:ifAnyGranted role="ROLE_MASTER_ADMIN">
          <g:actionSubmit class="button delete"
                  onclick="return confirm('Are you sure?');" value="Delete"/>
        </g:ifAnyGranted>
      </div>
      <div class="span-24 last">&nbsp;</div>
    </g:form>
  </div>
</div>
</body>
</html>
