package com.vaps.controller.vaps.admin.items;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.vaps.action.ItemsListAction;
import com.vaps.controller.Home;
import com.vaps.dao.ItemsDAO;


@Controller
@SessionAttributes("members")
public class I_contents {
	@Resource(name = "itemsDao")
	private ItemsDAO itemsDAO;
	
	@RequestMapping(value = "/itemsContentsForm")
	public String itemsContentsForm(HttpServletRequest request, Model model) {
		// 상품 상세 보기
		Home.session = request.getSession();
		ItemsListAction item = new ItemsListAction(itemsDAO);
		try {
			request.setCharacterEncoding("UTF-8");
			if (Home.session != null && Home.session.getAttribute("id") != "") {
				String i_name = request.getParameter("str");
				model.addAttribute("ilist", item.getContents(i_name)); // 원글 보기
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "items/itemsContent";
	}
}
