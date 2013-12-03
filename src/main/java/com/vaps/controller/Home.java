package com.vaps.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.vaps.action.ItemsListAction;
import com.vaps.dao.ItemsDAO;

@Controller
@SessionAttributes("members")
public class Home {
	@Resource(name = "itemsDao")
	private ItemsDAO itemsDAO;
	
	public static HttpSession session;
	
	//메인페이지
	@RequestMapping(value = "/")
	public String home(Model model) {
		ItemsListAction item = new ItemsListAction(itemsDAO);
		model.addAttribute("ranDom", item.getRandom());
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
