
<%@ include file="/WEB-INF/jsp/header.jsp"%>

 <section id="breweryList-main-content">
 	
 <div class="img-responsive">
 	<div class="container">
 	<div id="fade">
 	<h1 style="text-align:center;"><strong>"Beer makes you feel the way you ought to feel without beer."</strong></h1> <br>
 	<h3 style="text-align:center; padding-bottom: 30px;">~Henry Lawson~</h3>
	</div>
 	
 	<table class="table table-hover">
	
		<c:forEach var="brewery" items="${breweries}">
					
			<tr>	
				<td id="pic-column">
				
				<c:url var="breweryDetailUrl" value="/breweryDetail">
				  	<c:param name="id" value="${brewery.id}"/>
				</c:url>
				
<%-------------------------------------REMOVE LATER---------------------------------------------------%>
				
			<c:choose>
					
				<c:when test="${empty brewery.imagePath}"> 
					<a href="${breweryDetailUrl}"><img id="brewery-images" src="img/SitePhotos/default_brewery.jpg"/></a>
				</c:when>
 				 <c:when test="${brewery.userImageUpload eq true}">
 					<a href="${breweryDetailUrl}"><img id="brewery-images" src="${brewery.imagePath}"/></a>
 				</c:when>  
 				<c:when test="${brewery.userImageUpload eq false}"> 
					<a href="${breweryDetailUrl}"><img id="brewery-images" src="${brewery.imagePath}"/></a>
				</c:when>
			</c:choose>
				
				</td>
<%-------------------------------------REMOVE LATER---------------------------------------------------%>	
				
					
				<td id="middle-align">		
						<div id="brewery-name">
							<strong><c:out value="${brewery.breweryName}" /></strong>
						</div>
					
						<div id="brewery-city">
							<c:out value="${brewery.city}, ${brewery.district}" />
						</div>
						
						
						<%-- <div id="brewery-country">
							<c:out value="${brewery.country}" />
						</div> --%>
						
						<br>
						
						<div id="brewery-description">
							<c:out value="${brewery.breweryDescription}" />
						</div>
				</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	</div>
</section> 


<%@ include file="/WEB-INF/jsp/footer.jsp"%>
