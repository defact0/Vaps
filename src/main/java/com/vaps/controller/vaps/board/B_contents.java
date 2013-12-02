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
public class B_contents {
	@Resource(name = "membersDao")
	private MembersDAO membersDao;
	private HttpSession session;
	
	// 게시글 보기
	@RequestMapping(value = "/contents")
	public String bContents(HttpServletRequest request, Model model) {
		String result = "contents";
		session = request.getSession();
		BoardListAction ba = new BoardListAction(membersDao);
		try {
			if (session != null && session.getAttribute("id") != "") {
				int bnum = Integer.parseInt(request.getParameter("idx"));
				ba.setUpdateCount(bnum);//조회수 증가
				model.addAttribute("blist", ba.getContents(bnum)); // 원글 보기
				// 세션에 게시물 번호 저장, name=idx
				session.setAttribute("idx", Integer.parseInt(request.getParameter("idx"))); 
				result = "vaps/board/b_contents";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
