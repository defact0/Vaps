package com.vaps.controller.vaps.user.sales;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.vaps.action.ItemsListAction;
import com.vaps.bean.Items;
import com.vaps.controller.Home;
import com.vaps.dao.ItemsDAO;

@Controller
@SessionAttributes("members")
public class S_today {
	@Resource(name = "itemsDao")
	private ItemsDAO itemsDAO;
	
	@RequestMapping(value = "/TodayList")
	public String TodayList(HttpServletRequest req,Model model) {
		// 오늘 본 상품 정보 받아오기
		ItemsListAction item = new ItemsListAction(itemsDAO);
		Cookie[] cookies = req.getCookies();
		ArrayList<Items> today = new ArrayList<Items>();
		String value = null;

		if(cookies != null){
			for(int i=0;i<cookies.length;i++){
				if(cookies[i].getName().startsWith("selectItem")){
					try {
						value = URLDecoder.decode(cookies[i].getValue(), "UTF-8");
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}
				   today.add(item.getContents(value));
				   model.addAttribute("today",today );
				}
			}
		}
		return "sales/TodayList";
	}
}
