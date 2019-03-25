<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/jsp/header.jsp"%>

<script type="text/javascript">
	$(document).ready(function () {
	
		$("form").validate({
			
			rules : {
				userName : {
					required : true
				},
				password : {
					required : true
				}
			},
			messages : {			
				confirmPassword : {
					equalTo : "Passwords do not match"
				}
			},
			errorClass : "error"
		});
	});
</script>
<div class="container">
<div class="row">
	<div class="col-sm-4"></div>
	<div class="col-sm-4">
		<c:url var="formAction" value="/login" />
		<form:form  action="${formAction}" method="POST" modelAttribute="login">
		<input type="hidden" name="destination" value="${param.destination}"/>
		<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
			
			<div class="form-group">
				<label for="userName">User Name: </label>
				<input type="search" id="userName" name="userName" placeHolder="User Name" class="form-control" />
				<form:errors path="userName" cssClass="error" />
				
			</div>
			<div class="form-group">
				<label for="password">Password: </label>
				<input type="password" id="password" name="password" placeHolder="Password" class="form-control" />
				<form:errors path="password" cssClass="error" />
				
			</div>
			<button type="submit" class="btn btn-primary">Login</button>
			
		</form:form>
	</div>
	<div class="col-sm-4"></div>
</div>
</div>
<%@ include file="/WEB-INF/jsp/footer.jsp"%>