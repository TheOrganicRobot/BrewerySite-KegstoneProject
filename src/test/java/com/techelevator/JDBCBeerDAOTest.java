package com.techelevator;

import java.util.List;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import com.techelevator.beer.Beer;
import com.techelevator.beer.JDBCBeerDao;



public class JDBCBeerDAOTest extends DAOIntegrationTest {
	
	private JDBCBeerDao beerDAO;
	private JdbcTemplate template;
	private String sql;

	@Before
	public void setup() {
		beerDAO = new JDBCBeerDao(super.getDataSource());
		this.template = new JdbcTemplate(super.getDataSource());
		sql = "DELETE FROM beer";
		template.update(sql);
	}

	@Test
	public void get_all_beers() {
		JdbcTemplate template = new JdbcTemplate(super.getDataSource());
		String insertDummyBeer = "INSERT INTO beer "
				+ "(beer_id, brewery_id, beername, beertype, abv, flavor, color, aroma, beerdescription, imagepath)"
				+ "VALUES (1, 1, 'beer1', 'type1', '25.00%', 'good', 'red', 'stinks', 'really good beer', 'https://testwebaddr1/') ";
		template.update(insertDummyBeer);

		String insertDummyBeer1 = "INSERT INTO beer "
				+ "(beer_id, brewery_id, beername, beertype, abv, flavor, color, aroma, beerdescription, imagepath)"
				+ "VALUES (2, 1, 'beer2', 'type2', '25.00%', 'good', 'red', 'stinks', 'really good beer', 'https://testwebaddr1/') ";
		template.update(insertDummyBeer1);

		// imported Beer right here ...
		long brewery_id = 1L;
		List<Beer> testBeer = beerDAO.getAllBeersByBreweryId(brewery_id);
		Assert.assertTrue(testBeer.size() == 2);
	}

	@Test
	public void add_new_beer() {
		Beer beer = new Beer();
		beer.setBrewery_id(1L);
		beer.setBeerName("beer1");
		beer.setBeerType("type1");
		beer.setAbv("12.00%");
		beer.setFlavor("good");
		beer.setColor("pale");
		beer.setAroma("stinky");
		beer.setBeerDescription("this is the beer description");
		beer.setImagePath("this is the image path :/");

		beerDAO.addABeer(beer);
		List<Beer> testBeer = beerDAO.getAllBeersByBreweryId(beer.getBrewery_id());
		Assert.assertTrue(testBeer.size() == 1);   
	}
	
	@Test
	public void delete_a_beer() {
		JdbcTemplate template = new JdbcTemplate(super.getDataSource());
		String insertDummyBeer = "INSERT INTO beer "
				+ "(beer_id, brewery_id, beername, beertype, abv, flavor, color, aroma, beerdescription, imagepath)"
				+ "VALUES (1, 1, 'beer1', 'type1', '25.00%', 'good', 'red', 'stinks', 'really good beer', 'https://testwebaddr1/') ";
		template.update(insertDummyBeer);

		String insertDummyBeer1 = "INSERT INTO beer "
				+ "(beer_id, brewery_id, beername, beertype, abv, flavor, color, aroma, beerdescription, imagepath)"
				+ "VALUES (2, 1, 'beer2', 'type2', '25.00%', 'good', 'red', 'stinks', 'really good beer', 'https://testwebaddr1/') ";
		template.update(insertDummyBeer1);

		beerDAO.deleteABeer(1L);
		
		// imported Beer right here ...
		long brewery_id = 1L;
		List<Beer> testBeer = beerDAO.getAllBeersByBreweryId(brewery_id);
		Assert.assertTrue(testBeer.size() == 1);
		Beer beer = testBeer.get(0);
		Assert.assertEquals("beer2", beer.getBeerName());
		
	}
	
	@Test
	public void get_beer_detail() {
		JdbcTemplate template = new JdbcTemplate(super.getDataSource());
		String insertDummyBeer = "INSERT INTO beer "
				+ "(beer_id, brewery_id, beername, beertype, abv, flavor, color, aroma, beerdescription, imagepath)"
				+ "VALUES (1, 1, 'beer1', 'type1', '25.00%', 'good', 'red', 'stinks', 'really good beer', 'https://testwebaddr1/') ";
		template.update(insertDummyBeer);

		String insertDummyBeer1 = "INSERT INTO beer "
				+ "(beer_id, brewery_id, beername, beertype, abv, flavor, color, aroma, beerdescription, imagepath)"
				+ "VALUES (2, 1, 'beer2', 'type2', '25.00%', 'good', 'red', 'stinks', 'really good beer', 'https://testwebaddr1/') ";
		template.update(insertDummyBeer1);

		Beer beer = beerDAO.getBeerDetailByBeerId(2L);
		Assert.assertEquals(2, beer.getId());
		Assert.assertEquals("beer2", beer.getBeerName());
	
	}

}

