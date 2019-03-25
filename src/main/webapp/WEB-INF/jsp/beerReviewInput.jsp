<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/jsp/header.jsp"%>

<!-- <script type="text/javascript">
$(document).ready(function () {
	
	$("form").validate({
		
		rules : {
			/* userName : {
				required : true
			}, */
			rating : {
				required : true
			},
			review : {
				required : true
			},
			title : {
				required : true
			}
		
		},
		errorClass : "error"
	});
});
</script> -->


	<div id="survey-content">
		<div id="main_content">
			<h1 style="font-family: monospace; text-align:center;">Leave a review for ${beer.beerName}.</h1><br>
			
			
 			<c:url var="beerReviewInput" value="/beerReviewInput"><c:param name="beerid" value="${beer.id}"/></c:url>
	<form:form action="${beerReviewInput}" method="POST" modelAttribute="beerReview">
			<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
			
					
	 <%-- 	<div class="row">
    		<div class="col-25">
				<label for="userName">User Name:</label>
			</div>
			<div class="col-75">
 				<form:input path="userName" placeholder="Enter your username" /><br>
				<form:errors path="userName" cssClass="error" /> 
			</div>
		</div>   --%>
	
	 	<div class="row">
    		<div class="col-25">
				<label for="title">Subject Title:</label>
			</div>
			<div class="col-75">
				<form:input path="title" placeholder="Enter the subject header for your post" /><br>
				<form:errors path="title" cssClass="error" />
			</div>
		</div> 	
	 				 	
		
		<div class="row">
    		<div class="col-25">
				<label for="rating">Rating:</label>
			</div>
			<div class="col-75">
				<form:select path="rating" ><br>
				<form:errors path="rating" cssClass="error" />
				
					<option value="0" disabled="disabled" selected="selected">Select Your Beer Rating</option>			
					<form:option value="1">1 Stars</form:option>
					<form:option value="2">2 Stars</form:option>
					<form:option value="3">3 Stars</form:option>
					<form:option value="4">4 Stars</form:option>
					<form:option value="5">5 Stars</form:option>
				</form:select>	
			</div>
		</div>
		

		<div class="row">
    			<div class="col-25">
					<label for="review">Beer Review:</label>
				</div>
				<div class="col-75">
					<form:input path="review" placeholder="Enter your review" /><br>
					<form:errors path="review" cssClass="error" />
				</div>
		</div>  


			<div id="survey-submit" style="padding-bottom:20px; ">
					<input type="submit" value="Submit"/>
			</div>
			</form:form>	
 	</div>
		</div>

<%@ include file="/WEB-INF/jsp/footer.jsp"%>
