<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Kegstone</title>
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	    <script src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.min.js"></script>
	    <script src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/additional-methods.js "></script>
	    <script src="https://cdn.jsdelivr.net/jquery.timeago/1.4.1/jquery.timeago.min.js"></script> 
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> 
	    
	    <c:url var="cssHref" value="/css/site.css" />
		<link rel="stylesheet" type="text/css" href="${cssHref}">
		
		<script type="text/javascript">
			$(document).ready(function() {
				$("time.timeago").timeago();
				
				$("#logoutLink").click(function(event){
					$("#logoutForm").submit();
				});
				
				var pathname = window.location.pathname;
				$("nav a[href='"+pathname+"']").parent().addClass("active");
				
			});
			
			
		</script>
		
	</head>
	<body>
		<header>

		</header>
		<div class="container" style="margin-bottom:180px; text-align:center;">
		<nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
			<div class="container-fluid">
				<ul class="nav navbar-nav">
					
					<li><a class="dropdown-toggle" data-toggle="dropdown" href="#">Menu<span class="caret"></span></a>
										
					<ul class="dropdown-menu dropdown">      
	        			<c:url var="homePageHref" value="/home" />
						<li><a href="${homePageHref}">Home</a></li>
											
						<c:url var="BreweryPageHref" value="/breweryList"/>
						<li><a href="${BreweryPageHref}">Brewery List</a></li>
											
						<c:url var="LeaveAReviewHref" value="/beerReviewResult"/>
						<li><a href="${LeaveAReviewHref}">Read Beer Reviews</a></li>
												
						<c:url var="ReviewsHref" value="/bestRatedBeers"/>
						<li><a href="${ReviewsHref}">Best Rated Beers</a></li>
					</ul>
					
				</ul>
			
				<ul class="nav navbar-nav navbar-right">
					<c:choose>
						<c:when test="${empty currentUser}">
											
							<%-- <c:url var="loginHref" value="/login" />
							<li><a href="${loginHref}">Log In</a></li><br>  --%>
							
						<li><a class="dropdown-toggle" data-toggle="dropdown" href="#">Login<span class="caret"></span></a>
										
					<ul class="dropdown-menu dropdown" style="padding:10px;">
		
						<c:url var="formAction" value="/login" />
							<form method="POST" action="${formAction}" modelAttribute="login">
							<input type="hidden" name="destination" value="${param.destination}"/>
							<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
			
								<div class="form-group">
									
									<input type="search" id="userName" name="userName" placeHolder="User Name" class="form-control" />
								</div>
								
								<div class="form-group">
									
									<input type="password" id="password" name="password" placeHolder="Password" class="form-control" />
								</div>
								<button type="submit" class="btn btn-primary">Login</button>
								
							</form>
					</ul>
		
				</c:when>
			<c:otherwise>
						
			<li><a class="dropdown-toggle" data-toggle="dropdown" href="#">${currentUser.userName}<span class="caret"></span></a>
										
					<ul class="dropdown-menu dropdown">  
					    
	        			<c:if test="${currentUser.role == 'admin'}">
							<c:url var="addABreweryHref" value="/addABrewery" />
							<li><a href="${addABreweryHref}">Add A Brewery</a></li><br> 
						</c:if> 
				
						<c:if test="${currentUser.role == 'brewer'}">	
							<c:url value="/breweryDetail" var="detail">
								<c:param name="id" value="${currentUser.brewery_id}"/>
							</c:url>
							<li><a href="${detail}">View Profile</a></li><br>
							 
							<c:url value="/addABeer" var="addBeer">
								<c:param name="breweryId" value="${currentUser.brewery_id}"/>
							</c:url>
							<li><a href="${addBeer}">Add A Beer</a></li><br> 
							
						</c:if>	
							<c:url var="logoutAction" value="/logout" />
								<form id="logoutForm" action="${logoutAction}" method="POST">
								<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
								</form>
							<li><a id="logoutLink" href="#">Log Out</a></li>
					</ul>
						
						
							
						</c:otherwise>
					</c:choose>
				</ul>
				
		
		<%-- <div class="jumbotron-fluid" style="background-color: #272B34;">
			
				<img src="${location}/siteLogo.jpg"
					style="width: 25%; text-align: center;">
				<div class="float-right"></div>
			</div> --%>
			
			<c:url var="location" value="/img/SitePhotos" />
			<img src="${location}/siteLogo.jpg" id="stuff" >
			
			</div>
		</nav>
		</div>
		
			
		<div class="container">