<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN""http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
  <title>ACIG Management Home</title>
  <meta name="layout" content="main"/>
  <g:javascript src="jquery/jquery.js"/>
  <!-- You must call this no conflict before loading the ui library -->
  <script>
    var $ui = jQuery.noConflict();
  </script>
  <g:javascript src="jquery/ui.core.js"/>
  <g:javascript src="jquery/ui.tabs.js"/>
  <g:javascript src="jquery/ui.dialog.js"/>
  <g:javascript src="jquery/ui.resizable.js"/>
  <g:javascript src="jquery/ui.draggable.js"/>
  <script>
    var $j = jQuery.noConflict();
    $j(document).ready(function()
    {
      $ui("#homedata > ul").tabs({ fx: {
        opacity: 'toggle',
        duration: 'fast'
      } });
    });
  </script>
</head>
<body>
<div>
  <g:swoopFlash/>
  <div id="homedata">
    <ul>
      <li><a href="#document-content"><span>Document Data</span></a></li>
      <li><a href="#service-content"><span>Service Data</span></a></li>
      <li><a href="#vehicle-content"><span>Vehicle Data</span></a></li>
    </ul>
    <div id="document-content"></div>
    <div id="service-content"></div>
    <div id="vehicle-content"></div>
  </div>
</div>
</div>
</body>
</html>