<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title><g:message code="vehicle.heading.list"/></title>
</head>
<body>
<div class="body">
  <div class="pageHeading"><g:message code="vehicle.heading.list"/></div>
  <g:swoopFlash/>
  <div class="buttons">
    <g:link class="button create" controller="vehicle" action="create">Create</g:link>
  </div>
  <div class="list">
    <table>
      <thead>
      <tr>

        <g:sortableColumn property="id" title="Id"/>

        <g:sortableColumn property="dateCreated" title="Date Created"/>

        <g:sortableColumn property="createUser" title="Create User"/>

        <g:sortableColumn property="lastUpdated" title="Last Updated"/>

        <g:sortableColumn property="updateUser" title="Update User"/>

        <g:sortableColumn property="color" title="Color"/>

      </tr>
      </thead>
      <tbody>
      <g:each in="${vehicleInstanceList}" status="i" var="vehicleInstance">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

          <td><g:link action="show" id="${vehicleInstance.id}">${fieldValue(bean: vehicleInstance, field: 'id')}</g:link></td>

          <td>${fieldValue(bean: vehicleInstance, field: 'dateCreated')}</td>

          <td>${fieldValue(bean: vehicleInstance, field: 'createUser')}</td>

          <td>${fieldValue(bean: vehicleInstance, field: 'lastUpdated')}</td>

          <td>${fieldValue(bean: vehicleInstance, field: 'updateUser')}</td>

          <td>${fieldValue(bean: vehicleInstance, field: 'color')}</td>

        </tr>
      </g:each>
      </tbody>
    </table>
  </div>
  <div class="paginateButtons">
    <g:paginate total="${Vehicle.count()}"/>
  </div>
</div>
</body>
</html>
