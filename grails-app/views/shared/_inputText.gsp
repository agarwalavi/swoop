<div class="form-element">
  <g:if test="${inline != null && inline == 'true'}">

    <div class="input-label-element" style="display: inline;">
      <label for="${field}">
        <g:if test="${required == 'true'}">
          <span class="required">*</span>
        </g:if>
        <g:message code="${label}"/>
      </label>
    </div>
    <div class="input-value-element" style="display: inline;">
      <g:if test="${type != null && type == 'password'}">
        <g:acigPasswordField bean="${bean}" field="${field}" size="${size}" addClass="${addClass}" maxlength="${maxlength}"/>
      </g:if>
      <g:else>
        <g:acigTextField bean="${bean}" field="${field}" size="${size}" addClass="${addClass}" maxlength="${maxlength}"/>
      </g:else>
    </div>
  </g:if>
  <g:else>
    <div class="input-label-element">
      <label for="${field}">
        <g:if test="${required == 'true'}">
          <span class="required">*</span>
        </g:if>
        <g:message code="${label}"/>
      </label>
    </div>
    <div class="input-value-element">
      <g:if test="${type!= null && type == 'password'}">
        <g:acigPasswordField bean="${bean}" field="${field}" size="${size}" addClass="${addClass}" maxlength="${maxlength}"/>
      </g:if>
      <g:else>
        <g:acigTextField bean="${bean}" field="${field}" size="${size}" addClass="${addClass}" maxlength="${maxlength}"/>
      </g:else>
    </div>
  </g:else>
</div>