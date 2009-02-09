<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title><g:message code="vehicle.heading.create"/></title>
</head>
<body>
<div class="body">
  <div class="pageHeading"><g:message code="vehicle.heading.create"/></div>
  <g:swoopFlash/>
  <g:hasErrors bean="${vehicleInstance}">
    <div class="errors">
      <g:renderErrors bean="${vehicleInstance}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form action="save" method="post">
    <div class="dialog">
      <table>
        <tbody>

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
            <label for="enabled">Enabled:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: vehicleInstance, field: 'enabled', 'errors')}">
            <g:checkBox name="enabled" value="${vehicleInstance?.enabled}"></g:checkBox>
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
            <g:lookupSelect id="make" name="make" realm="vehicle.make" value="${make}" noSelection="['':'-Select Model-']"/>
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
            <label for="responsibleParty">Responsible Party:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: vehicleInstance, field: 'responsibleParty.fullName', 'errors')}">
            <g:select optionKey="id" optionValue="fullName" from="${User.list()}" name="responsibleParty.id" value="${vehicleInstance?.responsibleParty?.id}"></g:select>
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
      <input class="button save" type="submit" value="Create"/>
    </div>
  </g:form>
</div>
</body>
</html>
