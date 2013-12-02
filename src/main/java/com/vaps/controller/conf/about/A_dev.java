package com.vaps.controller.conf.about;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class A_dev {
	@RequestMapping(value = "/developer")
	public String aDev() {
		return "conf/about/a_dev";
	}
}
