package com.vaps.controller.conf.member;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vaps.action.MembersAction;
import com.vaps.bean.Members;
import com.vaps.dao.MembersDAO;
import com.vaps.userclass.EncryptionEncoding;


@Controller
public class M_join {
	
	@Resource(name = "membersDao")
	private MembersDAO membersDao;

	@Resource(name = "EncryptionEncoding")
	private EncryptionEncoding ee;
	
	// 회원가입 페이지
	@RequestMapping(value = "/join")
	public String mJoin() {
		return "conf/member/m_join";
	}
	
	// 회원가입 실행
	@RequestMapping(value = "/memJoin")
	public String memJoin(HttpServletRequest request, Model model) {
		String result = "join";
		Members mb = new Members();
		try {
			request.setCharacterEncoding("UTF-8");
			mb.setM_id(request.getParameter("id"));
			mb.setM_nick(request.getParameter("nick"));
			mb.setM_pwd(ee.TripleDesEncoding(request.getParameter("pwd"))); // 패스워드 인코딩
			mb.setM_phone(request.getParameter("phone"));
			mb.setM_addr(request.getParameter("addr"));

			MembersAction ma = new MembersAction(membersDao);
			result = ma.memInsert(mb);
			model.addAttribute("check", 1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//아이디 중복체크
	@RequestMapping(value="/MemberIDCheckAction")
	public String idchck(HttpServletRequest request, Model model) throws Exception{
		//Map<String,String> map=new HashMap<String, String>();
		//map.put("id", request.getParameter("id"));
		int x=0;
		x=membersDao.confirmId(request.getParameter("id"));
	    model.addAttribute("xx", x);
	    
		return "conf/member/m_id_chk";
	}
}
