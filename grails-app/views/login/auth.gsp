<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN""http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<meta name='layout' content='main' />
<title>Login</title>
</head>
<body>
<div id='login'>
<div class='inner'><g:if test='${flash.message}'>
  <div class='login_message'>${flash.message}</div>
</g:if>
<div class='fheader'>Please Login..</div>
<form action='${request.contextPath}/j_spring_security_check' method='POST' id='loginForm'
  class='cssform'>
<p><label for='j_username'>Login ID</label> <input type='text' class='text_' name='j_username'
  id='j_username' /></p>
<p><label for='j_password'>Password</label> <input type='password' class='text_'
  name='j_password' id='j_password' /></p>
<p><label for='remember_me'>Remember me</label> <input type='checkbox' class='chk'
  id='remember_me' name='_spring_security_remember_me'></p>
<p><input type='submit' value='Login' /></p>
</form>
</div>
</div>
<script type='text/javascript'>
	( function() {
		document.forms['loginForm'].elements['j_username'].focus();
	})();
	//
</script>
</body>
</html>
