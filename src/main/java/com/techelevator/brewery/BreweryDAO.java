package com.techelevator.brewery;

import java.util.List;

public interface BreweryDAO {

	public List<Brewery> getAllBreweries(); 
	
	public Brewery getBreweryByCode(Long id); 
	
	public void addABrewery(Brewery brewery);
	
	public void addBreweryLogo(Long id, String imagePath);

	public void updateBrewery(Brewery brewery);
}
