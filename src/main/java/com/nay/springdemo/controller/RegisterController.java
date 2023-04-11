package com.nay.springdemo.controller;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.logging.Logger;

import javax.annotation.PostConstruct;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nay.springdemo.entity.User;
import com.nay.springdemo.service.UserService;
import com.nay.springdemo.user.CrmUser;

@Controller
@RequestMapping("/register")
public class RegisterController {

	@Autowired
	private UserService userService;
	
	private Map<String,String> role;

	private Logger logger = Logger.getLogger(getClass().getName());
	
	@PostConstruct
	public void dataload() {
		role=new LinkedHashMap<>();
		role.put("ROLE_EMPLOYEE","Employee");
		role.put("ROLE_MANAGER","Manager");
		role.put("ROLE_ADMIN","ADMIN");
		
	}

	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {

		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);

		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}

	@GetMapping("/showRegistrationForm")
	public String showRegistration(Model model) {

		model.addAttribute("crmUser", new CrmUser());
		model.addAttribute("roles",role);
		return "registration-form";
	}

	@PostMapping("/processRegistrationForm")
	public String processRegistration(@Valid @ModelAttribute("crmUser") CrmUser crmUser, BindingResult bindingResult,
			Model model) {
		String userName = crmUser.getUserName();
		logger.info("Processing registration form for: " + userName);
		logger.info("Processing registration form for: " + crmUser.getGetRole());
		if (bindingResult.hasErrors()) {
			model.addAttribute("roles",role);
			return "registration-form";
		}
		// check the database if user already exists
		User existing = userService.findByUserName(userName);
		if (existing != null) {
			model.addAttribute("crmUser", new CrmUser());
			model.addAttribute("roles",role);
			model.addAttribute("registrationError", "User name already exists.");

			logger.warning("User name already exists.");
			return "registration-form";
		}
		userService.save(crmUser);

		logger.info("Successfully created user: " + userName);

		return "registration-confirmation";

	}

}
