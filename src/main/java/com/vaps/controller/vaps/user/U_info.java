package com.vaps.controller.vaps.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class U_info {
	@RequestMapping(value = "/info")
	public String uInfo() {
		return "vaps/user/u_info";
	}
}
