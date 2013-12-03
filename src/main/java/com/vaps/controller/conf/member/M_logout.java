package com.vaps.controller.conf.member;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class M_logout {
	@RequestMapping(value="/logout")
	public String mLogout(){
		return "conf/member/m_logout";
	}
}
