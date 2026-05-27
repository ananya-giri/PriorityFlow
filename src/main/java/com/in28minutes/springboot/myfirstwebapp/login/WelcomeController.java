package com.in28minutes.springboot.myfirstwebapp.login;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WelcomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String gotoWelcomePage(HttpSession session) {
		String username = (String) session.getAttribute("name");
		if (username == null) {
			return "redirect:login";
		}
		return "welcome";
	}
}
