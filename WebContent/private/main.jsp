
<%
	if (session.getAttribute("user") == null) {
		response.sendRedirect(request.getContextPath() + "login.jsp");
	}
%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.deloitte.domain.*"%>
<%@page import="java.util.Map"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>To Do Main Page</title>

<link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.js"></script>

<!--
<script type="text/javascript">
	$('#taskModal').on('show.bs.modal', function (t) {
	    alert('Called.............: ' + t);
	    document.getElementById("modal-body").value = $(this).attr('data-id');
		$(this).find('.modal-body').html('Fired By: ' + t.getTaskId());
	});
	
	
	
</script>

-->
<script type="text/javascript">
	$(document).ready(function () { 
		$('body').on('click', '.feed-id',function(){ 
			document.getElementById("feed_id").value = $(this).attr('data-id'); 
			console.log($(this).attr('data-id')); 
		}); 
	});
</script>
<!-- 

$(document).ready(function () { 
		$('body').on('click', '.feed-id',function(){ 
			document.getElementById("modal-body").value = $(this).attr('data-id'); 
			console.log($(this).attr('data-id')); 
		}); 
	});


 -->


</head>
<body>
	<%
		User user = (User) session.getAttribute("user");
		Map<Integer, Task> tasks = user.getTaskMap();
	%>

	<!-- Modal -->
	<div class="modal fade" id="taskModal" tabindex="-1" role="dialog"
		aria-labelledby="taskModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<form method="post"
				action="<%=request.getContextPath()%>/CadTaskServlet"
				class="needs-validation" novalidate>
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="taskModalLabel">New Task</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form>
							<div class="form-group">
								<label for="recipient-name" class="col-form-label">Title</label>
								<input type="text" class="form-control" id="title" name="title">
							</div>
							<div class="form-group">
								<label for="message-text" class="col-form-label">Description</label>
								<textarea class="form-control" id="description"
									name="description"></textarea>
							</div>



							<div class="modal-body">
								**
								<!-- Display values here-->
								**
							</div>

							<div>
								<input id="feed_id" name="cid" type="hidden" value="" />
							</div>

						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Create</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<!--  End of Modal  -->






	<nav class="navbar navbar-light bg-light justify-content-between">
	<span class="navbar-brand mb-0 h1">
		<img src="<%=request.getContextPath()%>/images/todo-list-logo.png" class="rounded" alt="Edit row" height="40%" width="40%">
	</span>

	<form method="post"
		action="<%=request.getContextPath()%>/SignOutServlet"
		class="form-inline">
		<a data-toggle="tooltip" title="<%=user.getName()%>"> <img
			src="<%=request.getContextPath()%>/images/person-30.png"
			class="figure-img img-fluid rounded" alt="<%=user.getName()%>"
			align="bottom" width="24" height="24">
		</a> <a>&nbsp</a> <a>&nbsp</a> <a data-toggle="tooltip" title="Logout">
			<input type="image"
			src="<%=request.getContextPath()%>/images/sign-out.png" alt="Submit"
			align="bottom" width="24" height="24">
		</a>
	</form>
	</nav>
	<br>
	<br>
	<div class="container">
		<table class="table">
			<tr style="background-color: white;">
				<th scope="col" align="left"
					style="color: gray; font-size: small; width: 25%;">Unchecked
					Tasks (<strong><%=user.pendingTasks()%></strong>)
				</th>
				<th scope="col" style="width: 70%;" align="right"></th>
				<th scope="col" align="right" style="width: 15%;"><a
					href="<%=request.getContextPath()%>/cad_task.jsp"
					style="align-content: flex-end;">Add(+)</a></th>
			</tr>
			<tbody>
				<table class="table">
					<thead class="thead-light">
						<tr>
							<th scope="col">Done</th>
							<th scope="col" style="width: 50%;">Task</th>
							<th scope="col">Created</th>
							<th scope="col">Updated</th>
							<th scope="col">Edit</th>
							<th scope="col">Remove</th>
							<th scope="col">Check</th>
						</tr>
					</thead>
					<tbody>
						<%
							if (user.getTaskMap().size() < 1) {
						%>
						<tr>
							<td colspan="7">No tasks</td>
						</tr>
						<%
							} else {
								for (Integer key : tasks.keySet()) {
									Task t = tasks.get(key);
						%>
						<tr>
							<th scope="row" align="center">
								<%
									if (t.isStatus()) {
								%><img
								src="<%=request.getContextPath()%>/images/checked-task-24.png"
								class="rounded" alt="Edit row"> <%
									} else {
								%> &nbsp; <%
 	}
 %></p>
							</th>
							<td scope="row" colspan="1" <%if (!t.isStatus()) {%>
								style="color: blue;" <%} else {%> style="color: gray;" <%}%>>
								<a data-toggle="tooltip"
								title="<%="Description : \n" + t.getDescription()%>"> <%=t.getTitle()%>
							</a>
							</td>
							<td scope="row"
								style="font-size: x-small; font-size-adjust: inherit;"><%=t.getCreatedAt()%></td>
							<td scope="row"
								style="font-size: x-small; font-size-adjust: inherit;"><%=t.getUpdatedAt()%></td>
							<td align="center" width="60px;">
								<%
									if (!t.isStatus()) {
								%>
								<!-- 
								<button type="button" class="btn btn-warning feed-id" data-toggle="modal" data-target="#taskModal" data-id="<%=t.getTaskId()%>">aqui</button>
								 -->

								<form method="post"
									action="<%=request.getContextPath()%>/EditTaskServlet">
									<input type="hidden" id="taskId" name="taskId"
										value="<%=t.getTaskId()%>"> <input type="hidden"
										id="action" name="action" value="update">
									<button type="submit">
										<img src="<%=request.getContextPath()%>/images/edit-row.png"
											class="rounded" alt="Edit row" style="border: none;">
									</button>
								</form> <%
 	} else {
 %> &nbsp; <%
 	}
 %>
							</td>
							<td align="center">
								<%
									if (!t.isStatus()) {
								%>
								<form method="post"
									action="<%=request.getContextPath()%>/EditTaskServlet">
									<input type="hidden" id="taskId" name="taskId"
										value="<%=t.getTaskId()%>"> <input type="hidden"
										id="action" name="action" value="remove">
									<button type="submit">
										<img src="<%=request.getContextPath()%>/images/remove-row.png"
											class="rounded" alt="Remove row">
									</button>
								</form> <%
 	} else {
 %> &nbsp; <%
 	}
 %>
							</td>
							<td align="center">
								<form method="post"
									action="<%=request.getContextPath()%>/CheckUncheckServlet">
									<input type="hidden" id="taskId" name="taskId"
										value="<%=t.getTaskId()%>">
									<button type="submit">
										<% if (!t.isStatus()) { %>
										<img src="<%=request.getContextPath()%>/images/done-row.png"
											class="rounded" alt="Done row">
										<%}else{ %>
										<img
											src="<%=request.getContextPath()%>/images/done-row-out.png"
											class="rounded" alt="Done row">
										<%}%>
									</button>
								</form>
							</td>
						</tr>
						<%
							}
							}
						%>
					</tbody>
					<caption style="font-size: small;">* Point the mouse over
						the task name to see the description.</caption>
				</table>
			</tbody>
		</table>
	</div>


	<script>
		$(document).ready(function() {
			$('[data-toggle="tooltip"]').tooltip();
		});
		
		
	</script>



	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
		integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
		integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
		crossorigin="anonymous"></script>



</body>


</html>