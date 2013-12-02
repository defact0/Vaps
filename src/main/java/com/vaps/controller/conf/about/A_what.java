package com.vaps.controller.conf.about;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class A_what {
	@RequestMapping(value = "/what")
	public String aWhat() {
		return "conf/about/a_what";
	}
}
