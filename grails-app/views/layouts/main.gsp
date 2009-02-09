<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN""http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
  <title><g:layoutTitle default="Swoop"/></title>
  <link rel="stylesheet" href="${createLinkTo(dir: 'css/blueprint', file: 'screen.css')}" media="screen, projection"/>
  <link rel="stylesheet" href="${createLinkTo(dir: 'css/blueprint', file: 'print.css')}" media="print"/>
  <!--[if IE]>
<link rel="stylesheet" href="${createLinkTo(dir: 'css/blueprint', file: 'ie.css')}" media="screen,projection"/>
   <![endif]-->
  <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'jquery-ui/ui.theme.css')}" media="screen, projection,print"/>
  <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'swoop.css')}" media="screen, projection,print"/>
  <g:layoutHead/>
  <g:helpBalloons/>
  <!-- Needed for Ajax Spinner -->
  <g:javascript library="scriptaculous"/>
  <g:javascript library="application"/>
  <g:javascript src="jquery/jquery.js"/>
  <!-- Needed for the menu -->
  <g:javascript src="jquery/jquery.bgiframe.js"/>
  <g:javascript src="jquery/jquery.hoverIntent.js"/>
  <g:javascript src="superfish.js"/>
  <g:javascript src="supersubs.js"/>
  <script>
    var $j = jQuery.noConflict();
    $j(document).ready(function()
    {
      $j('ul.sf-menu').superfish();
      if ($j.browser.msie || $j.browser.opera)
      {
        $j('.button').addClass('wrapped').wrap(
                '<span class="button"></span>'
                );
        $j('span.button').append(
                '<i class="tl"></i><i class="tr"></i><i class="bl"></i><i class="br"></i>'
                );
      }
      ;
      $j('.button.right').removeClass('right').parent('span').addClass('right');
      $j('.button.left').removeClass('left').parent('span').addClass('left');
    });
  </script>
</head>
<body>
<div class="container">
  <div id="spinner" class="spinner" style="display:none;">
    <img src="${createLinkTo(dir: 'images', file: 'ajax-loader.gif')}" alt="Spinner"/>
  </div>
  <div id="header">
    <div id="top-bar">
      <div id="logo"></div>
      <div id="right-side">
        <g:isLoggedIn>
          <g:link class="welcome" controller="user"><g:loggedInUserInfo field='fullName'/></g:link>&ensp;
          <g:link class="logout" controller="logout">Logout</g:link>&ensp;
          <a href="mailto:${Setting.valueFor('info.email.address')}">Email Us</a>&ensp;
        </g:isLoggedIn>
      </div>
    </div>
    <g:isLoggedIn>
      <div id="menu-bar">
        <ul class="sf-menu">
          <li><g:link class="left_nosub" controller="home">Home</g:link></li>
          <li><g:link class="right_hassub" controller="location">Locations</g:link>
            <ul>
              <li><g:link controller="location">Locations</g:link></li>
            </ul>
          </li>
          <li><g:link class="right_hassub" controller="notification">Notifications</g:link>
            <ul>
              <li><g:link controller="notification">Notifications</g:link></li>
            </ul>
          </li>
          <li><g:link class="right_hassub" controller="order">Orders</g:link>
            <ul>
              <li><g:link controller="order">Orders</g:link></li>
            </ul>
          </li>
          <li><g:link class="right_hassub" controller="vehicle">Vehicles</g:link>
            <ul>
              <li><g:link controller="vehicle">Vehicles</g:link></li>
              <li><g:link controller="vehicleFinancialInformation">Vehicle Financial Info</g:link></li>
              <li><g:link controller="document">Documents</g:link></li>

              <li><g:link controller="vehicleLocation">Vehicle Locations</g:link></li>
              <li><g:link controller="vehicleReport">Vehicle Reports</g:link></li>
              <li><g:link controller="vehicleReportItem">Vehicle Report Items</g:link></li>

              <li><g:link controller="partInstance">Active Parts</g:link></li>
              <li><g:link controller="assemblyInstance">Active Assemblies</g:link></li>
            </ul>
          </li>
          <li><g:link class="right_hassub" controller="part">Parts</g:link>
            <ul>
              <li><g:link controller="part">Parts</g:link></li>
            </ul>
          </li>
          <li><g:link class="right_hassub" controller="maintenance">Maintenance</g:link>
            <ul>
              <li><g:link controller="maintenance">Maintenance</g:link></li>
              <li><g:link controller="maintenanceItem">Maintenance Items</g:link></li>
              <li><g:link controller="maintenanceSchedule">Maintenance Schedules</g:link></li>
              <li><g:link controller="maintenanceScheduleItem">Maintenance Schedule Items</g:link></li>
            </ul>
          </li>
          <li><g:link class="right_hassub" controller="serviceRequest">Service</g:link>
            <ul>
              <li><g:link controller="serviceRequest">Service</g:link></li>
              <li><g:link controller="serviceItem">Service Items</g:link></li>
            </ul>
          </li>
          <li><g:link class="right_hassub" controller="vendor">Vendors</g:link>
            <ul>
              <li><g:link controller="vendorPart">Vendor Parts</g:link></li>
            </ul>
          </li>
          <li><g:link class="right_hassub" controller="user" action="myProfile">Admin</g:link>
            <ul>
              <li><g:link controller="user" action="myProfile">Edit My Profile</g:link></li>
              <g:ifAnyGranted role="ROLE_MASTER_ADMIN">
                <li><g:link controller="user">Users</g:link></li>
              </g:ifAnyGranted>
              <g:ifAnyGranted role="ROLE_MASTER_ADMIN">
                <li><g:link controller="role">Roles</g:link></li>
              </g:ifAnyGranted>
              <g:ifAnyGranted role="ROLE_MASTER_ADMIN">
                <li><g:link controller="setting">Settings</g:link></li>
              </g:ifAnyGranted>
              <g:ifAnyGranted role="ROLE_MASTER_ADMIN">
                <li><g:link controller="lookup">Lookups</g:link></li>
              </g:ifAnyGranted>
              <g:ifAnyGranted role="ROLE_MASTER_ADMIN">
                <li><g:link controller="lookupValue">Lookup Values</g:link></li>
              </g:ifAnyGranted>
            </ul>
          </li>
        </ul>
      </div>
    </g:isLoggedIn>
  </div>
</div>
<div class="container">
  <g:layoutBody/></div>
<div class="container">
  <div id="footer"><div id="footer-left-side">&copy;2008  <a href="http://www.soaringeagleco.com/">Soaring Eagle, LLC All Rights Reserved</a></div>
    <div id="footer-right-side"><a href="#">Online Access Agreement</a>&ensp;&emsp;<a href="#">Security Policy</a></div>
  </div>
</div>
</body>
</html>