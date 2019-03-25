package com.techelevator.brewery;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCBreweryDAO implements BreweryDAO {
	
//	ArrayList<Brewery> brewery = new ArrayList<>(); 
	private JdbcTemplate jdbcTemplate; 
	
	@Autowired
	public JDBCBreweryDAO(DataSource dataSource) { 
		this.jdbcTemplate = new JdbcTemplate(dataSource); 
	} 
	
	@Override
	public List<Brewery> getAllBreweries() { 

		List<Brewery> breweries = new ArrayList<>(); 
		
		String sqlGetAllBreweries = "SELECT * FROM brewery ORDER BY breweryname";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllBreweries); 
		
		while(results.next()) {
			Brewery theBrewery = mapRowToBrewery(results); 
			breweries.add(theBrewery); 	
		}
		return breweries;
	}

	@Override
	public Brewery getBreweryByCode(Long id) {
	Brewery brewery = null; 
	String sqlSelectBreweryById = "SELECT * FROM brewery WHERE brewery_id = ?"; 
	SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectBreweryById, id); 
	
	if(results.next()) {
		brewery = mapRowToBrewery(results); 
		}
		return brewery;
	}
	
	@Override
	public void addABrewery(Brewery brewery) { 
		String sqladdABrewery = "INSERT INTO brewery " 
		    + "(brewery_id, breweryname, address1, address2, city, district, postalcode, country, phonenumber, webaddress, imagepath, user_image_upload, brewerydescription)"
		    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?); ";
		Long id = getNextBreweryId();
		brewery.setId(id);
		
		jdbcTemplate.update(sqladdABrewery, id, brewery.getBreweryName(), brewery.getAddress1(), brewery.getAddress2(), brewery.getCity(), brewery.getDistrict(), brewery.getPostalCode(), 
				brewery.getCountry(), brewery.getPhoneNumber(), brewery.getWebAddress(), brewery.getImagePath(), brewery.isUserImageUpload(), brewery.getBreweryDescription());
	}
	
	@Override
	public void addBreweryLogo(Long id, String imagePath) {
		String sqladdBreweryLogo = "UPDATE brewery SET imagepath = ?, user_image_upload = true WHERE brewery_id = ?";
			
		jdbcTemplate.update(sqladdBreweryLogo, imagePath, id);
	}
	
	@Override
	public void updateBrewery(Brewery brewery) {
		String sqlUpdateBrewery = "UPDATE brewery SET "
				 + "breweryname = ?, address1 = ?, address2 = ?, city = ?, district = ?, postalcode = ?, phonenumber = ?, webaddress = ?, brewerydescription = ?"
				    + " WHERE brewery_id = ?; ";
		jdbcTemplate.update(sqlUpdateBrewery, brewery.getBreweryName(), brewery.getAddress1(), brewery.getAddress2(), brewery.getCity(), brewery.getDistrict(), brewery.getPostalCode(), 
				brewery.getPhoneNumber(), brewery.getWebAddress(), brewery.getBreweryDescription(), brewery.getId());
	}
	
	private Brewery mapRowToBrewery(SqlRowSet results) {
		Brewery theBrewery;
		theBrewery = new Brewery(); 
		theBrewery.setId(results.getLong("brewery_id"));
		theBrewery.setBreweryName(results.getString("breweryname"));
		theBrewery.setAddress1(results.getString("address1"));
		theBrewery.setAddress2(results.getString("address2"));
		theBrewery.setCity(results.getString("city"));
		theBrewery.setDistrict(results.getString("district"));
		theBrewery.setPostalCode(results.getString("postalcode"));
		theBrewery.setCountry(results.getString("country"));
		theBrewery.setPhoneNumber(results.getString("phonenumber"));
		theBrewery.setWebAddress(results.getString("webaddress"));
		theBrewery.setImagePath(results.getString("imagepath"));
		theBrewery.setIsUserImageUpload(results.getBoolean("user_image_upload"));
		theBrewery.setBreweryDescription(results.getString("brewerydescription"));
		return theBrewery; 
	}
	
	private long getNextBreweryId() {
		SqlRowSet nextIdResult = jdbcTemplate.queryForRowSet("SELECT nextval('brewery_brewery_id_seq')");
		Long id = null;
		if(nextIdResult.next()) {
			id = nextIdResult.getLong(1);
		} else {
			throw new RuntimeException("Something went wrong while getting an id for the new brewery");
		}
		return id;
	}

}
