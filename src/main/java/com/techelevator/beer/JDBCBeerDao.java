package com.techelevator.beer;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCBeerDao implements BeerDao {

	private JdbcTemplate template; 
	
	@Autowired 
	public JDBCBeerDao(DataSource dataSource) {
		this.template = new JdbcTemplate(dataSource); 
	}
	
	@Override
	public List<Beer> getAllBeers() {
		List<Beer> beers = new ArrayList<>(); 
		
		String sqlGetAllBeers = "SELECT * FROM beer"; 
		SqlRowSet results = template.queryForRowSet(sqlGetAllBeers); 
		
		while(results.next()) {
			Beer theBeer = mapRowToBeer(results); 
			beers.add(theBeer); 
		}
		return beers;		
	}
	@Override
	public List<Beer> getAllBeersByBreweryId(Long id) {
		List<Beer> beers = new ArrayList<>(); 
		
		String sqlGetAllBeers = "SELECT * FROM beer WHERE brewery_id = ?"; 
		SqlRowSet results = template.queryForRowSet(sqlGetAllBeers, id); 
		
		while(results.next()) {
			Beer theBeer = mapRowToBeer(results); 
			beers.add(theBeer); 
		}
		return beers;		
	}
	
	@Override
	public Beer getBeerDetailByBeerId(Long id) {
		Beer beer = null; 
		String sqlGetBeerDetail = "SELECT * FROM beer WHERE beer_id = ?"; 
		SqlRowSet results = template.queryForRowSet(sqlGetBeerDetail, id); 
		
		if(results.next()) {
			beer = mapRowToBeer(results); 
		}
		return beer;		
	}
	
	@Override
	public void addABeer(Beer beer) {
		Long id = getNextBeerId();
		beer.setId(id);
		String sqlInsertBeer = "INSERT INTO beer(beer_id, brewery_id, beername, beertype, abv, flavor, color, aroma, beerdescription, imagepath) VALUES (?,?,?,?,?,?,?,?,?,?)";
		template.update(sqlInsertBeer, id, beer.getBrewery_id(), beer.getBeerName(), beer.getBeerType(), beer.getAbv(), beer.getFlavor(), beer.getColor(), beer.getAroma(), beer.getBeerDescription(), beer.getImagePath());
		
	}
	
	@Override
	public void addBeerLogo(Long id, String imagePath) {
		String sqladdBeerLogo = "UPDATE beer SET imagepath = ? WHERE beer_id = ?";		
		template.update(sqladdBeerLogo, imagePath, id);
	}
	
	@Override
	public void deleteABeer(Long id) {
		String sqlDeleteBeerFromBeer = "DELETE FROM beer WHERE (beer_id = ?)"; 
				   
		
		template.update(
			sqlDeleteBeerFromBeer,
			id);	
	}

	private Beer mapRowToBeer(SqlRowSet results) {
		Beer theBeer; 
		theBeer = new Beer(); 
		
		theBeer.setId(results.getLong("beer_id")); 
		theBeer.setBrewery_id(results.getLong("brewery_id"));
		theBeer.setBeerName(results.getString("beername"));
		theBeer.setBeerType(results.getString("beertype"));
		theBeer.setAbv(results.getString("abv"));
		theBeer.setFlavor(results.getString("flavor"));
		theBeer.setColor(results.getString("color"));
		theBeer.setAroma(results.getString("aroma"));
		theBeer.setBeerDescription(results.getString("beerdescription"));
		theBeer.setImagePath(results.getString("imagepath"));
		
		return theBeer; 
	}
	
	private long getNextBeerId() {
		SqlRowSet nextIdResult = template.queryForRowSet("SELECT nextval('beer_beer_id_seq')");
		Long id = null;
		if(nextIdResult.next()) {
			id = nextIdResult.getLong(1);
		} else {
			throw new RuntimeException("Something went wrong while getting an id for the new beer");
		}
		return id;
	}

}
