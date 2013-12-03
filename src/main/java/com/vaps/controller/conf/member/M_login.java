package com.vaps.controller.conf.member;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.vaps.action.MembersAction;
import com.vaps.bean.Members;
import com.vaps.dao.MembersDAO;
import com.vaps.userclass.EncryptionEncoding;


@Controller
@SessionAttributes("members")
public class M_login {
	@Resource(name = "membersDao")
	private MembersDAO membersDao;
	
	@Resource(name = "EncryptionEncoding")
	private EncryptionEncoding ee;
	
	private HttpSession session;
	
	@RequestMapping(value = "/login")
	public String mLogin() {
		return "conf/member/m_login";
	}
	
	@RequestMapping(value = "/access")
	public String mInfo(HttpServletRequest request, Model model) throws Exception {
		String result = "home";

		Members members = new Members();
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", request.getParameter("id"));
		// DB에 저장된 패스워드가 암호화가 되어 있어 로그인할때 똑같이 암호화한뒤 저장된 패스워드랑 비교해야한다.
		map.put("pwd", ee.TripleDesEncoding(request.getParameter("pwd")));
		try {
			MembersAction ma = new MembersAction(membersDao);
			members = ma.accessMembers(map);

			if (members != null) {
				session = request.getSession();
				session.setAttribute("id", members.getM_id()); // 세션에 아이디 저장, name=id
				session.setAttribute("auth", members.getM_auth()); // 세션에 권한 저장, name=auth
				model.addAttribute("members", members);
			} else {
				if (session != null) {
					session = null;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
}
