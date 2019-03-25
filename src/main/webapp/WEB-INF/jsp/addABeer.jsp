
<%@ include file="/WEB-INF/jsp/header.jsp"%>
<body>

<section id="add-a-beer-form" class="centeredPanel"> 
	
	<c:url var="addABeerUrl" value="/addABeer" />

	<div class="beer-form-container">
		<h1>Add A Beer</h1>
	
		<form:form id="add-a-beer" action="${addABeerUrl}" method="POST"
		modelAttribute="addABeer">
		
		<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
		
			<input type="hidden" value="${breweryId}" name="brewery_id"/>
			
		<div class="row">
    		<div class="col-25">
				<label for="beerName">Beer Name:</label>
			</div>
			
			<div class="col-75">
				<form:input path="beerName" placeholder="Enter the beer name" /><br>
				<form:errors path="beerName" cssClass="error" />
			</div>
		</div>
		
		<div class="row">
    		<div class="col-25">			
    			<label for="beerType">Beer Type:</label>
    		</div>
    		<div class="col-75">
				<form:input path="beerType" placeholder="Enter the beer type" /><br>
				<form:errors path="beerType" cssClass="error" />
			</div>
		</div>
		
		<div class="row">
    		<div class="col-25">
				<label for="abv">Alcohol By Volume (ABV): </label>
			</div>
			<div class="col-75">
				<form:input path="abv" placeholder="Enter the alcohol by volume" /><br>
				<form:errors path="abv" cssClass="error" />
			</div>
		</div>
		
		<div class="row">
    		<div class="col-25">
				<label for="flavor">Flavor:</label>
			</div>
			<div class="col-75">
				<form:input path="flavor" placeholder="Enter the flavor of the beer" /><br>
				<form:errors path="flavor" cssClass="error" />
			</div>
		</div>
		
		<div class="row">
    		<div class="col-25">
				<label for="color">Color:</label>
			</div>
			<div class="col-75">
				<form:input path="color" placeholder="Enter the color" /><br>
				<form:errors path="color" cssClass="error" />	
			</div>
		</div>
		
		<div class="row">
    		<div class="col-25">
				<label for="aroma">Aroma:</label>
			</div>
			<div class="col-75">
				<form:input path="aroma" placeholder="Enter the aroma" /><br>
				<form:errors path="aroma" cssClass="error" />
			</div>
		</div>

		
		<div class="row">
    		<div class="col-25">
				<label for="beerDescription">Beer Description:</label>
			</div>
			<div class="col-75">
				<form:textarea rows="3" path="beerDescription" placeholder="Enter a beer description" /><br>
				<form:errors path="beerDescription" cssClass="error" /><br>
			</div>
		</div>

	
		
		<div>
			<input type="submit" value="Submit" />
		</div> 
		
		</form:form>
	</div>
</section>

<%@ include file="/WEB-INF/jsp/footer.jsp"%>
