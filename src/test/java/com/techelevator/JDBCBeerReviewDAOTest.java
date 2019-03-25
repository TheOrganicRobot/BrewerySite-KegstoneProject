package com.techelevator;

import java.util.List;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import com.techelevator.beerreview.BeerReview;
import com.techelevator.beerreview.JDBCBeerReviewDAO;

public class JDBCBeerReviewDAOTest extends DAOIntegrationTest {
	
	private JDBCBeerReviewDAO  beerReviewDao; 
	private JdbcTemplate template; 
	private String sql; 
	
	
	@Before
	public void setup() {
		beerReviewDao = new JDBCBeerReviewDAO(super.getDataSource());
		this.template = new JdbcTemplate(super.getDataSource());
		sql = "DELETE FROM review";
		template.update(sql);
	}
	
	@Test
	public void get_all_review() {
		JdbcTemplate template = new JdbcTemplate(super.getDataSource());
		String insertDummyBeer = "INSERT into review (review_id, beer_id, username, title, review, rating , review_date)"
				+ " VALUES ( 2 , 2 , 'Mona', 'Love it', 'great beer', '4', '2018-12-16 12:12:00') "; 
			
		template.update(insertDummyBeer);
		
		
		String insertDummyBeer1 = "INSERT into review (review_id, beer_id, username, title, review, rating , review_date)"
				+ " VALUES ( 3 , 3 , 'Tim', 'Hate it', 'Terrible beer', '1', '2018-11-17 11:11:00') "; 
			
		template.update(insertDummyBeer1);
		
		List<BeerReview> testBeerReview = beerReviewDao.getBeerReview();
		Assert.assertTrue(testBeerReview.size() == 2);

	}
	

}
