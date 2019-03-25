package com.techelevator.brewery;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

public class Brewery {

	private Long id;
	private boolean isUserImageUpload;
	
	@NotBlank(message="*Name is required")
	@Size(message="*Brewery Name cannot exceed 50 characters")
	private String breweryName; 
	
	@NotBlank(message="*Address 1 is required")
	@Size(message="*Address 1 cannot exceed 50 characters")
	private String address1; 
	
	@Size(message="*Address 2 cannot exceed 50 characters")
	private String address2; 
	
	@NotBlank(message="*City is required")
	@Size(message="*City cannot exceed 50 characters")
	private String city; 
	
	@NotNull(message="*State is required")
	private String district;
	
	@NotBlank(message="*Country is required")
	@Size(message="*Country cannot exceed 50 characters")
	private String country; 
	
	@NotBlank(message="*Postal code is required")
	@Size(min=5, max=10, message="*Postal code must be 5-10 digits in length")
	private String postalCode; 
	
	@Pattern(regexp="^\\(\\d{3}\\)\\s?\\d{3}\\-\\d{4}$", message="Phone number format (###)###-####")
	private String phoneNumber;
	
	@NotBlank(message="*Website is required, starting with \'www.\'")
	private String webAddress;
	
	private String imagePath;
	
	@NotBlank(message="*Description is required")
	@Size(message="*Description cannot be more than 500 characters")
	private String breweryDescription;
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getBreweryName() {
		return breweryName;
	}
	public void setBreweryName(String breweryName) {
		this.breweryName = breweryName;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getPostalCode() {
		return postalCode;
	}
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getWebAddress() {
		return webAddress;
	}
	public void setWebAddress(String webAddress) {
		this.webAddress = webAddress;
	}
	public String getBreweryDescription() {
		return breweryDescription;
	}
	public void setBreweryDescription(String breweryDescription) {
		this.breweryDescription = breweryDescription;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	} 
	public boolean isUserImageUpload() {
        return isUserImageUpload;        
    }
	public void setIsUserImageUpload(boolean isUserImageUpload) {
		this.isUserImageUpload = isUserImageUpload;
	}
	
}
