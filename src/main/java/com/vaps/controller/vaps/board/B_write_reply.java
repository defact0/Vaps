package com.vaps.controller.vaps.board;

import java.net.URLDecoder;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.vaps.action.BoardListAction;
import com.vaps.bean.ReplyList;
import com.vaps.dao.MembersDAO;


@Controller
@SessionAttributes("members")
public class B_write_reply {
	@Resource(name = "membersDao")
	private MembersDAO membersDao;
	
	@RequestMapping(value= "/replyInsert")
	public String rInsert(HttpServletRequest request, Model model) {
		
		try {
				BoardListAction ba= new BoardListAction(membersDao);

				ReplyList rl= new ReplyList();
				int bNum= Integer.parseInt(request.getParameter("bnum"));
				rl.setBnum(bNum);
				rl.setRid(request.getParameter("id"));
				rl.setRcontents(URLDecoder.decode(request.getParameter("contents"),"UTF-8"));
				
				System.out.println(rl.getBnum()+" / "+rl.getRcontents() +" / "+rl.getRid());
				
				if(ba.replyInsert(rl)==1){
					model.addAttribute("rlist", ba.getReplyList(bNum));
				}
			
		} catch (Exception e){
			e.printStackTrace(); 
		}		
		return "vaps/board/b_write_reply";
	}
}
