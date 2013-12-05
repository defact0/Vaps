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
import com.vaps.bean.NoticeList;
import com.vaps.dao.NoticeDAO;

@Controller
@SessionAttributes("members")
public class N_write {
	@Resource(name = "noticeDao")
	private NoticeDAO noticeDao;
	
	private HttpSession session;
	
	@RequestMapping(value = "/noticeWrite")
	public String noticeWrite() {
		return "vaps/admin/notice/n_write";
	}

	@RequestMapping(value = "/noticeWriteSet")
	public void noticeWriteSet(HttpServletRequest request, Model model, HttpServletResponse res) {
		session = request.getSession();
		try {
			request.setCharacterEncoding("UTF-8");
			NoticeListAction notice = new NoticeListAction(noticeDao);
			if (session != null && session.getAttribute("id") != "") {
				NoticeList noticeWrite = new NoticeList();
				noticeWrite.setN_id((String) session.getAttribute("id"));
				noticeWrite.setN_sub(request.getParameter("sub"));
				noticeWrite.setN_contents(request.getParameter("contents"));

				PrintWriter out = res.getWriter();
				res.setContentType("text/html;charset=UTF-8");
				if (notice.setContents(noticeWrite) == 1) {
					out.println("<script>");
					out.println("location.href='/notice'");
					out.println("</script>");
				} else {
					out.println("<script>");
					out.println("alert('게시글 쓰기 실패')");
					out.println("location.href='/'");
					out.println("</script>");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
