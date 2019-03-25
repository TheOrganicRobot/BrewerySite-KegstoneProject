
package com.techelevator;

import java.util.List;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import com.techelevator.beer.JDBCBeerDao;
import com.techelevator.brewery.Brewery;
import com.techelevator.brewery.JDBCBreweryDAO;

public class JDBCBreweryDAOTest extends DAOIntegrationTest {

	private JDBCBreweryDAO breweryDAO;
	private JdbcTemplate template;
	private String sql;

	@Before
	public void setup() {
		breweryDAO = new JDBCBreweryDAO(super.getDataSource());
		this.template = new JdbcTemplate(super.getDataSource());
		sql = "DELETE FROM review";
		template.update(sql);
		sql = "DELETE FROM beer";
		template.update(sql);
		sql = "DELETE FROM brewery";
		template.update(sql);
	}

	@Test
	public void get_all_breweries() {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(super.getDataSource());
		String insertDummyBrew = "INSERT INTO brewery "
				+ "(brewery_id, breweryname, address1, address2, city, district, postalcode, country, phonenumber, webaddress, user_image_upload, brewerydescription)"
				+ "VALUES (1, 'billsbrews', '123 billblvd', 'none', 'columbus', 'ohio', '43017', 'usa', '6368374827', 'https://testwebaddr1/', 'true', 'its got great beer') ";
		jdbcTemplate.update(insertDummyBrew);

		String insertDummyBrew1 = "INSERT INTO brewery "
				+ "(brewery_id, breweryname, address1, address2, city, district, postalcode, country, phonenumber, webaddress, user_image_upload, brewerydescription)"
				+ "VALUES (2, 'billsbrews2', '456 billblvd', 'none', 'columbus', 'ohio', '43017', 'usa', '6368374827', 'https://testwebaddr2/', 'true', 'its got great beer') ";
		jdbcTemplate.update(insertDummyBrew1);

		// imported Brewery right here ...
		List<Brewery> testBrewery = breweryDAO.getAllBreweries();
		Assert.assertTrue(testBrewery.size() == 2);
	}


	@Test
	public void add_new_brewery() {
		Brewery brew = new Brewery();
		brew.setBreweryName("Laguanitas");
		brew.setAddress1("123 Main");
		brew.setAddress2(" ");
		brew.setCity("Columbus");
		brew.setDistrict("Ohio");
		brew.setPostalCode("43214");
		brew.setPhoneNumber("6148888888");
		brew.setWebAddress("https://testbrew10/");
		brew.setCountry("USA");
		brew.setImagePath("img/techelevator_logo.jpg");
		brew.setIsUserImageUpload(false);
		brew.setBreweryDescription("Yummy");

		breweryDAO.addABrewery(brew);
		List<Brewery> testBrewery = breweryDAO.getAllBreweries();
		Assert.assertTrue(testBrewery.size() == 1);
     
	}
	
	
}