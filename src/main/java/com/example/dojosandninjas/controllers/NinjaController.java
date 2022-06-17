package com.example.dojosandninjas.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.dojosandninjas.models.Dojo;
import com.example.dojosandninjas.models.Ninja;
import com.example.dojosandninjas.services.DojoService;
import com.example.dojosandninjas.services.NinjaService;

@Controller
public class NinjaController {
	
	@Autowired
	NinjaService ninjaService;
	@Autowired
	DojoService dojoService;
	
//	Display
	@GetMapping("/ninjas/new")
	public String ninjas(@ModelAttribute("ninja") Ninja ninja, Model model) {
		List<Dojo> dojos = dojoService.allDojo();
		model.addAttribute("dojos", dojos);
		return "/ninja/newNinja.jsp";
	}
	
//	Actions
	@PostMapping("/ninjas/create")
	public String createNinja(@ModelAttribute("ninja") Ninja ninja, BindingResult result) {
		if(result.hasErrors()) {
			return "/ninja/newNinja.jsp";
		}
		ninjaService.saveNinja(ninja);
		return "redirect:/dojo";
	}
}
