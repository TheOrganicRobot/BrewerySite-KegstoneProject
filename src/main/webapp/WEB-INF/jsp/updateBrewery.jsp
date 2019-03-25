
<%@ include file="/WEB-INF/jsp/header.jsp"%>
<body>

<section id="add-a-brewery-form" class="centeredPanel"> 
	
<%-- 	<c:url var="addABreweryUrl" value="/addABrewery" />
 --%>
	<div class="brewery-form-container">
		<h1>Update your info</h1>
	
	
	
		<form:form id="add-a-brewery" action="updateBrewery" method="POST"
		modelAttribute="brewery">
		
		<%-- enctype="multipart/form-data" --%> 
		 
		
		<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
		
		<div class="row">
    		<div class="col-25">
				<label for="breweryName">Brewery Name:</label>
			</div>
			<div class="col-75">
				<form:input path="breweryName" value="${brewery.breweryName}" /><br>
				<form:errors path="breweryName" cssClass="error" />
			</div>
		</div>
		
		<div class="row">
    		<div class="col-25">			
    			<label for="address1">Address 1:</label>
    		</div>
    		<div class="col-75">
				<form:input path="address1" placeholder="address 1" value="${brewery.address1}" /><br>
				<form:errors path="address1" cssClass="error" />
			</div>
		</div>
		
		<div class="row">
    		<div class="col-25">
				<label for="address2">Address 2:</label>
			</div>
			<div class="col-75">
				<form:input path="address2" placeholder="address 2"  value="${brewery.address2}"/><br>
				<form:errors path="address2" cssClass="error" />
			</div>
		</div>
		
		<div class="row">
    		<div class="col-25">
				<label for="city">City:</label>
			</div>
			<div class="col-75">
				<form:input path="city" placeholder="city" value="${brewery.city}" /><br>
				<form:errors path="city" cssClass="error" />
			</div>
		</div>
		
		<div class="row">
    		<div class="col-25">
				<label for="district">State:</label>
			</div>
			<div class="col-75">
				<form:select path="district" ><br>
				<form:errors path="district" cssClass="error" />
					<form:option value="null">-- Select a State --</form:option>
					<form:option value="Alabama">Alabama</form:option>
					<form:option value="Alaska">Alaska</form:option>
					<form:option value="Arizona">Arizona</form:option>
					<form:option value="Arkansas">Arkansas</form:option>
					<form:option value="California">California</form:option>
					<form:option value="Colorado">Colorado</form:option>
					<form:option value="Connecticut">Connecticut</form:option>
					<form:option value="Delaware">Delaware</form:option>
					<form:option value="Florida">Florida</form:option>
					<form:option value="Georgia">Georgia</form:option>
					<form:option value="Hawaii">Hawaii</form:option>
					<form:option value="Idaho">Idaho</form:option>
					<form:option value="Illinois">Illinois</form:option>
					<form:option value="Indiana">Indiana</form:option>
					<form:option value="Iowa">Iowa</form:option>
					<form:option value="Kansas">Kansas</form:option>
					<form:option value="Kentucky">Kentucky</form:option>
					<form:option value="Louisiana">Louisiana</form:option>
					<form:option value="Maine">Maine</form:option>
					<form:option value="Maryland">Maryland</form:option>
					<form:option value="Massachusetts">Massachusetts</form:option>
					<form:option value="Michigan">Michigan</form:option>
					<form:option value="Minnesota">Minnesota</form:option>
					<form:option value="Mississippi">Mississippi</form:option>
					<form:option value="Missouri">Missouri</form:option>
					<form:option value="Montana">Montana</form:option>
					<form:option value="Nebraska">Nebraska</form:option>
					<form:option value="Nevada">Nevada</form:option>
					<form:option value="New Hampshire">New Hampshire</form:option>
					<form:option value="New Jersey">New Jersey</form:option>
					<form:option value="New Mexico">New Mexico</form:option>
					<form:option value="New York">New York</form:option>
					<form:option value="North Carolina">North Carolina</form:option>
					<form:option value="North Dakota">North Dakota</form:option>
					<form:option value="Ohio">Ohio</form:option>
					<form:option value="Oklahoma">Oklahoma</form:option>
					<form:option value="Oregon">Oregon</form:option>
					<form:option value="Pennsylvania">Pennsylvania</form:option>
					<form:option value="Rhode Island">Rhode Island</form:option>
					<form:option value="South Carolina">South Carolina</form:option>
					<form:option value="South Dakota">South Dakota</form:option>
					<form:option value="Tennessee">Tennessee</form:option>
					<form:option value="Texas">Texas</form:option>
					<form:option value="Utah">Utah</form:option>
					<form:option value="Vermont">Vermont</form:option>
					<form:option value="Virginia">Virginia</form:option>
					<form:option value="Washington">Washington</form:option>
					<form:option value="West Virginia">West Virginia</form:option>
					<form:option value="Wisconsin">Wisconsin</form:option>
					<form:option value="Wyoming">Wyoming</form:option>
				</form:select>
				
			</div>
		</div>
		
		<div class="row">
    		<div class="col-25">
				<label for="postalCode">Postal Code:</label>
			</div>
			<div class="col-75">
				<form:input path="postalCode" placeholder="postal code" value="${brewery.postalCode}" /><br>
				<form:errors path="postalCode" cssClass="error" />
			</div>
		</div>
		
		<input type="hidden" name="country" value="null"/>
		<%-- <div class="row">
    		<div class="col-25">
				<label for="country">Country:</label>
			</div>
			<div class="col-75">
				<form:input path="country" placeholder="country" /><br>
				<form:errors path="country" cssClass="error" />
			</div>
		</div> --%>
		
		<div class="row">
    		<div class="col-25">
				<label for="phoneNumber">Phone Number:</label>
			</div>
			<div class="col-75">
				<form:input path="phoneNumber" placeholder="ex. 123-456-7890" value="${brewery.phoneNumber}" /><br>
				<form:errors path="phoneNumber" cssClass="error" />
			</div>
		</div>
		
		<div class="row">
    		<div class="col-25">
				<label for="webAddress">Website Address:</label>
			</div>
			<div class="col-75">
				<form:input path="webAddress" placeholder="www.  ..." value="${brewery.webAddress}" /><br>
				<form:errors path="webAddress" cssClass="error" />
			</div>
		</div>
		
		<div class="row">
    		<div class="col-25">
				<label for="breweryDescription">Description (500 char. limit):</label>
			</div>
			<div class="col-75">
				<form:input path="breweryDescription" placeholder="enter a description" value="${brewery.breweryDescription}" /><br>
				<form:errors path="breweryDescription" cssClass="error" />
			</div>
		</div>
		
		<!-- <div class="row">
    		<div class="col-25">
				<label for="file">Upload a file:</label>
		</div>
			<div class="col-75">
				<input type="file" name="file" value="Upload"/>
		</div>
		</div> -->
		<input type="hidden" value="${brewery.id}" name="id"/>
		<div>
			<input type="submit" value="Submit" />
		</div> 
		
		</form:form>
		
		<%-- <c:if test="${not empty message}">
   			 ${message} 
		</c:if> --%>
	</div>
</section>

<%@ include file="/WEB-INF/jsp/footer.jsp"%>
