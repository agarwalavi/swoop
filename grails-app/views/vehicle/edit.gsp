<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title><g:message code="vehicle.heading.edit"/></title>
</head>
<body>

<div class="body">
  <div class="pageHeading"><g:message code="vehicle.heading.edit"/></div>
  <g:swoopFlash/>
  <g:hasErrors bean="${vehicleInstance}">
    <div class="errors">
      <g:renderErrors bean="${vehicleInstance}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form method="post">
    <input type="hidden" name="id" value="${vehicleInstance?.id}"/>
    <div class="dialog">
      <table>
        <tbody>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="assemblies">Assemblies:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: vehicleInstance, field: 'assemblies', 'errors')}">

            <ul>
              <g:each var="a" in="${vehicleInstance?.assemblies}">
                <li><g:link controller="assemblyInstance" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
              </g:each>
            </ul>
            <g:link controller="assemblyInstance" params="['vehicle.id':vehicleInstance?.id]" action="create">Add AssemblyInstance</g:link>

          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="color">Color:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: vehicleInstance, field: 'color', 'errors')}">
            <input type="text" id="color" name="color" value="${fieldValue(bean: vehicleInstance, field: 'color')}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="description">Description:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: vehicleInstance, field: 'description', 'errors')}">
            <input type="text" id="description" name="description" value="${fieldValue(bean: vehicleInstance, field: 'description')}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="documents">Documents:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: vehicleInstance, field: 'documents', 'errors')}">

            <ul>
              <g:each var="d" in="${vehicleInstance?.documents}">
                <li><g:link controller="document" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
              </g:each>
            </ul>
            <g:link controller="document" params="['vehicle.id':vehicleInstance?.id]" action="create">Add Document</g:link>

          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="enabled">Enabled:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: vehicleInstance, field: 'enabled', 'errors')}">
            <g:checkBox name="enabled" value="${vehicleInstance?.enabled}"></g:checkBox>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="financialInfos">Financial Infos:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: vehicleInstance, field: 'financialInfos', 'errors')}">

            <ul>
              <g:each var="f" in="${vehicleInstance?.financialInfos}">
                <li><g:link controller="vehicleFinancialInformation" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
              </g:each>
            </ul>
            <g:link controller="vehicleFinancialInformation" params="['vehicle.id':vehicleInstance?.id]" action="create">Add VehicleFinancialInformation</g:link>

          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="fuelType">Fuel Type:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: vehicleInstance, field: 'fuelType', 'errors')}">
            <input type="text" id="fuelType" name="fuelType" value="${fieldValue(bean: vehicleInstance, field: 'fuelType')}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="location">Location:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: vehicleInstance, field: 'location', 'errors')}">
            <g:select optionKey="id" optionValue="name" from="${Location.list()}" name="location.id" value="${vehicleInstance?.location?.id}"></g:select>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="make">Make:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: vehicleInstance, field: 'make', 'errors')}">
            <g:lookupSelect id="make" name="make" realm="vehicle.make"
                    value="${make}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="manufactureYear">Manufacture Year:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: vehicleInstance, field: 'manufactureYear', 'errors')}">
            <input type="text" id="manufactureYear" name="manufactureYear" value="${fieldValue(bean: vehicleInstance, field: 'manufactureYear')}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="model">Model:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: vehicleInstance, field: 'model', 'errors')}">
            <input type="text" id="model" name="model" value="${fieldValue(bean: vehicleInstance, field: 'model')}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="number">Number:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: vehicleInstance, field: 'number', 'errors')}">
            <input type="text" id="number" name="number" value="${fieldValue(bean: vehicleInstance, field: 'number')}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="parts">Parts:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: vehicleInstance, field: 'parts', 'errors')}">

            <ul>
              <g:each var="p" in="${vehicleInstance?.parts}">
                <li><g:link controller="partInstance" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
              </g:each>
            </ul>
            <g:link controller="partInstance" params="['vehicle.id':vehicleInstance?.id]" action="create">Add PartInstance</g:link>

          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="reports">Reports:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: vehicleInstance, field: 'reports', 'errors')}">

            <ul>
              <g:each var="r" in="${vehicleInstance?.reports}">
                <li><g:link controller="vehicleReport" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
              </g:each>
            </ul>
            <g:link controller="vehicleReport" params="['vehicle.id':vehicleInstance?.id]" action="create">Add VehicleReport</g:link>

          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="responsibleParty">Responsible Party:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: vehicleInstance, field: 'responsibleParty', 'errors')}">
            <g:select optionKey="id" optionValue="fullName" from="${User.list()}" name="responsibleParty.id" value="${vehicleInstance?.responsibleParty?.id}"></g:select>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="serviceRequests">Service Requests:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: vehicleInstance, field: 'serviceRequests', 'errors')}">

            <ul>
              <g:each var="s" in="${vehicleInstance?.serviceRequests}">
                <li><g:link controller="serviceRequest" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
              </g:each>
            </ul>
            <g:link controller="serviceRequest" params="['vehicle.id':vehicleInstance?.id]" action="create">Add ServiceRequest</g:link>

          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="type">Type:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: vehicleInstance, field: 'type', 'errors')}">
            <input type="text" id="type" name="type" value="${fieldValue(bean: vehicleInstance, field: 'type')}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="vin">Vin:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: vehicleInstance, field: 'vin', 'errors')}">
            <input type="text" id="vin" name="vin" value="${fieldValue(bean: vehicleInstance, field: 'vin')}"/>
          </td>
        </tr>

        </tbody>
      </table>
    </div>
    <div class="buttons">
      <g:actionSubmit class="button save" value="Update"/>
      <g:actionSubmit class="button delete" onclick="return confirm('Are you sure?');" value="Delete"/>
    </div>
  </g:form>
</div>
</body>
</html>
