<div id="${id}-form-element" class="form-element">
  <g:if test="${newline != null && newline == 'true'}">
    <div id="${id}-output-label-element" class="output-wrapped-label-element">
      <label for="${id}"><g:message code="${label}"/></label>
    </div>
    <div id="${id}" class="output-wrapped-value-element">
  </g:if>
  <g:else>
    <div class="output-label-element" style="display: inline;">
      <label for="${id}"><g:message code="${label}"/></label>:
    </div>
    <div id="${id}" class="output-value-element" style="display: inline;">
  </g:else>
  <g:if test="${type == null || type.length() == 0 || type == 'STRING'}">${value}</g:if>
  <g:if test="${type == 'MONEY'}">
    <g:if test="${value == null}">N/A</g:if>
    <g:else>
      <g:formatMoney money="${value}"/>
    </g:else>
  </g:if>
  <g:if test="${type == 'PERCENT'}">
    <g:if test="${value == null}">N/A</g:if>
    <g:else>${value}%</g:else>
  </g:if>
  <g:if test="${type == 'ENUM'}"><g:formatEnum value="${value}"/></g:if>
  <g:if test="${type== 'DATE'}">
    <g:formatDate format="MM/dd/yy hh a" date="${value}"/>
  </g:if>
  <g:if test="${type == 'NUMBER'}">
    <g:if test="${numberFormat == null || numberFormat.length() ==0}">
      <g:set value="###,##0" var="numberFormat"/>
    </g:if>
    <g:if test="${value == null}">N/A</g:if>
    <g:else>
      <g:formatNumber number="${value}" format="${numberFormat}"/>
    </g:else>
  </g:if>
  <g:if test="${newline != null && newline == 'true'}">
    </div>
  </g:if>
  <g:else></div></g:else>
</div>