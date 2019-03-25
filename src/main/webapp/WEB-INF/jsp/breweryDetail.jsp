<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/jsp/header.jsp"%>

<h1 id="text-center">Welcome To ${brewery.breweryName}</h1><br><br>

<table class="table">
<tr>
 	<td id="middle-align" width="33%">
	<div>	
	<%-------------------------------------REMOVE LATER---------------------------------------------------%>	
 		<c:choose>				
				<c:when test="${empty brewery.imagePath}"> 
					<img id="brewery-images2" src="img/SitePhotos/default_brewery.jpg"/>
				</c:when>
 				 <c:when test="${brewery.userImageUpload eq true}">
 					<img id="brewery-images2" src="${brewery.imagePath}"/>
 				</c:when>  
 				<c:when test="${brewery.userImageUpload eq false}"> 
					<img id="brewery-images2" src="${brewery.imagePath}"/>
				</c:when>
			</c:choose>
	<%-------------------------------------REMOVE LATER---------------------------------------------------%>
 		</div>
 		</td>
	
 		<td id="middle-align" style="text-align:left;" width="47%">
 		<br>
 		<div><b>Name: </b><c:out value="${brewery.breweryName}"/></div>
		<div><b>Address: </b><c:out value="${brewery.address1}"/></div>			
		<div><b>City/State: </b><c:out value="${brewery.city}, ${brewery.district}"/></div>
		<div><b>Zip: </b><c:out value="${brewery.postalCode}"/></div>
 		<div><b>Phone Number: </b><c:out value="${brewery.phoneNumber}"/></div><br>
		<div><b>Website: </b><a href="${brewery.webAddress}" target ="_blank"><c:out value="${brewery.webAddress}"/></a></div><br>
		<div><b>Description: </b><c:out value="${brewery.breweryDescription}"/></div><br>
		</td>
		
		<td width="20%">
		
		
		<c:if test="${currentUser.role == 'brewer' && currentUser.brewery_id == brewery.id || 
			currentUser.role == 'admin'}">
			
			<c:url value="/updateBrewery" var="update">
			<c:param name="breweryId" value="${brewery.id}"/>
			</c:url>
			<a href="${update}" class="btn btn-primary btn-lg" role="button" >Edit information</a><br>
			
			<br />
			
			<c:url value="/addABeer" var="addBeer">
			<c:param name="breweryId" value="${brewery.id}"/>
			</c:url>
			<a href="${addBeer}" class="btn btn-primary btn-lg" role="button" >Add a new beer</a>
			
		</c:if>
		
		</td>
		
		</tr>
		</table><br><br>
		
	<h1 id="text-center">List of brews</h1><br><br>
	<table class="table">
	<c:forEach var="beer" items="${allbeers}">
	<tr>
	<td width=20% id="text-center">
	
	<c:url var="beerDetailUrl" value="/beerDetail">
		<c:param name="id" value="${beer.id}"/>	
	</c:url>
	
	
	
	<%-------------------------------------REMOVE LATER---------------------------------------------------%>
	<div id="middle-align">
	<c:if test="${empty beer.imagePath}"> 
		<a href="${beerDetailUrl}"><img id="beer-images" src="img/SitePhotos/default_beer.jpg"/></a>
	</c:if>
	<c:if test="${not empty beer.imagePath}"> 
		<a href="${beerDetailUrl}"><img id="beer-images" src="${beer.imagePath}"/></a>
	</c:if>
	</div>
	<%-------------------------------------REMOVE LATER---------------------------------------------------%>
	
	
	<%-- <c:url var="imgsrc" value="${beer.imagePath}"/>
	<a href="${beerDetailUrl}"><img src="${imgsrc}" id="beer-images"/></a> --%>

	</td>
	<td width=80% id="middle-align">  
	<div>
<!--	<c:url var="imgsrc" value="${beer.imagePath}"/><img src="${imgsrc}"/><br>  -->
	
	<div><h3 style="display:inline;"><b>Name: </b></h3><h4 style="display:inline;"><c:out value="${beer.beerName}"/></h4></div><br>
	<div><h3 style="display:inline;"><b>Type: </b></h3><h4 style="display:inline;"><c:out value="${beer.beerType}"/></h4></div><br>
	<div><h3 style="display:inline;"><b>Abv: </b></h3><h4 style="display:inline;"><c:out value="${beer.abv}"/></h4></div><br>
	
	<c:set var="foundReview" value="false" />

	
	<c:forEach items="${beerReview}" var="review">
	
	<c:if test="${review.beerId == beer.id}">
		<c:set var="foundReview" value="true" />
		<c:set var ="stars" value="${review.rating}"/> 
		<h3 style="display:inline;"><b>Average Beer Rating: </b></h3>
	<c:choose>
	
		<c:when test = "${stars > 0 && stars<=1.9}">
			<img src="img/1-star.png" height="15" width= "100" id="stars"/> 
		</c:when>
	
		<c:when test = "${stars > 0 && stars <= 2.9}">
			<img src="img/2-star.png" height="15" width= "100" id="stars"/>
		</c:when>
	
		<c:when test = "${stars > 0 && stars<=3.9}">
			<img src="img/3-star.png" height="15" width= "100" id="stars"/>
		</c:when>
	
		<c:when test = "${stars > 0 && stars<=4.9}">
			<img src="img/4-star.png" height="15" width= "100" id="stars"/>
		</c:when>
	
		<c:when test = "${stars > 0 && stars<=5.0}">
			<img src="img/5-star.png" height="15" width= "100" id="stars"/>
		</c:when>
		
	</c:choose>
	</c:if>
	
	</c:forEach>
	<c:if test="${foundReview == false}">

		<h4 style="color:cornflowerblue;" style="padding-top:0px;"><b><c:out value= "Be The First To Rate This Beer!"/></b></h4>

	</c:if>
	
	<br>
	
	</div>
	
	</td> 
	<td>
	<c:url var="delete" value="/deleteABeer">
		<c:param name="id" value="${beer.id}"/>
	</c:url>
	<form action="${delete}" method="POST">  
	<c:if test="${currentUser.role == 'brewer' && currentUser.brewery_id == brewery.id || 
		currentUser.role == 'admin'}">
		 <button class="btn btn-primary btn-lg"  type="submit" name="delete" value="delete">Delete this beer</button> 
				<input type="hidden" id="breweryId" name="breweryId" value="${brewery.id}">
				<input type="hidden" id="beerId" name="beerId" value="${beer.id}">

	</c:if>
	</form>
	</td>
	</tr>
	</c:forEach>
  
</table>

<%@ include file="/WEB-INF/jsp/footer.jsp"%>
 