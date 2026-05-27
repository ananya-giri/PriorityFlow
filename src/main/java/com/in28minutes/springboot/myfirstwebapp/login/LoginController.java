package com.in28minutes.springboot.myfirstwebapp.login;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {	

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String gotoLoginPage(@RequestParam(required = false) String error, ModelMap model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null && auth.isAuthenticated() && !(auth instanceof AnonymousAuthenticationToken)) {
			return "redirect:/";
		}
		if (error != null) {
			model.put("errorMessage", "Invalid Credentials! Please try again.");
		}
		return "login";
	}
}
