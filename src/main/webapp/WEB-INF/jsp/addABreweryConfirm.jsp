<%@ include file="/WEB-INF/jsp/header.jsp"%>

<title>Brewery Confirm</title>

<c:if test="${currentUser.role == 'admin'}">
	<h2>Thank you. A new brewery has been added to The Kegstone
		Project.</h2>
	<br>
	<br>
	<h3>
		<a href="addABrewery">CLICK HERE</a> to add another brewery.
	</h3>
</c:if>

<c:if test="${currentUser.role == 'brewer'}">

	<h2>Your logo has been updated</h2>
	<br>
	<br>
	<c:url value="/breweryDetail" var="detail">
		<c:param name="id" value="${currentUser.brewery_id}" />
	</c:url>
	<h3>
		<a href="${detail}">CLICK HERE</a> to return to profile
	</h3>
</c:if>

<%@ include file="/WEB-INF/jsp/footer.jsp"%>

