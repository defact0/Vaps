package com.vaps.controller.vaps.user.sales;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.vaps.action.ItemsListAction;
import com.vaps.controller.Home;
import com.vaps.dao.ItemsDAO;

@Controller
@SessionAttributes("members")
public class S_all {
	@Resource(name = "itemsDao")
	private ItemsDAO itemsDAO;
	
	//판매물품 리스트(고객용)
	@RequestMapping(value = "/AllItems")
	public String AllItems(HttpServletRequest req, HttpServletResponse res, Model model) {
		String result = "home";

		try {
			ItemsListAction item = new ItemsListAction(itemsDAO);
			if (Home.session != null && Home.session.getAttribute("id") != "") {
				model.addAttribute("ilist", item.getItemsList());
				result = "sales/AllItems";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
}
