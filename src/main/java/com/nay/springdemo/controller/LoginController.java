package com.nay.springdemo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

	@GetMapping("/showMyLoginPage")
	public String showMyLoginPage() {
		return "plain-login";
	}

	@GetMapping("/access-denied")
	public String showAccessDenied() {
		return "access-denied";
	}

	@GetMapping("/employees")
	public String showEmployee() {
		return "employee";
	}
	
	@GetMapping("/managers")
	public String showManagers() {
		return "manager";
	}
	
	@GetMapping("/admins")
	public String showAdmins() {
		return "admin";
	}
}
