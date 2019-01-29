<%@page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@page import="com.deloitte.utils.ErrorMsg"%>
<%@page import="com.deloitte.domain.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Task Form Page</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body>
<% User user = (User) session.getAttribute("user"); %>
<% Task task = (Task) session.getAttribute("updateTask"); %>
	
	<form method="post" action="UpdateTaskServlet" class="needs-validation"
		novalidate>
		<div class="row justify-content-center align-items-center"
			style="height: 100vh">
			<div class="col-4">
				<div class="card">
					<div class="card-body">
						<div class="form-group">
							<p class="font-weight-bold">Update Task </p>
						</div>
						<div class="form-group">
							<input type="hidden" id="taskId" name="taskId" value="<%=task.getTaskId() %>">
							<label for="title"><strong>Title</strong></label>
							<input type="text" class="form-control" id="title" name="title"
								value="<%=task.getTitle() %>" required>
							<div class="valid-feedback">Looks good!</div>
						</div>
						<div class="form-group">
							<label for="description"><strong>Description</strong></label>
							<textarea class="form-control" id="description" rows="3" name="description"  required><%=task.getDescription() %></textarea>
							<div class="valid-feedback">Looks good!</div>
						</div>
						<div class="form-group">
							<label for="createdAt"><strong>Created</strong></label>
							<input type="text" class="form-control" id="createdAt" name="createdAt" value="<%=task.getCreatedAt() %>" readonly>
						</div>
						<div class="form-group">
							<label for="updatedAt"><strong>Last Updated</strong></label>
							<input type="text" class="form-control" id=updatedAt" name="updatedAt" value="<%=task.getUpdatedAt() %>" readonly>
						</div>
						<button type="submit" id="sendlogin" class="btn btn-primary">Update</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	
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

</body>
</html>