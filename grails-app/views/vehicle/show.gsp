<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title><g:message code="vehicle.heading.show"/></title>
</head>
<body>

<div class="body">
   <div class="pageHeading"><g:message code="vehicle.heading.show"/></div>
  <g:swoopFlash/>
  <div class="dialog">
    <table>
      <tbody>

      <tr class="prop">
        <td valign="top" class="name">Id:</td>

        <td valign="top" class="value">${fieldValue(bean: vehicleInstance, field: 'id')}</td>

      </tr>


      <tr class="prop">
        <td valign="top" class="name">Assemblies:</td>

        <td valign="top" style="text-align:left;" class="value">
          <ul>
            <g:each var="a" in="${vehicleInstance.assemblies}">
              <li><g:link controller="assemblyInstance" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
            </g:each>
          </ul>
        </td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Color:</td>

        <td valign="top" class="value">${fieldValue(bean: vehicleInstance, field: 'color')}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Description:</td>

        <td valign="top" class="value">${fieldValue(bean: vehicleInstance, field: 'description')}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Documents:</td>

        <td valign="top" style="text-align:left;" class="value">
          <ul>
            <g:each var="d" in="${vehicleInstance.documents}">
              <li><g:link controller="document" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
            </g:each>
          </ul>
        </td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Enabled:</td>

        <td valign="top" class="value">${fieldValue(bean: vehicleInstance, field: 'enabled')}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Financial Infos:</td>

        <td valign="top" style="text-align:left;" class="value">
          <ul>
            <g:each var="f" in="${vehicleInstance.financialInfos}">
              <li><g:link controller="vehicleFinancialInformation" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
            </g:each>
          </ul>
        </td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Fuel Type:</td>

        <td valign="top" class="value">${fieldValue(bean: vehicleInstance, field: 'fuelType')}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Location:</td>

        <td valign="top" class="value"><g:link controller="location" action="show" id="${vehicleInstance?.location?.id}">${vehicleInstance?.location?.name?.encodeAsHTML()}</g:link></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Make:</td>

        <td valign="top" class="value">${fieldValue(bean: vehicleInstance, field: 'make')}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Manufacture Year:</td>

        <td valign="top" class="value">${fieldValue(bean: vehicleInstance, field: 'manufactureYear')}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Model:</td>

        <td valign="top" class="value">${fieldValue(bean: vehicleInstance, field: 'model')}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Number:</td>

        <td valign="top" class="value">${fieldValue(bean: vehicleInstance, field: 'number')}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Parts:</td>

        <td valign="top" style="text-align:left;" class="value">
          <ul>
            <g:each var="p" in="${vehicleInstance.parts}">
              <li><g:link controller="partInstance" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
            </g:each>
          </ul>
        </td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Reports:</td>

        <td valign="top" style="text-align:left;" class="value">
          <ul>
            <g:each var="r" in="${vehicleInstance.reports}">
              <li><g:link controller="vehicleReport" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
            </g:each>
          </ul>
        </td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Responsible Party:</td>

        <td valign="top" class="value"><g:link controller="user" action="show" id="${vehicleInstance?.responsibleParty?.id}">${vehicleInstance?.responsibleParty?.fullName?.encodeAsHTML()}</g:link></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Service Requests:</td>

        <td valign="top" style="text-align:left;" class="value">
          <ul>
            <g:each var="s" in="${vehicleInstance.serviceRequests}">
              <li><g:link controller="serviceRequest" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
            </g:each>
          </ul>
        </td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Type:</td>

        <td valign="top" class="value">${fieldValue(bean: vehicleInstance, field: 'type')}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Vin:</td>

        <td valign="top" class="value">${fieldValue(bean: vehicleInstance, field: 'vin')}</td>

      </tr>

      </tbody>
    </table>
  </div>
  <div class="buttons">
    <g:form>
      <input type="hidden" name="id" value="${vehicleInstance?.id}"/>
      <g:actionSubmit class="button edit" value="Edit"/>
      <g:actionSubmit class="button delete" onclick="return confirm('Are you sure?');" value="Delete"/>
    </g:form>
  </div>
</div>
</body>
</html>
