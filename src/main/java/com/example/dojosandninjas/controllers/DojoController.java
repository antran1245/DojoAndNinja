package com.example.dojosandninjas.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.dojosandninjas.models.Dojo;
import com.example.dojosandninjas.services.DojoService;

@Controller
public class DojoController {
	
	@Autowired
	DojoService dojoService;
	
//	Display
	@GetMapping("/")
	public String main() {
		return "redirect:/dojo";
	}
	@GetMapping("/dojo")
	public String dojos(Model model) {
		List<Dojo> dojos = dojoService.allDojo();
		model.addAttribute("dojos", dojos);
		return "/dojo/dojos.jsp";
	}
	@GetMapping("/dojo/new")
	public String newDojo(@ModelAttribute("dojo") Dojo dojo) {
		return "/dojo/newDojo.jsp";
	}
	@GetMapping("/dojo/{id}")
	public String detailDojo(@PathVariable("id") Long id, Model model) {
		Dojo dojo = dojoService.findDojo(id);
		model.addAttribute("dojo", dojo);
		return "/dojo/detailDojo.jsp";
	}
	
//	Action
	@PostMapping("/dojo/create")
	public String createDojo(@ModelAttribute("dojo") Dojo dojo, BindingResult result) {
		if(result.hasErrors()) {
			return "/dojo/newDojo.jsp";			
		}
		dojoService.saveDojo(dojo);
		return "redirect:/dojo";
	}
	
}
