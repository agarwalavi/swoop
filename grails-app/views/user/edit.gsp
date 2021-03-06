<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN""http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title><g:message code="user.heading.edit"/></title>
</head>
<body>
<div class="body">
  <div class="pageHeading"><g:message code="user.heading.edit"/></div>
  <g:swoopFlash/>
  <g:hasErrors bean="${person}">
    <div class="errors"><g:renderErrors bean="${person}" as="list"/></div>
  </g:hasErrors>
  <div class="form">
    <g:form method="post">
      <div class="span-3"><g:swoopOutputValue id="user.id" label="user.id" value="${person?.id?.encodeAsHTML()}" newline="true"/></div>
      <div class="span-5"><g:swoopOutputValue id="user.username" label="user.username" value="${person?.username?.encodeAsHTML()}" newline="true"/></div>
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
      <g:ifNotGranted role="ROLE_MASTER_ADMIN">
        <div class="span-8"><g:swoopOutputValue id="user.affiliate" label="user.affiliate" value="${person?.affiliate?.companyName?.encodeAsHTML()}" newline="true"/></div>
        <div class="span-8 append-8 last"><g:swoopOutputValue id="user.originator" label="user.originator" value="${person?.originator?.companyName?.encodeAsHTML()}" newline="true"/></div>
        <div class="span-24 last">&nbsp;</div>
      </g:ifNotGranted>
      <g:ifAnyGranted role="ROLE_MASTER_ADMIN">
        <div class="span-8">
          <div class="inputLabel">
            <label for="affiliate"><span class="required">*</span><g:message code="user.affiliate"/></label>
          </div>
          <div valign="top" id="affiliate" class="value ${hasErrors(bean: person, field: 'affiliate', 'errors')}">
            <g:select optionKey="id" optionValue="companyName" noSelection="['null':'--']" from="${Affiliate.list()}" name="affiliate.id" value="${person?.affiliate?.id}"></g:select>
          </div>
        </div>
        <div class="span-8 append-8 last">
          <div class="inputLabel">
            <label for="originator"><g:message code="user.originator"/></label>
          </div>
          <div valign="top" id="originator" class="value ${hasErrors(bean: person, field: 'originator', 'errors')}">
            <g:select optionKey="id" optionValue="companyName" noSelection="['null':'--']" from="${Originator.list()}" name="originator.id" value="${person?.originator?.id}"></g:select>
          </div>
        </div>
      </g:ifAnyGranted>
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
              <g:ifAnyGranted role="ROLE_MASTER_ADMIN">
                <span class="grid_3"><g:checkBox
                        name="${a.authority}" value="${true}"/>${a.authority?.substring(5)?.toLowerCase()?.encodeAsHTML()}</span>
              </g:ifAnyGranted>
              <g:ifNotGranted role="ROLE_MASTER_ADMIN">
                <span class="grid_3">${a.authority?.substring(5)?.toLowerCase()?.encodeAsHTML()}
                </span>
              </g:ifNotGranted>

              <% } %>
            </g:if>
          </g:each>
          <% if (!list.contains(b))
          {
            list.add(b); %>
          <g:ifAnyGranted role="ROLE_MASTER_ADMIN">
            <span class="grid_3"><g:checkBox name="${b}"
                    value="${false}"/>${b.substring(5)?.toLowerCase()?.encodeAsHTML()}</span>
          </g:ifAnyGranted>
          <% } %>
        </g:each>
      </div>
      <div class="span-24 last input-label-element">
        <label for="bidders">
          <g:message code="user.bidders"/>
        </label>
      </div>
      <div id="bidders" class="span-24 last">
        <g:set var="list" value="[]"/>
        <g:each var="b" in="${bidderList}">

          <g:each var="a" in="${person?.bidders}">
            <g:if test="${b.id==~ a.id}">
              <% if (!list.contains(b))
              {
                list.add(b); %>
              <g:ifAnyGranted role="ROLE_MASTER_ADMIN">
                <span class="grid_3"><g:checkBox
                        name="BIDDER_${a.id}" value="${true}"/>${a.companyName?.encodeAsHTML()}</span>
              </g:ifAnyGranted>
              <g:ifNotGranted role="ROLE_MASTER_ADMIN">
                <span class="grid_3">${a.companyName?.encodeAsHTML()}</span>
              </g:ifNotGranted>
              <% } %>
            </g:if>
          </g:each>
          <% if (!list.contains(b))
          {
            list.add(b); %>
          <g:ifAnyGranted role="ROLE_MASTER_ADMIN">
            <span class="grid_3"><g:checkBox name="BIDDER_${b.id}"
                    value="${false}"/>${b.companyName?.encodeAsHTML()}</span>
          </g:ifAnyGranted>
          <% } %>
        </g:each>
      </div>
      <div class="span-24 last">&nbsp;</div>
      <div class="span-24 last buttons">
        <input type="hidden" name="id" value="${person?.id}"/>
        <input type="hidden" name="username" value="${person?.username}"/>
        <g:actionSubmit class="button save" value="Update"/>
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
