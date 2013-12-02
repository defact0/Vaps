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
import com.vaps.controller.Home;
import com.vaps.dao.MembersDAO;


@Controller
@SessionAttributes("members")
public class B_modi {
	@Resource(name = "membersDao")
	private MembersDAO membersDao;
	
	private HttpSession session = Home.session;
	
	// 게시글 수정 폼
	@RequestMapping(value = "/boardModiContentForm")
	public String boardModiContentForm(HttpServletRequest req, HttpServletResponse res, Model model) {
		session = req.getSession();

		res.setContentType("text/html;charset=UTF-8"); // 한글처리코드
		BoardListAction ba = new BoardListAction(membersDao);
		try {
			if (session != null && session.getAttribute("id") != "") {
				int bnum = Integer.parseInt(req.getParameter("idx"));
				// 원글 보기,함수를 따라가 보면 줄 바꿈 처리를 했음
				model.addAttribute("blist", ba.getContentsModi(bnum));
				// 세션에 게시물 번호 저장,name=idx
				session.setAttribute("idx", Integer.parseInt(req.getParameter("idx")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "board/boardModify";
	}

	// 게시글 수정
	@RequestMapping(value = "/boardModiContent")
	public void boardModiContent(HttpServletRequest req,HttpServletResponse res, Model model) {
		// 해당 글번호를 쿼리로 불러와 jsp에 뿌리고 수정한 내용을 다시 update를 시킨다.
		// 현재 로그인사람과 수정할 글쓴이를 비교하기위해 jsp페이지에서 get과 post방식을 둘다 사용하여 정보를 넘긴다.
		// get방식으로 b_id를 전송하고 post방식으로 idx, id, sub, contents를 불러온다.
		// 실제 update 쿼리되는 부분은 sub와 contents만 변경되고 기준 조건은 idx값을 가지고 고친다.
		try {
			// DB로 한글 저장시 깨짐 해결함
			req.setCharacterEncoding("UTF-8");
			res.setContentType("text/html;charset=UTF-8"); // 한글처리코드

			BoardList wr = new BoardList();
			BoardListAction ba = new BoardListAction(membersDao);
			PrintWriter out = res.getWriter();
			
			String id = (String) req.getParameter("id"); // 게시글 쓴 사람 id 가져오기

			if (session != null && session.getAttribute("id") != "") {
				if (id.equals(session.getAttribute("id"))
						|| (Integer) session.getAttribute("auth") == 1) {
					wr.setB_num((Integer) session.getAttribute("idx")); // idx
					wr.setB_id((String) session.getAttribute("id")); // id
					wr.setB_sub(req.getParameter("sub")); // title
					wr.setB_contents(req.getParameter("contents"));

					ba.setContentsModi(wr);
					out.println("<script>");
					out.println("location.href='/board'");
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
