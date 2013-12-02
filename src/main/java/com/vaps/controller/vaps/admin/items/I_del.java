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
import com.vaps.controller.Home;
import com.vaps.dao.ItemsDAO;


@Controller
@SessionAttributes("members")
public class I_del {
	@Resource(name = "itemsDao")
	private ItemsDAO itemsDAO;
	
	// 물품 삭제
	@RequestMapping(value = "/itemsDelContent")
	public void boardDelContent(HttpServletRequest req, HttpServletResponse res, Model model) {
		ItemsListAction item = new ItemsListAction(itemsDAO);
		try {
			res.setContentType("text/html;charset=UTF-8"); // 한글처리코드
			PrintWriter out = res.getWriter();
			String str = (String) req.getParameter("str");  

			if (Home.session != null && Home.session.getAttribute("id") != "") {
					if (item.delContents(str) == 1) {// 게시글 삭제 쿼리 들어가기
						// 페이지 이동, 성공
						out.println("<script>");
						out.println("location.href='/itemslist'");
						out.println("</script>");
					}
				} else {
					// 페이지 이동, 실패
					out.println("<script>");
					out.println("alert('상품 삭제 실패')");
					out.println("location.href='/itemslist'");
					out.println("</script>");
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
