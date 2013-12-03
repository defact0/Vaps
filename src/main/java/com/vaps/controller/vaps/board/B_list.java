package com.vaps.controller.vaps.board;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.vaps.action.BoardListAction;
import com.vaps.dao.MembersDAO;


@Controller
@SessionAttributes("members")
public class B_list {
	@Resource(name = "membersDao")
	private MembersDAO membersDao;
	
	private HttpSession session;
	
	@RequestMapping(value = "/board")
	public String bList(HttpServletRequest request, Model model) {
		String result = "home";
		session = request.getSession();

		try {
			BoardListAction ba = new BoardListAction(membersDao);

			if (session != null && session.getAttribute("id") != "") {
				session = request.getSession();
				int pageNum = (request.getParameter("pageNum") != null) ? Integer.parseInt(request.getParameter("pageNum")) : 1;

				// paging 관련 로직
				model.addAttribute("pageNum", pageNum);
				model.addAttribute("blist", ba.getBoardList(pageNum)); // 게시글
				model.addAttribute("paging", ba.getPaging(pageNum)); // [1][2]...<-paging
				result = "vaps/board/b_list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
