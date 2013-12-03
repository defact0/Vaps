package com.vaps.controller.conf.about;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("members")
public class A_dev {
	
	@RequestMapping(value = "/developer")
	public String aDev() {
		return "conf/about/a_dev";
	}
}
