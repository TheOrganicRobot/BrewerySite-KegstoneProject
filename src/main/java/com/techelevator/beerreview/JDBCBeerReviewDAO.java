package com.techelevator.beerreview;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCBeerReviewDAO implements BeerReviewDAO {
	
	private JdbcTemplate template; 
	
	@Autowired
	public JDBCBeerReviewDAO(DataSource dataSource) {
		this.template = new JdbcTemplate(dataSource);
	}

	@Override
	public List<BeerReview> getBeerReview() {
			
		List<BeerReview> allReviews = new ArrayList<>();
		String sqlSelectAllReviews = "SELECT * FROM review ORDER BY review_date desc";
		SqlRowSet results = template.queryForRowSet(sqlSelectAllReviews);
		while(results.next()) {
				BeerReview review = new BeerReview();
				review.setId(results.getLong("review_id"));
				review.setBeerId(results.getLong("beer_id"));
				review.setUserName(results.getString("username"));
				review.setTitle(results.getString("title"));
				review.setRating(results.getInt("rating"));
				review.setDateSubmitted(results.getTimestamp("review_date").toLocalDateTime());
				review.setReview(results.getString("review"));
				
				allReviews.add(review);
			}
			return allReviews;
	}
	
	@Override
	public List<BeerReview> getBestBeerReviews() {
			
		List<BeerReview> allReviews = new ArrayList<>();
		String sqlSelectAllReviews = "SELECT TRUNC(AVG(rating))::int as rating, beer_id FROM review GROUP BY beer_id ORDER BY rating desc ";
		SqlRowSet results = template.queryForRowSet(sqlSelectAllReviews);
		while(results.next()) {
				BeerReview review = new BeerReview();
				review.setBeerId(results.getLong("beer_id"));
				review.setRating(results.getInt("rating"));
				allReviews.add(review);
			}
			return allReviews;
	}
	
	@Override
	public void saveBeerReviews(BeerReview review) {
		Long id = getNextId();
		review.setId(id);
		
		String sqlInsertReview = "INSERT INTO review(review_id, beer_id, username, title, rating, review_date, review) VALUES (?, ?, ?, ?, ?, ?, ?)";
//		Long reviewBeerId = getBeerIdForReview(review.getBeerName());
		template.update(sqlInsertReview, id, review.getBeerId(), review.getUserName(),  review.getTitle(), review.getRating(), 
		review.getDateSubmitted(), review.getReview());
	}

	private Long getNextId() {
		String sqlSelectNextId = "SELECT NEXTVAL('review_review_id_seq')";
		SqlRowSet results = template.queryForRowSet(sqlSelectNextId);
		Long id = null;
		if(results.next()) {
			id = results.getLong(1);
		} else {
			throw new RuntimeException("Something strange happened, unable to select next forum post id from sequence");
		}
		return id;
	}

	private Long getBeerIdForReview(String beerName) {
		String sqlNextBeerId = "Select id from beer where beername = ?";
		SqlRowSet result = template.queryForRowSet(sqlNextBeerId, beerName);
		Long beerId = null;
		if (result.next()) {
			beerId = result.getLong("id");
		}
		return beerId;
	}
	
}
