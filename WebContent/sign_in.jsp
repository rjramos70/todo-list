<%@page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@page import="com.deloitte.utils.ErrorMsg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign In Page</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body>


	<div class="container">
		<%
	ErrorMsg error = (ErrorMsg) request.getAttribute("error");
	if(error != null){
%>
		<div class="alert alert-danger" role="alert">
			<%= error.getMessage() %>
		</div>
		<% } %>

		<form method="post" action="SignInServlet" class="needs-validation"
			novalidate>
			<div class="row justify-content-center align-items-center"
				style="height: 100vh">
				<div class="col-4">
					<div class="card">
						<div class="card-body">
							<div class="form-group">
								<p class="font-weight-bold">Sign In Form</p>
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="name" name="name"
									placeholder="Full Name" required>
								<div class="valid-feedback">Looks good!</div>
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
							<button type="submit" id="sendlogin" class="btn btn-primary">Save</button>
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

	<!-- JS -->
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery-3.3.1.js"></script>

	<!-- 





Sign In
<form method="post" action="SignInServlet">
		<table>
		<tr>
				<td>Name</td>
				<td><input type="text" name="name"></td>
			</tr>
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
					value="Sign In"></td>
			</tr>
			
		</table>
	</form>
	
	 -->
</body>
</html>