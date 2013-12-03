package com.vaps.controller.vaps.user.sales;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
public class S_all {
	@Resource(name = "itemsDao")
	private ItemsDAO itemsDAO;
	private HttpSession session;
	
	//판매물품 리스트(고객용)
	@RequestMapping(value = "/AllItems")
	public String AllItems(HttpServletRequest request, HttpServletResponse res, Model model) {
		String result = "home";
		session = request.getSession();

		try {
			ItemsListAction item = new ItemsListAction(itemsDAO);
			if (session != null && session.getAttribute("id") != "") {
				model.addAttribute("ilist", item.getItemsList());
				result = "vaps/user/sales/sale_all";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
}
