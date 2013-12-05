package com.vaps.controller.vaps.admin.notice;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.vaps.action.NoticeListAction;
import com.vaps.dao.NoticeDAO;

@Controller
@SessionAttributes("members")
public class N_content {
	@Resource(name = "noticeDao")
	private NoticeDAO noticeDao;
	
	private HttpSession session;
	
	@RequestMapping(value = "/noticeContents")
	public String bContents(HttpServletRequest request, Model model) {
		String result = "home";
		
		session = request.getSession();
		NoticeListAction notice = new NoticeListAction(noticeDao);
		try {
			if (session != null && session.getAttribute("id") != "") {
				int idx = Integer.parseInt(request.getParameter("idx"));
				notice.setUpdateCNT(idx);//조회수 증가
				model.addAttribute("nlist", notice.getContents(idx));
				model.addAttribute("user", session.getAttribute("id"));
				session.setAttribute("idx", Integer.parseInt(request.getParameter("idx"))); 
				result = "vaps/admin/notice/n_contents";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
