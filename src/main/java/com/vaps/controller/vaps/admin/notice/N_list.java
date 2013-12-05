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
public class N_list {
	@Resource(name = "noticeDao")
	private NoticeDAO noticeDao;
	
	private HttpSession session;
	
	@RequestMapping(value = "/notice")
	public String bList(HttpServletRequest request, Model model) {
		String result = "home";
		session = request.getSession();

		try {
			NoticeListAction notice = new NoticeListAction(noticeDao);

			if (session != null && session.getAttribute("id") != "") {
				session = request.getSession();
				int pageNum = (request.getParameter("pageNum") != null) ? Integer.parseInt(request.getParameter("pageNum")) : 1;
				 
				// paging 관련 로직
				model.addAttribute("pageNum", pageNum);
				model.addAttribute("nlist", notice.getList(pageNum));
				model.addAttribute("paging", notice.getPaging(pageNum));

				result = "vaps/admin/notice/n_list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
