package com.vaps.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("members")
public class Home {
	public static HttpSession session;
	
	//메인페이지
	@RequestMapping(value = "/")
	public String home() {
		return "home";
	}

	//No mapping found for HTTP request with URI [/favicon.ico] solution
	@RequestMapping(value = "/favicon.ico")
	public void favicon(HttpServletResponse reponse ) {
		try {
			reponse.sendRedirect("/images/favicon.ico");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
