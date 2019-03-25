package com.techelevator.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.beer.Beer;
import com.techelevator.beer.BeerDao;
import com.techelevator.beerreview.BeerReviewDAO;
import com.techelevator.brewery.Brewery;
import com.techelevator.brewery.BreweryDAO;
import com.techelevator.model.User;

@Controller 
public class HomeController {
	
	@Autowired 
	private BreweryDAO breweryDAO;
	
	@Autowired 
	private BeerDao beerDao; 
	
	@Autowired
	private BeerReviewDAO reviewDao; 
	
	@RequestMapping(path= {"","/","/home","/homePage"}, method=RequestMethod.GET)
	public String displayHomePage() {
		return "homePage"; 
	}
	
	@RequestMapping(path = "/breweryList", method=RequestMethod.GET)
	public String displayBreweryList(ModelMap map) {
		List<Brewery> breweries = breweryDAO.getAllBreweries();
		map.addAttribute("breweries", breweries);
		return "breweryList";
	}

	@RequestMapping(path = "/addABrewery", method = RequestMethod.GET)
	public String showAddABreweryForm(HttpSession session, Model model, User user) {
		
		if(session.getAttribute("currentUser") != null) {
			user = (User) session.getAttribute("currentUser");
		}		
		if(user.getRole() == null || !user.getRole().equals("admin") ) {
            return "redirect:/login";
        }
		if (!model.containsAttribute("addABrewery")) {
			model.addAttribute("addABrewery", new Brewery());
		}
		return "addABrewery";
	}

	@RequestMapping(path = "/addABrewery", method = RequestMethod.POST)
	public String addABrewery(@Valid @ModelAttribute("addABrewery") Brewery brewery, 
			BindingResult result, RedirectAttributes attr ) {
		
		if (result.hasErrors()) {
			return "/addABrewery";
		}
		try {
			breweryDAO.addABrewery(brewery);
			attr.addFlashAttribute("brewery", brewery);
			return "redirect:/upload";
		}catch (Exception e) {
			return "duplicateBrewery";
		}
	}
	
	@RequestMapping(path="/duplicateBrewery", method=RequestMethod.GET)
	public String showDuplicateBreweryPage() {
		return "duplicateBrewery";
	}
	
	@RequestMapping(path = "/breweryDetail", method = RequestMethod.GET)
	public String getBreweryDetailsPage(@RequestParam Long id, HttpServletRequest request, ModelMap map) {
		
		map.addAttribute("id", id); 
		request.setAttribute("brewery", breweryDAO.getBreweryByCode(id));
		request.setAttribute("allbeers", beerDao.getAllBeersByBreweryId(id));
		request.setAttribute("beerReview", reviewDao.getBestBeerReviews());
		
		return "/breweryDetail"; 
	}
	
	@RequestMapping(path = "/beerDetail", method = RequestMethod.GET)
	public String getBeerDetailsPage(@RequestParam Long id, HttpServletRequest request, ModelMap map) {
		
		map.addAttribute("id", id); 
//		request.setAttribute("brewery", breweryDAO.getBreweryByCode(id));
		request.setAttribute("beer", beerDao.getBeerDetailByBeerId(id));
		request.setAttribute("beerReview", reviewDao.getBestBeerReviews());
		
		return "/beerDetail"; 
	}
	
	@RequestMapping(path="/addABeer", method = RequestMethod.GET)
	public String addABeerForm(Model model, HttpSession session, User user, @RequestParam String breweryId,
			HttpServletRequest request) {
			
		if(session.getAttribute("currentUser") != null) {
			user = (User) session.getAttribute("currentUser");
		}		
		if(user.getRole() == null || !user.getRole().equals("brewer") && !user.getRole().equals("admin")) {
            return "redirect:/login";
        }
		if (!model.containsAttribute("addABeer")) {
			model.addAttribute("addABeer", new Beer());
		}
		request.setAttribute("breweryId", breweryId);
		return "addABeer";
	}
	
	@RequestMapping(path = "/addABeer", method = RequestMethod.POST)
	public String addABeer(@Valid @ModelAttribute("addABeer") Beer beer, 
			BindingResult result, RedirectAttributes attr) {
		if (result.hasErrors()) {
			return "/addABeer";
		}
		try {
			beerDao.addABeer(beer);
			attr.addFlashAttribute("beer", beer);
			return "redirect:/upload";
		}catch (Exception e) {
			return "duplicateBeer";
		}
	}

	@RequestMapping(path = "/deleteABeer", method = RequestMethod.POST)
	 public String beerADelete(@RequestParam Long beerId, @RequestParam Long breweryId) {
		beerDao.deleteABeer(beerId);
		return "redirect:/breweryDetail?id=" + breweryId;
	}
	
	@RequestMapping(path = "/updateBrewery", method = RequestMethod.GET)
	public String updateBreweryForm(@RequestParam Long breweryId, HttpServletRequest request) {
		request.setAttribute("brewery", breweryDAO.getBreweryByCode(breweryId));
		return "updateBrewery";
	}
	
	@RequestMapping(path = "/updateBrewery", method = RequestMethod.POST)
	public String updateAndReturnToBreweryDetail(@Valid @ModelAttribute("brewery") Brewery brewery, 
			BindingResult breweryTmp, RedirectAttributes attr) {
		if (breweryTmp.hasErrors()) {
			return "/updateBrewery";
		}
		breweryDAO.updateBrewery(brewery);
		attr.addFlashAttribute("brewery", brewery);
		return "redirect:/upload";
	}
	
	@RequestMapping(path = "/addABeerConfirm", method = RequestMethod.GET)
	public String showAddABeerConfirmPage () {
		return "addABeerConfirm";
	}
	
	@RequestMapping(path = "/addABreweryConfirm", method = RequestMethod.GET)
	public String showAddABreweryConfirmPage () {
		return "addABreweryConfirm";
	}
	
}
