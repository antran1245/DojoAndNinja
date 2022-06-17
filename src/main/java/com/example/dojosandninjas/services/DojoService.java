package com.example.dojosandninjas.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dojosandninjas.models.Dojo;
import com.example.dojosandninjas.repositories.DojoRepo;

@Service
public class DojoService {
	@Autowired
	private DojoRepo dojoRepo;
	
//	Get all Dojos
	public List<Dojo> allDojo() {
		return dojoRepo.findAll();
	}
	
//	Create/Update
	public Dojo saveDojo(Dojo dojo) {
		return dojoRepo.save(dojo);
	}
	
//	Find One
	public Dojo findDojo(Long id) {
		Optional<Dojo> optionalDojo = dojoRepo.findById(id);
		if(optionalDojo.isPresent()) {
			return optionalDojo.get();
		}
		return null;
	}
	
//	Delete
	public void deleteDojo(Long id) {
		dojoRepo.deleteById(id);
	}
}
