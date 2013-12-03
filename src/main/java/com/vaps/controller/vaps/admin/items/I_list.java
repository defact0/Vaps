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
public class I_list {
	@Resource(name = "itemsDao")
	private ItemsDAO itemsDAO;
	
	// db 업로드를 이용해 상품 이미지를 저장하고 불러올 수 있어야 한다.
	@RequestMapping(value = "/itemslist")
	public String itemslist(HttpServletRequest request, Model model) throws Exception {
		// 상품 목록
		String result = "home";

		try {
			ItemsListAction item = new ItemsListAction(itemsDAO);
			if (Home.session != null && Home.session.getAttribute("id") != "") {
				model.addAttribute("ilist", item.getItemsList());
				result = "items/itemslist";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
}
