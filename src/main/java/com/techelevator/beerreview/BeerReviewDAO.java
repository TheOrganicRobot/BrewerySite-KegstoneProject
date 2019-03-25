package com.techelevator.beerreview;

import java.util.List;

public interface BeerReviewDAO {
	
	public List<BeerReview> getBeerReview(); 
	public List<BeerReview> getBestBeerReviews();
	public void saveBeerReviews(BeerReview review);
	
}
