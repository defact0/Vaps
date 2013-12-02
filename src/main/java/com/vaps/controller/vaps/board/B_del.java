package com.vaps.controller.vaps.board;

import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.vaps.action.BoardListAction;
import com.vaps.controller.Home;
import com.vaps.dao.MembersDAO;


@Controller
@SessionAttributes("members")
public class B_del {
	@Resource(name = "membersDao")
	private MembersDAO membersDao;
	
	private HttpSession session = Home.session;
	
	// 게시글 삭제
	@RequestMapping(value = "/boardDelContent")
	public void boardDelContent(HttpServletRequest req, HttpServletResponse res, Model model) {
		// 게시글 번호를 가져와 사용자 본인 확인or 관리자 확인 후 삭제
		BoardListAction ba = new BoardListAction(membersDao);
		try {
			// sql 으로 글쓴이 확인 과정을 거쳐야 한다.
			res.setContentType("text/html;charset=UTF-8"); // 한글처리코드
			PrintWriter out = res.getWriter();
			int bnum = (Integer) session.getAttribute("idx"); // 게시글 번호 가져오기
			String id = (String) req.getParameter("id"); // 게시글 쓴 사람 id 가져오기

			if (session != null && session.getAttribute("id") != "") {
				// 현재 접속한 id와 게시글을 올린 id와 비교, 관리자 auth=1은 무조건 삭제
				if (id.equals((String) session.getAttribute("id"))
						|| (Integer) session.getAttribute("auth") == 1) {
					if (ba.delContents(bnum) == 1) {// 게시글 삭제 쿼리 들어가기
						// 페이지 이동, 성공
						out.println("<script>");
						out.println("location.href='/board'");
						out.println("</script>");
					}
				} else {
					// 페이지 이동, 실패
					out.println("<script>");
					out.println("alert('게시글 삭제 실패')");
					out.println("location.href='/board'");
					out.println("</script>");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
