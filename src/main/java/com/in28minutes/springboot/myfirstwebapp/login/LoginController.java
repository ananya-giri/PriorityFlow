package com.in28minutes.springboot.myfirstwebapp.login;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {	

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String gotoLoginPage() {
		return "login";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginUser(@RequestParam String name, HttpSession session, ModelMap model) {
		if (name == null || name.trim().isEmpty()) {
			model.put("errorMessage", "Username cannot be empty.");
			return "login";
		}
		session.setAttribute("name", name.trim());
		return "redirect:/";
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:login";
	}
}
