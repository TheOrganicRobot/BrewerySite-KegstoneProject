<%@ include file="/WEB-INF/jsp/header.jsp"%>

<title>Beer Confirm</title>

	<h2>A beer has been successfully added to your brewery listing.</h2>
	<br>
	<br>
	
	<c:url value="/addABeer" var="addBeer">
		<c:param name="breweryId" value="${currentUser.brewery_id}"/>
	</c:url>
	<h3><a href="${addBeer}">CLICK HERE</a> to add another beer.</h3><br>
		

	<c:url value="/breweryDetail" var="detail">
	<c:param name="id" value="${currentUser.brewery_id}"/>
	</c:url>
	<h3><a href="${detail}">CLICK HERE</a> to return to profile</h3>

<%@ include file="/WEB-INF/jsp/footer.jsp"%>

