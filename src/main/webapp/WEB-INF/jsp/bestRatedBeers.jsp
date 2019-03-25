<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/jsp/header.jsp"%>

 <html>
	<h1 id="text-center" style="font-family:DejaVu Sans Mono, monospace; font-size:50px"><b>FIND OUT WHICH BEERS ARE RATED THE BEST!</b></h1>
 
						
			<div id="survey-content">
				<div class="container">
					<table class="table tableTop" id="table">
						
<%-- 			<center><b>Best Rated Beer Averages</b></center>
		

 --%>	<c:forEach items="${beerReview}" var="review">
 			<tr style="padding-top:5px;">
 			<td width="8%"></td>
			<td id="text-center">
			<br>
			<c:forEach items="${beer}" var="beer">
				<c:if test="${review.beerId == beer.id}">
					<c:url var="beerDetailUrl" value="/beerDetail">
						<c:param name="id" value="${beer.id}"/>
					</c:url>
						<a href="${beerDetailUrl}"><img  id="beer-images"  src="${beer.imagePath}"/></a>	
				</c:if>
			</c:forEach>
		</td>
		
		
		<td id="middle-align">
			<div class="Beer-text-size">
			<c:forEach items="${beer}" var="beer">
			<c:if test="${review.beerId == beer.id}">
			<h1 style="font-family:cursive"><b><c:out value="${beer.beerName}"/></b></h1>
			</c:if>
			</c:forEach>
			</div>
			
		<div>	
		<p style="font-size:18px; display:inline;"><b>Average User Rating:</b></p>		
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
	</c:choose>
	
<%-- 	<c:forEach items="${beer}" var="beer" >
		<c:if test="${review.beerId == beer.id}">
			<h5><c:out value="${review.title}"/></h5>
		</c:if>
	</c:forEach> --%>
	
			<br>
			<br>
			</div>
		
		</td>
		
		</tr>
			</c:forEach>
			</table>
	</div>
	</div> 

<%@ include file="/WEB-INF/jsp/footer.jsp"%>