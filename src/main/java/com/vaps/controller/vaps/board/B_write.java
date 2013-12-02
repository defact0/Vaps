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
import com.vaps.bean.BoardList;
import com.vaps.dao.MembersDAO;


@Controller
@SessionAttributes("members")
public class B_write {
	@Resource(name = "membersDao")
	private MembersDAO membersDao;
	
	private HttpSession session;
	
	// 게시글 쓰기 폼
	@RequestMapping(value = "/boardWriteForm")
	public String bWrite() {
		return "vaps/board/b_write";
	}

	// 게시글 쓰기(sql 삽입), 등록버튼 눌렀을때
	@RequestMapping(value = "/boardWrite")
	public void bWrite(HttpServletRequest request, Model model, HttpServletResponse res) {
		session = request.getSession();
		try {
			// DB로 한글 저장시 깨짐 해결함
			request.setCharacterEncoding("UTF-8");
			BoardListAction ba = new BoardListAction(membersDao);
			if (session != null && session.getAttribute("id") != "") {
				BoardList wr = new BoardList();
				wr.setB_id((String) session.getAttribute("id")); // 게시자
				wr.setB_sub(request.getParameter("sub")); // 제목
				wr.setB_contents(request.getParameter("contents")); //내용 wr에 저장

				PrintWriter out = res.getWriter();
				res.setContentType("text/html;charset=UTF-8"); // 한글처리코드
				if (ba.writeBoard(wr) == 1) {
					// 글쓰기 성공하고 /board로 가기 위해서 스크립트 코드 사용
					// String result ="/board/boardlist"; 이런식으로 가면 정상작동안됨
					out.println("<script>");
					out.println("location.href='/board'");
					out.println("</script>");
				} else {
					// 실패시 홈으로 이동
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
