<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/jsp/header.jsp"%>

<h1 style="text-align:center;">Beer details for ${beer.beerName}</h1><br><br>

<!-- <table style="text-align:center;"> -->
<table class="table">
<tr>
 	<td id="middle-align"  width="13%">
 	
 	
 	<%-------------------------------------REMOVE LATER---------------------------------------------------%>
 	<c:if test="${empty beer.imagePath}"> 
		<img id="beer-images2" src="img/SitePhotos/default_beer.jpg"/>
	</c:if>
	<c:if test="${not empty beer.imagePath}"> 
		<img id="beer-images2" src="${beer.imagePath}"/>
	</c:if>
	<%-------------------------------------REMOVE LATER---------------------------------------------------%>	
 	
 	</td>
 	<td id="middle-align" width="67%">
 		<br>
 		<div><b>Name: </b><c:out value = "${beer.beerName}"/></div>
		<div><b>Type: </b><c:out value = "${beer.beerType}"/></div>			
		<div><b>ABV: </b><c:out value = "${beer.abv}"/></div>
		<div><b>Flavor: </b><c:out value = "${beer.flavor}"/></div>
		<div><b>Color: </b><c:out value = "${beer.color}"/></div>
		<div><b>Aroma: </b><c:out value = "${beer.aroma}"/></div>
		<c:forEach items="${beerReview}" var="review">
		<c:if test="${review.beerId == beer.id}">
		<div style="display:inline;"><b>Avg. Rating: </b>
		<c:set var ="stars" value="${review.rating}"/> 
	<c:choose>
		<c:when test = "${stars<1}">
			<img src="img/images.png" height="18" width="95"/>
		</c:when>
	
		<c:when test = "${stars<=1.9}">
			<img src="img/1-star.png" height="15" width= "100" /> 
		</c:when>
	
		<c:when test = "${stars <= 2.9}">
			<img src="img/2-star.png" height="15" width= "100" />
		</c:when>
	
		<c:when test = "${stars<=3.9}">
			<img src="img/3-star.png" height="15" width= "100" />
		</c:when>
	
		<c:when test = "${stars<=4.9}">
			<img src="img/4-star.png" height="15" width= "100" />
		</c:when>
	
		<c:when test = "${stars<=5.0}">
			<img src="img/5-star.png" height="15" width= "100" />
		</c:when>
	</c:choose>
	</div>
	</c:if>
	</c:forEach><br><br>
		<div><b>Description: </b><c:out value = "${beer.beerDescription}"/></div>
				
	</td>
	<td width="20%">
	
	<c:url value="/beerReviewInput" var="review">
	<c:param name="beerid" value="${beer.id}"/></c:url> 
	<a href="${review}" class="btn btn-primary btn-lg" role="button" >Leave a Review!</a>
	
	</td>   
	</tr>  
</table>
<%@ include file="/WEB-INF/jsp/footer.jsp"%>





