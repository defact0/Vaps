package com.vaps.controller.vaps.user.buy;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.vaps.action.ItemsListAction;
import com.vaps.dao.ItemsDAO;

@Controller
@SessionAttributes("members")
public class B_history {
	@Resource(name = "itemsDao")
	private ItemsDAO itemsDAO;
	private HttpSession session;
	
	//주문기록
	@RequestMapping(value = "/buyHistory")
	public String buyHistory(HttpServletRequest request, Model model){
		String result = "home";
		session = request.getSession();
		String id = (String) session.getAttribute("id");
		try {
			ItemsListAction item = new ItemsListAction(itemsDAO);
			if (session != null && id != "") {
				model.addAttribute("buylist", item.getBuyHistory(id));
				
				int total=0;
				for(int i=0; i<item.getBuyHistory(id).size(); i++){
					total+= item.getBuyHistory(id).get(i).getS_buy_price();
				}
				model.addAttribute("buyTotalMoney", total); //누적 구입금액
				
				result = "vaps/user/buy/buy_history";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
}
