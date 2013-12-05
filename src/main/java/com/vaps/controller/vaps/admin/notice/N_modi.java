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
public class N_modi {
	@Resource(name = "noticeDao")
	private NoticeDAO noticeDao;
	
	private HttpSession session;
	
	@RequestMapping(value = "/noticeModi")
	public String boardModiContentForm(HttpServletRequest req, HttpServletResponse res, Model model) {
		session = req.getSession();

		res.setContentType("text/html;charset=UTF-8");
		NoticeListAction notice = new NoticeListAction(noticeDao);
		try {
			if (session != null && session.getAttribute("id") != "") {
				int idx = Integer.parseInt(req.getParameter("idx"));
				model.addAttribute("nlist", notice.getContentsModi(idx));
				session.setAttribute("idx", Integer.parseInt(req.getParameter("idx")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "vaps/admin/notice/n_modi";
	}

	@RequestMapping(value = "/noticeModiSet")
	public void boardModiContent(HttpServletRequest req,HttpServletResponse res, Model model) {
		try {
			req.setCharacterEncoding("UTF-8");
			res.setContentType("text/html;charset=UTF-8");
			
			NoticeList noticeWrite = new NoticeList();
			NoticeListAction notice = new NoticeListAction(noticeDao);
			PrintWriter out = res.getWriter();
			
			String id = (String) req.getParameter("id");

			if (session != null && session.getAttribute("id") != "") {
				if (id.equals(session.getAttribute("id"))
						|| (Integer) session.getAttribute("auth") == 1) {
					noticeWrite.setN_num((Integer) session.getAttribute("idx"));
					noticeWrite.setN_id((String) session.getAttribute("id"));
					noticeWrite.setN_sub(req.getParameter("sub"));
					noticeWrite.setN_contents(req.getParameter("contents"));

					notice.setContentsModi(noticeWrite);
					out.println("<script>");
					out.println("location.href='/notice'");
					out.println("</script>");
				} else {
					out.println("<script>");
					out.println("alert('게시글 수정 실패')");
					out.println("location.href='/'");
					out.println("</script>");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
