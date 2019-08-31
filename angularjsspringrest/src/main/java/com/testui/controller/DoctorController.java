package com.testui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DoctorController {

	@GetMapping("doctor")
	public String doctors() {
		return "doctors";
	}
	
	@GetMapping("doctorSearch")
	public String doctorSearch() {
		return "doc_search_edit";
	}
	
}
