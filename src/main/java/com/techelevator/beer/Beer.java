package com.techelevator.beer;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

public class Beer {
	
	private long id; 
	private long brewery_id; 
	
	@NotBlank(message="*Beer Name is required")
	@Size(message="*Beer Name cannot exceed 50 characters")
	private String beerName; 
	
	@NotBlank(message="*Beer Type is required")
	@Size(message="*Beer Type cannot exceed 50 characters")
	private String beerType; 
	
	@NotBlank(message="*ABV is required")
	@Size(message="*ABV cannot exceed 6 characters")
	private String abv; 
	
	@NotBlank(message="*Flavor is required")
	private String flavor; 
	
	@NotBlank(message="*Color is required")
	private String color;
	
	@NotBlank(message="*Aroma is required")
	private String aroma; 
	
	@NotBlank(message="*A description is required")
	private String beerDescription; 
	
	private String imagePath;
	
	
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getBrewery_id() {
		return brewery_id;
	}
	public void setBrewery_id(long brewery_id) {
		this.brewery_id = brewery_id;
	}
	public String getBeerName() {
		return beerName;
	}
	public void setBeerName(String beerName) {
		this.beerName = beerName;
	}
	public String getBeerType() {
		return beerType;
	}
	public void setBeerType(String beerType) {
		this.beerType = beerType;
	}
	public String getAbv() {
		return abv;
	}
	public void setAbv(String abv) {
		this.abv = abv;
	}
	public String getFlavor() {
		return flavor;
	}
	public void setFlavor(String flavor) {
		this.flavor = flavor;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getAroma() {
		return aroma;
	}
	public void setAroma(String aroma) {
		this.aroma = aroma;
	}
	public String getBeerDescription() {
		return beerDescription;
	}
	public void setBeerDescription(String beerDescription) {
		this.beerDescription = beerDescription;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	} 

}
