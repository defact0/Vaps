package com.vaps.controller.vaps.admin.notice;

import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.vaps.action.NoticeListAction;
import com.vaps.dao.NoticeDAO;

@Controller
@SessionAttributes("members")
public class N_del {
	@Resource(name = "noticeDao")
	private NoticeDAO noticeDao;
	
	private HttpSession session;
	
	@RequestMapping(value = "/noticeDel")
	public void boardDelContent(HttpServletRequest req, HttpServletResponse res, Model model) {
		session = req.getSession();
		NoticeListAction notice = new NoticeListAction(noticeDao);
		try {
			res.setContentType("text/html;charset=UTF-8");
			PrintWriter out = res.getWriter();
			int idx = (Integer) session.getAttribute("idx");
			String id = (String) req.getParameter("id");

			if (session != null && session.getAttribute("id") != "") {
				if (id.equals((String) session.getAttribute("id"))
						|| (Integer) session.getAttribute("auth") == 1) {
					if (notice.delContents(idx) == 1) {
						out.println("<script>");
						out.println("location.href='/board'");
						out.println("</script>");
					}
				} else {
					out.println("<script>");
					out.println("alert('게시글 삭제 실패')");
					out.println("location.href='/notice'");
					out.println("</script>");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
