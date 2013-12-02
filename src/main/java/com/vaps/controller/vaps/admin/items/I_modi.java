package com.vaps.controller.vaps.admin.items;

import java.io.PrintWriter;

import javax.annotation.Resource;
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
public class I_modi {
	@Resource(name = "itemsDao")
	private ItemsDAO itemsDAO;
	
	@RequestMapping(value = "/itemsModifyForm")
	public String itemsModifyForm(HttpServletRequest req, HttpServletResponse res, Model model) {
		// 상품 정보 수정
		Home.session = req.getSession();
		ItemsListAction item = new ItemsListAction(itemsDAO);
		try {
			req.setCharacterEncoding("UTF-8");
			if (Home.session != null && Home.session.getAttribute("id") != "") {
				String i_name = req.getParameter("str");
				model.addAttribute("ilist", item.getContentsModi(i_name)); // 원글 보기
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "items/itemsModify";
	}
	@RequestMapping(value = "/itemsModify")
	public void boardModiContent(HttpServletRequest req,HttpServletResponse res, Model model) {
		try {
			// 상품 정보 수정 sql처리
			req.setCharacterEncoding("UTF-8");
			res.setContentType("text/html;charset=UTF-8"); // 한글처리코드
			PrintWriter out = res.getWriter();

			ItemsListAction item = new ItemsListAction(itemsDAO);
			Items items = new Items();

			if (Home.session != null && Home.session.getAttribute("id") != "") {

					// 상품정보 items객체에 저장, 이미지는 수정x
					items.setStr(req.getParameter("str"));
					items.setIs_name(req.getParameter("i_name"));
					items.setI_name(req.getParameter("i_name")); //상품이름
					items.setI_category(req.getParameter("i_category")); //카테고리
					items.setI_price(Integer.parseInt(req.getParameter("i_price"))); //가격
					items.setIs_count(Integer.parseInt(req.getParameter("is_count")));// 재고수량
					items.setI_description(req.getParameter("i_description"));// 설명(제품설명)
					
					item.setItemsUpdate(items); //update
					item.setItemsToredUpdate(items); //재고 등록 update
					out.println("<script>");
					out.println("location.href='/itemslist'");
					out.println("</script>");
				} else {
					out.println("<script>");
					out.println("alert('상품수정 실패')");
					out.println("location.href='/itemslist'");
					out.println("</script>");
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
