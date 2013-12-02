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
public class S_view {
	@Resource(name = "itemsDao")
	private ItemsDAO itemsDAO;
	
	//판매물품 리스트 카테고리(고객용)
	@RequestMapping(value = "/ViewItems")
	public String ViewItems(HttpServletRequest req, HttpServletResponse res, Model model) {
		Home.session = req.getSession();
		ItemsListAction item = new ItemsListAction(itemsDAO);

		try {
			req.setCharacterEncoding("UTF-8");
			if (Home.session != null && Home.session.getAttribute("id") != "") {
				String i_category = req.getParameter("str");
				model.addAttribute("ilist", item.getCategoryContents(i_category));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "sales/ViewItems";
	}
}
