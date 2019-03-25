package com.techelevator.controller;


import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.beer.Beer;
import com.techelevator.beer.BeerDao;
import com.techelevator.beerreview.BeerReview;
import com.techelevator.beerreview.BeerReviewDAO;
import com.techelevator.brewery.Brewery;
import com.techelevator.brewery.BreweryDAO;

@Controller 
public class BeerLoverReviewController {
	
	@Autowired
	private BeerReviewDAO reviewDao;
	@Autowired
	private BreweryDAO breweryDAO;
	@Autowired
	private BeerDao beerDAO;
	
	@RequestMapping(path="/beerReviewInput", method = RequestMethod.GET) 
	public String getBeerReviewForm(ModelMap map, @RequestParam Long beerid) {
	
		map.addAttribute("beer", beerDAO.getBeerDetailByBeerId(beerid));
		map.addAttribute("beerReview", new BeerReview());
		return "beerReviewInput"; 
	}
	
	@RequestMapping(path="/beerReviewInput", method = RequestMethod.POST)
	public String getBeerFormResult(@Valid @ModelAttribute("beerReview") BeerReview review, BindingResult result, 
			RedirectAttributes attr, @RequestParam Long beerid) {		
		
		if(result.hasErrors()) {
			return "/beerReviewInput"; 
		}
		review.setBeerId(beerid);
		review.setDateSubmitted(LocalDateTime.now());

		reviewDao.saveBeerReviews(review);
		
		return "redirect:/beerReviewResult"; 
	}

	
	@RequestMapping("/beerReviewResult")
	public String getAllBeerReviews(HttpServletRequest request) {
		
		request.setAttribute("beerReview", reviewDao.getBeerReview());
		request.setAttribute("beer", beerDAO.getAllBeers());

		
		return "beerReviewResult";

	}
	
	@RequestMapping("/bestRatedBeers")
	public String getBestBeerReviews(HttpServletRequest request) {
		request.setAttribute("beerReview", reviewDao.getBestBeerReviews());
		request.setAttribute("beer", beerDAO.getAllBeers());

		return "bestRatedBeers"; 
	}
	
}
