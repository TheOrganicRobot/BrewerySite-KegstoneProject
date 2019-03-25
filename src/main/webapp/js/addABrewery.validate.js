$(document).ready(function () {
	
	$("form#add-a-brewery").validate({
		rules: {
			breweryName: {
				required: true,
			},
			address1: {
				required: true,
			},
			city: {
				required: true,
			},
			district: {
				required: true,
			},
			postalCode: {
				required: true,
			},
			phoneNumber: {
				required: true,
			},
			webAddress: {
				required: true,
			},
			breweryDescription: {
				required: true,
			}
		},
		errorClass : "error"
			
		
	});
	
});
