<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.deloitte.utils.ErrorMsg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Login Page</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">


<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
</head>
<body>


	<div class="container">
		<%
	ErrorMsg error = (ErrorMsg) session.getAttribute("error");
	if(error != null){
%>
		<div class="alert alert-danger" role="alert">
			<%= error.getMessage() %>
		</div>
		<% } %>
		<form method="post" action="LoginServlet" class="needs-validation"
			novalidate>
			<div class="row justify-content-center align-items-center"
				style="height: 100vh">
				<div class="col-4">
					<div class="card">
						<div class="card-body">
							<div class="form-group">
								<p class="font-weight-bold">Login Form</p>
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="login" name="login"
									placeholder="Login" required>
								<div class="valid-feedback">Looks good!</div>
							</div>
							<div class="form-group">
								<input type="password" class="form-control" id="password"
									name="password" placeholder="Password" required>
								<div class="valid-feedback">Looks good!</div>
							</div>
							<div class="row">
							    <div class="col align-self-start">
							      <button type="submit" id="sendlogin" class="btn btn-primary">login</button>
							    </div>
							    <div class="col align-self-end">
							      <a class="underlineHover" href="sign_in.jsp">Sign In</a>
							    </div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>

	</div>

	<script>
// Example starter JavaScript for disabling form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();
</script>
	<!-- 
		<fieldset>
			<legend>Login</legend>
			<form method="post" action="LoginServlet">

				<table>
					<tr>
						<td>Login</td>
						<td><input type="text" name="login"></td>
					</tr>
					<tr>
						<td>Password</td>
						<td><input type="password" name="password"></td>
					</tr>
					<tr>
						<td colspan="1" align="center"><input type="submit"
							value="Login"></td>
					</tr>
					<tr>
						<td colspan="1" align="center"><a href="sign_in.jsp">Sign
								in</a></td>
					</tr>
				</table>
			</form>
		</fieldset>


 -->

	<!-- JSs -->

</body>
</html>