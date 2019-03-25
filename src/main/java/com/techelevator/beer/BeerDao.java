package com.techelevator.beer;

import java.util.List;

public interface BeerDao {
	
	public List<Beer> getAllBeersByBreweryId(Long brewery_id); 
	
	public List<Beer> getAllBeers();
	
	public Beer getBeerDetailByBeerId(Long id);
	
	public void addABeer(Beer beer); 
	
	public void addBeerLogo(Long id, String imagePath);

	public void deleteABeer(Long id);
	
}
