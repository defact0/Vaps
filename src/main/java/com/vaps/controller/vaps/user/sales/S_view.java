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
public class S_view {
	@Resource(name = "itemsDao")
	private ItemsDAO itemsDAO;
	private HttpSession session;
	
	//판매물품 리스트 카테고리(고객용)
	@RequestMapping(value = "/ViewItems")
	public String ViewItems(HttpServletRequest request, HttpServletResponse res, Model model) {
		session = request.getSession();
		ItemsListAction item = new ItemsListAction(itemsDAO);

		try {
			request.setCharacterEncoding("UTF-8");
			if (session != null && session.getAttribute("id") != "") {
				String i_category = request.getParameter("str");
				model.addAttribute("ilist", item.getCategoryContents(i_category));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "vaps/user/sales/sale_view";
	}
}
