package com.techelevator.beerreview;

import java.time.LocalDateTime;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

public class BeerReview {
	
	private Long id; 
	private Long beerId; 
	private LocalDateTime dateSubmitted;
	private int rating; 
	
	@NotBlank(message="*Beer Review is required")
	@Size(message="*Beer review cannot exceed 500 characters")
	private String review;
	
	@NotBlank(message="*Username is required")
	@Size(message="*User Name cannot exceed 50 characters")
	private String userName; 
	
	@NotBlank(message="*Review title is required")
	@Size(message="*Beer Title cannot exceed 80 characters")
	private String title; 
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Long getBeerId() {
		return beerId;
	}
	public void setBeerId(Long beerId) {
		this.beerId = beerId;
	}

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
//	public String getBeerName() {
//		return beerName;
//	}
//	public void setBeerName(String beerName) {
//		this.beerName = beerName;
//	}
	public LocalDateTime getDateSubmitted() {
		return dateSubmitted;
	}
	public void setDateSubmitted(LocalDateTime dateSubmitted) {
		this.dateSubmitted = dateSubmitted;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	} 

}
