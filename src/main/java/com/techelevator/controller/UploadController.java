package com.techelevator.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.beer.BeerDao;
import com.techelevator.brewery.Brewery;
import com.techelevator.brewery.BreweryDAO;

@Controller
public class UploadController {

	@Autowired
	ServletContext servletContext;
	
	@Autowired 
	private BreweryDAO breweryDAO;
	
	@Autowired
	private BeerDao beerDao;
	
	//-----------------ATTEMPT AT ADDING ALERT BOXES IF DUPLICATE ENTRIES------------//

//	@RequestMapping(path = "/addABrewery", method = RequestMethod.POST)
//	public String addABrewery(@Valid @ModelAttribute Brewery brewery, 
//			BindingResult result, RedirectAttributes attr) {   //  may have to add this?? HttpSession session
////		session.setAttribute("brewery", brewery);			may be needed to upload the image o next page?
//		
////		breweryDAO.getAllBreweries();		added as start if needed to check for duplicates
//		
//		if (result.hasErrors()) {
//			return "/addABrewery";
//		}
//		
//		try {
//			breweryDAO.addABrewery(brewery);
//			attr.addFlashAttribute(brewery);
//			return "redirect:/upload";
//		} catch (Exception e) {
//		     JOptionPane.showMessageDialog(null, "That brewery already exists, so it was not added"); 
//
////		     JOptionPane.showMessageDialog(null, "That brewery already exists, so it was not added", "Warning", JOptionPane.PLAIN_MESSAGE); 
//
////		     JOptionPane.showMessageDialog(null, "alert", "alert", JOptionPane.ERROR_MESSAGE); 
////			JOptionPane.showMessageDialog(null,
////				    "That brewery already exists",
////				    "ERROR",
////				    JOptionPane.WARNING_MESSAGE);
//			return "redirect:/addABrewery";
//		}
//	}
//	

	/* -----FILE UPLOAD PAGE----- */
	@RequestMapping(path="/upload", method=RequestMethod.GET)
	public String showUploadForm() {		
		return "uploadForm";
	}
	
	@RequestMapping(path="/uploadFile", method=RequestMethod.POST) 
	public String handleFileUpload(@RequestParam MultipartFile file, ModelMap map, 
				@RequestParam(required=false) Long breweryId, 
				@RequestParam(required=false) Long beerId) {
		
		File imagePath = getImageFilePath();
		
	//-------------------IF BEER ID IS PRESENT----------//
		if (beerId != null) { 
			String imageName = imagePath + File.separator + beerId;  
			
			if (file.isEmpty()) {
				map.addAttribute("message", "File Object empty");
			} else {
				createImage(file, imageName);
				beerDao.addBeerLogo(beerId, String.valueOf(beerId));
			}
			map.addAttribute("message", "uploaded to: " + imageName);
			
			return "redirect:/addABeerConfirm";
			
		} else {
	//---------------IF BEER ID IS NOT PRESENT (so it's a brewery)--------//
			String imageName = imagePath + File.separator + breweryId;  
			
			if (file.isEmpty()) {
				map.addAttribute("message", "File Object empty");
			} else {
				createImage(file, imageName);
				breweryDAO.addBreweryLogo(breweryId, String.valueOf(breweryId)); 
			}
			map.addAttribute("message", "uploaded to: " + imageName);
			
			return "redirect:/addABreweryConfirm";
		}	
	}
	
	@RequestMapping(path="/{imageName}", method=RequestMethod.GET)  //removed /image
	@ResponseBody
	public byte[] getImage(@PathVariable(value="imageName") String imageName) {
		String imagePath = getServerContextPath() + File.separator + imageName;
		File image = new File(imagePath);
		try {
			return Files.readAllBytes(image.toPath());
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	private File getImageFilePath() {
		String serverPath = getServerContextPath();
		File filePath = new File(serverPath);
		if (!filePath.exists()) {
			filePath.mkdirs();
		}
		return filePath;
	}
	
	private String getServerContextPath() {
		return servletContext.getRealPath("/") + "uploads";
	}
	
	private void createImage(MultipartFile file, String name) {
		File image = new File(name);
		try (BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(image))) {
	
			stream.write(file.getBytes());
		
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
