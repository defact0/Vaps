package com.vaps.controller.vaps.user.buy;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.vaps.action.ItemsListAction;
import com.vaps.controller.Home;
import com.vaps.dao.ItemsDAO;

@Controller
@SessionAttributes("members")
public class B_detail {
	@Resource(name = "itemsDao")
	private ItemsDAO itemsDAO;
	
	//주문 기록 상세히 보기
	@RequestMapping(value = "/buyDetailed")
	public String buyDetailed(HttpServletRequest request, Model model){
		String result = "home";
		int code = Integer.parseInt(request.getParameter("code"));
		try {
			ItemsListAction item = new ItemsListAction(itemsDAO);
			if (Home.session != null && Home.session.getAttribute("id") != "") {
				model.addAttribute("buylist", item.getBuyDetailed(code));
				model.addAttribute("buyCode", item.getBuyDetailed(code).get(0).getS_buy_code()); //판매코드
				model.addAttribute("buyDate", item.getBuyDetailed(code).get(0).getS_buy_date()); //구입날짜
				
				int total=0;
				for(int i=0; i<item.getBuyDetailed(code).size(); i++){
					total+= item.getBuyDetailed(code).get(i).getS_buy_price();
				}
				model.addAttribute("buyMoney", total); //구입금액
				
				result = "member/buyDetailed";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
}
