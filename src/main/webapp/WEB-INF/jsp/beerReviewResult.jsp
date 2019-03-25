<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ include file="/WEB-INF/jsp/header.jsp"%>


	<h1 id="text-center" style="font-family:DejaVu Sans Mono, monospace; font-size:50px"><b>READ ABOUT PEOPLE'S FAVORITE BEERS!</b></h1>
	<div id="survey-content">
				<div class="container">
					<table class="table tableTop table-hover" id="table">	
					
			
			<c:forEach items="${beerReview}" var="review">
			
			<tr>
			<td width="8%"></td>
			<td id="text-center">

			
			<c:forEach items="${beer}" var="beer">
				<c:if test="${review.beerId == beer.id}">
				<c:url var="beerDetailUrl" value="/beerDetail">
					<c:param name="id" value="${beer.id}"/>
				</c:url>
				<a href="${beerDetailUrl}"><img id="beer-images" src="${beer.imagePath}"/></a>	
				</c:if>
			</c:forEach>
			</td>

			<td id="middle-align" style="padding-right:10px;">
			
			<b>Beer Name:</b>
			<c:forEach items="${beer}" var="beer">
			<c:if test="${review.beerId == beer.id}">
			<c:out value="${beer.beerName}"/>
			</c:if>
			</c:forEach>
				<br>
			
		<div>	
		<b>User Rating:</b>			
		<c:set var ="stars" value="${review.rating}"/> 
	<c:choose>
		<c:when test = "${stars<1}">
			<img src="img/images.png" height="18" width="95" id="stars"/>
		</c:when>
	
		<c:when test = "${stars<=1.9}">
			<img src="img/1-star.png" height="15" width= "100" id="stars"/> 
		</c:when>
	
		<c:when test = "${stars <= 2.9}">
			<img src="img/2-star.png" height="15" width= "100" id="stars"/>
		</c:when>
	
		<c:when test = "${stars<=3.9}">
			<img src="img/3-star.png" height="15" width= "100" id="stars"/>
		</c:when>
	
		<c:when test = "${stars<=4.9}">
			<img src="img/4-star.png" height="15" width= "100" id="stars"/>
		</c:when>
	
		<c:when test = "${stars<=5.0}">
			<img src="img/5-star.png" height="15" width= "100" id="stars"/>
		</c:when>
	</c:choose>	<br>
		</div>	
			
			<b>Title:</b>
				<c:out value="${review.title}"/><br>
			<%-- <b>Review Date: </b>	
				<fmt:formatDate type="date" value="${review.dateSubmitted}" /> 
				<br> --%>
			
				
	<br>		<c:out value="${review.review}"/><br>

		</td>
		<td width="8%"></td>
		</tr>

			</c:forEach>
	
			</table>
	</div>
	</div>

<%@ include file="/WEB-INF/jsp/footer.jsp"%>