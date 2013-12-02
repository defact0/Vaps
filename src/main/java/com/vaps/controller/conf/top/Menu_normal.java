package com.vaps.controller.conf.top;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.vaps.action.ItemsListAction;
import com.vaps.controller.Home;
import com.vaps.dao.ItemsDAO;

@Controller
@SessionAttributes("members")
public class Menu_normal {

	@Resource(name = "itemsDao")
	private ItemsDAO itemsDAO;
	private HttpSession session;

	// 로그인별 페이지출력
	@RequestMapping(value = "/m_normal")
	public String menuNormal(HttpServletRequest request,Model model) {
		session = request.getSession();
		String id = (String) session.getAttribute("id");
		ItemsListAction item = new ItemsListAction(itemsDAO);
		model.addAttribute("ranDom", item.getRandom());
		model.addAttribute("getRecentItem", item.getRecentItem(id));
		model.addAttribute("getRecentItemCode", item.getRecentItem(id).get(0)
				.getS_buy_code());
		return "conf/top/m_normal";
	}
}
