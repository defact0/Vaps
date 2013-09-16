package com.vaps.home;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.vaps.action.BoardListAction;
import com.vaps.action.ItemsListAction;
import com.vaps.bean.BoardList;
import com.vaps.bean.Items;
import com.vaps.dao.ItemsDAO;


/**
 * 일반 사용자 계정
 * 세션은 HomeController.session 으로 쓰세요
 */
@Controller
@SessionAttributes("members")
public class SalesController{
	@Resource(name = "itemsDao")
	private ItemsDAO itemsDAO;
	
	//판매물품 리스트(고객용)
	@RequestMapping(value = "/AllItems")
	public String AllItems(HttpServletRequest req, HttpServletResponse res, Model model) {
		String result = "home";

		try {
			ItemsListAction item = new ItemsListAction(itemsDAO);
			if (HomeController.session != null && HomeController.session.getAttribute("id") != "") {
				model.addAttribute("ilist", item.getItemsList());
				result = "sales/AllItems";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	//판매물품 리스트 카테고리(고객용)
	@RequestMapping(value = "/ViewItems")
	public String ViewItems(HttpServletRequest req, HttpServletResponse res, Model model) {
		HomeController.session = req.getSession();
		ItemsListAction item = new ItemsListAction(itemsDAO);

		try {
			req.setCharacterEncoding("UTF-8");
			if (HomeController.session != null && HomeController.session.getAttribute("id") != "") {
				String i_category = req.getParameter("str");
				model.addAttribute("ilist", item.getCategoryContents(i_category));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "sales/ViewItems";
	}
	//판매물품 내용(고객용)
	@RequestMapping(value = "/ViewItemsContent")
	public String ViewItemsContent(HttpServletRequest req, HttpServletResponse res, Model model) {
		HomeController.session = req.getSession();
		ItemsListAction item = new ItemsListAction(itemsDAO);
		try {
			req.setCharacterEncoding("UTF-8");
			res.setContentType("text/html;charset=UTF-8");
		String i_name=null;
		String i_num = req.getParameter("num");
			
			if (HomeController.session != null && HomeController.session.getAttribute("id") != "") {
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
//--------------------------------------------------------------
// 판매 관리 
	@RequestMapping(value = "/CartList")
	public String CartList() {
		//장바구니
		return "sales/CartList";
	}
	@RequestMapping(value = "/TodayList")
	public String TodayList(HttpServletRequest req,Model model) {
		// 오늘 본 상품 정보 받아오기
		ItemsListAction item = new ItemsListAction(itemsDAO);
		//String value = URLDecoder.decode(cookie.getValue(), "UTF-8");
		Cookie[] cookies = req.getCookies();
		String value = null;
		
		if(cookies != null){
			for(int i=0;i<cookies.length;i++){
				if(cookies[i].getName().startsWith("selectItem")){
					try {
						value = URLDecoder.decode(cookies[i].getValue(), "UTF-8");
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}
				   Items test=item.getContents(value);
				   System.out.println(test.getI_name());
					model.addAttribute("today",test );
				}
			}
		}
		//req.setAttribute("selectItem", selectItem);
		//@SessionAttributes("members") 으로 등록해서
		// model 객체를 사용하는 다른 방법도 있다.
		// jsp에서는 el식으로 ${} 똑같이 사용가능하다.
		return "sales/TodayList";
	}

}
