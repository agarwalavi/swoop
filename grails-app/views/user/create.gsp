<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN""http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title><g:message code="user.heading.create"/></title>
</head>
<body>
<div class="body">
  <div class="pageHeading"><g:message code="user.heading.create"/></div>
  <g:swoopFlash/>
  <g:hasErrors bean="${person}">
    <div class="errors"><g:renderErrors bean="${person}" as="list"/></div>
  </g:hasErrors>
  <div class="span-24 last form">
    <g:form action="save" method="post">
      <div class="span-8"><g:swoopInputText label="user.username" bean="${person}" field="username" required="true"/></div>
      <div class="span-8"><g:swoopInputText label="user.password" bean="${person}" field="passwd" required="true" type="password"/></div>
      <div class="span-8 last"><g:swoopInputText label="user.confirmPassword" bean="${person}" field="confirmPassword" required="true" type="password"/></div>
      <div class="span-8"><g:swoopInputText label="user.firstName" bean="${person}" field="contact.firstName" required="true"/></div>
      <div class="span-8 append-8 last"><g:swoopInputText label="user.lastName" bean="${person}" field="contact.lastName" required="true"/></div>
      <div class="span-8"><g:swoopInputText label="user.company" bean="${person}" field="companyName" required="true" size="30"/></div>
      <div class="span-8"><g:swoopInputText label="user.phone" bean="${person}" field="contact.phone" required="true"/></div>
      <div class="span-8 last"><g:swoopInputText label="user.mobile" bean="${person}" field="contact.mobilePhone" required="true"/></div>
      <div class="span-8 append-16 last"><g:swoopInputText label="user.email" bean="${person}" field="contact.emailAddress" required="true"/></div>
      <div class="span-8"><g:swoopInputText label="user.addressLineOne" bean="${person}" field="mailAddress.addressLineOne" required="true" size="30"/></div>
      <div class="span-8 append-8 last"><g:swoopInputText label="user.addressLineTwo" bean="${person}" field="mailAddress.addressLineTwo" required="true" size="30"/></div>
      <div class="span-8"><g:swoopInputText label="user.city" bean="${person}" field="mailAddress.city" required="true" size="30"/></div>
      <div class="span-4">
        <div class="inputLabel">
          <label for="mailAddress.province"><span class="required">*</span><g:message code="user.province"/></label>
        </div>
        <div valign="top" id="mailAddress.province" class="value ${hasErrors(bean: person, field: 'mailAddress.province', 'errors')}">
          <g:select optionKey="id" optionValue="value" noSelection="['null':'--']" from="${Province.list()}" name="mailAddress.province.id" value="${person?.mailAddress?.province?.id}"></g:select>
        </div>
      </div>
      <div class="span-8 append-4 last"><g:swoopInputText label="user.postalCode" bean="${person}" field="mailAddress.postalCode" required="true"/></div>
      <div class="span-24 last">&nbsp;</div>
      <div class="span-24 last input-label-element">
        <label for="roles">
          <g:message code="user.roles"/>
        </label>
      </div>
      <div id="roles" class="span-24 last">
        <g:set var="list" value="[]"/>
        <g:each var="b" in="${authorityList.authority}">
          <g:each var="a" in="${person?.authorities}">
            <g:if test="${b==~ a.authority}">
              <% if (!list.contains(b))
              {
                list.add(b); %>
              <span><g:checkBox
                      name="${a.authority}" value="${true}"/> ${a.authority?.substring(5)?.toLowerCase()?.encodeAsHTML()}</span>
              <% } %>
            </g:if>
          </g:each>
          <% if (!list.contains(b))
          {
            list.add(b); %>
          <span><g:checkBox name="${b}"
                  value="${false}"/>${b.substring(5)?.toLowerCase()?.encodeAsHTML()}</span>
          <% } %>
        </g:each>
      </div>
      <div class="span-24 last">&nbsp;</div>
      <g:ifAnyGranted role="ROLE_MASTER_ADMIN">
        <div class="span-24 last">&nbsp;</div>
        <div class="span-24 last buttons">
          <input class="button save" type="submit" value="Create"/>
        </div>
        <div class="span-24 last">&nbsp;</div>
      </g:ifAnyGranted>
    </g:form>
  </div>
</div>
</body>
</html>
