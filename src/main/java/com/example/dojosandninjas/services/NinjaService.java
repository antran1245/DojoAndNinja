package com.example.dojosandninjas.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dojosandninjas.models.Ninja;
import com.example.dojosandninjas.repositories.NinjaRepo;

@Service
public class NinjaService {
	@Autowired
	private NinjaRepo ninjaRepo;
	
//	create/update
	public Ninja saveNinja(Ninja ninja) {
		return ninjaRepo.save(ninja);
	}
	
//	find all ninjas
	public List<Ninja> allNinja() {
		return ninjaRepo.findAll();
	}
	
//	findby one
	public Ninja findNinja(Long id) {
		return ninjaRepo.findById(id).orElse(null);
	}

//	delete
	public void deleteNinja(Long id) {
		ninjaRepo.deleteById(id);
	}
}
