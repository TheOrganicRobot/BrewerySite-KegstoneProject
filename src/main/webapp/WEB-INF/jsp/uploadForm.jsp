<%@ include file="/WEB-INF/jsp/header.jsp"%>

<!-- UPLOADING A BEER -->
	<c:if test="${not empty beer.id}">

		<h3>Would you like to upload a corresponding image or logo?</h3>
		<br>

		<form method="POST" action="uploadFile" enctype="multipart/form-data">
			<input type="hidden" name="beerId" value="${beer.id}" /> File to
			upload: <input type="file" name="file"> <input type="submit"
				value="Upload">
		</form>
		<br />
		<br />
		<h4>
			DON'T HAVE AN IMAGE TO ADD?<br> <br> <br>

			<c:url value="/addABeer" var="addBeer">
				<c:param name="breweryId" value="${currentUser.brewery_id}" />
			</c:url>
			<a href="${addBeer}">CLICK HERE</a> to add another beer
			<br>
			<br>
			<c:url value="/breweryDetail" var="detail">
				<c:param name="id" value="${currentUser.brewery_id}"/>
			</c:url>
			<a href="${detail}">CLICK HERE</a> to return to profile
		</h4>
	</c:if>

<!-- UPLOADING A BREWERY -->
	<c:if test="${empty beer.id}">

		<h3>Would you like to upload a corresponding image or logo?</h3>
		<br>

		<form method="POST" action="uploadFile" enctype="multipart/form-data">
			<input type="hidden" name="breweryId" value="${brewery.id}" /> File
			to upload: <input type="file" name="file"> <input
				type="submit" value="Upload">
		</form>

		<br />
		<br />
		<h4>
			DON'T HAVE AN IMAGE TO ADD?<br /> <br /> 
			
			<c:if test="${currentUser.role == 'admin'}">
				<a href="addABrewery">CLICK HERE</a> to add another brewery
			</c:if>
			
			<c:if test="${currentUser.role == 'brewer'}">
				<c:url value="/breweryDetail" var="detail">
				<c:param name="id" value="${currentUser.brewery_id}"/>
				</c:url>
				<a href="${detail}">CLICK HERE</a> to return to profile
			</c:if>
				
		</h4>
 		
	</c:if>

	<c:if test="${not empty message}">
    ${message} 
</c:if>

<%@ include file="/WEB-INF/jsp/footer.jsp"%>