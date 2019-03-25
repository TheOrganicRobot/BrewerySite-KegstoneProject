
<%@ include file="/WEB-INF/jsp/header.jsp"%>

<section>

	<c:url var="location" value="/img/SitePhotos" />
	<div class="container">
		
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
				<li data-target="#myCarousel" data-slide-to="4"></li>
			</ol>

			<!-- Wrapper for slides -->

			<div class="carousel-inner">
				<div class="item active carouselSetHeight">
					<img src="${location}/carousel_barley.jpg" alt="Barley"
						style="width: 100%;">
					<div class="carousel-caption">
						<h2 id="opaqueBackground"  >From earth to mouth</h2>
						<p  >Creation starts with an idea.</p>
					</div>
				</div>

				<div class="item">
					<img src="${location}/carousel_bottle_production.jpg" alt="Bottles"
						style="width: 100%;">
					<div class="carousel-caption">
						<h2  >A great night begins</h2>
						<p  >Where a glass of beer ends.</p>
					</div>
				</div>

				<div class="item">
					<img src="${location}/carousel_keg_and_stein.jpg" alt="Keg"
						style="width: 100%;">
					<div class="carousel-caption">
						<h2  >Tale as old as time</h2>
						<p  >Big ol' friggin Stein. Beauty and the yeast.</p>
					</div>
				</div>

				<div class="item">
					<img src="${location}/carousel_full_spectrum.jpg" alt="Full"
						style="width: 100%;">
					<div class="carousel-caption">
						<h2  >Family is always made</h2>
						<p  >When everyone comes together.</p>
					</div>
				</div>

				<div class="item carouselSetHeight">
					<img src="${location}/carousel_hops.jpg" alt="Hops"
						style="width: 100%;">
					<div class="carousel-caption">
						<h2  >Destination fun</h2>
						<p  >Is just a "hop", skip and a jump away.</p>
					</div>
				</div>
			</div>

		
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>

	<div class="img-responsive">
		<div class="container" style="padding-top: 27px;">
			<div class="row">

				<div class="col-md-4 imgContainer">
					<c:url var="breweryListImageUrl" value="/img/SitePhotos/link1.jpg" />
					<c:url var="breweryListUrl" value="/breweryList" />
					<img src="${breweryListImageUrl}" class="image"/>
						<a href="${breweryListUrl}"><div class="overlay">
    						<div class="text" style="font-family:Apple Chancery, cursive">Brewery List</div>
  						</div></a>
				</div>

				<div class="col-md-4 imgContainer">
					<c:url var="ratingsListImageUrl" value="/img/SitePhotos/link6.jpg" />
					<c:url var="ratingsListUrl" value="/beerReviewResult"/> 
					<img src="${ratingsListImageUrl}" class="image"/>
					<a href="${ratingsListUrl}"><div class="overlay">
    						<div class="text" style="font-family:Apple Chancery, cursive">User Rated Beer Reviews</div>
  						</div></a>
				</div>
						

				<div class="col-md-4 imgContainer">
					<c:url var="bestListImageUrl" value="/img/SitePhotos/link8.jpg" />
					 <c:url var="bestListUrl" value="/bestRatedBeers"/>  
					<img src="${bestListImageUrl}" class="image"/>	
						
						<a href="${bestListUrl}"><div class="overlay">
    						<div class="text" style="font-family:Apple Chancery, cursive">Best Rated Brews</div>
  						</div></a>
  					</div>

			</div>
		</div>
	</div>

</section>

<%@ include file="/WEB-INF/jsp/footer.jsp"%>


