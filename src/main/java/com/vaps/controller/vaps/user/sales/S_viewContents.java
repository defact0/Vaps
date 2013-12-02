package com.vaps.controller.vaps.user.sales;

import java.net.URLEncoder;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
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
public class S_viewContents {
	@Resource(name = "itemsDao")
	private ItemsDAO itemsDAO;
	
	//판매물품 내용(고객용)
	@RequestMapping(value = "/ViewItemsContent")
	public String ViewItemsContent(HttpServletRequest req, HttpServletResponse res, Model model) {
		Home.session = req.getSession();
		ItemsListAction item = new ItemsListAction(itemsDAO);
		try {
			req.setCharacterEncoding("UTF-8");
			res.setContentType("text/html;charset=UTF-8");
		String i_name=null;
		String i_num = req.getParameter("num");

			if (Home.session != null && Home.session.getAttribute("id") != "") {
				i_name = req.getParameter("str");
				model.addAttribute("ilist", item.getContents(i_name)); // 원글 보기
			}

			//쿠키 설정
			Cookie cookie = new Cookie("selectItem"+i_num, URLEncoder.encode(i_name, "UTF-8"));
			cookie.setMaxAge(60*60*24);
			 cookie.setPath("/"); 
			res.addCookie(cookie);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "sales/ViewItemsContent";

	}
}
