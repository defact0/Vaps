package com.vaps.controller.vaps.user.sales;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.vaps.action.ItemsListAction;
import com.vaps.bean.Items;
import com.vaps.dao.ItemsDAO;
import com.vaps.userclass.CartBiz;

@Controller
@SessionAttributes("members")
public class S_cart {
	@Resource(name = "itemsDao")
	private ItemsDAO itemsDAO;
	
	@RequestMapping(value = "/CartList")
	public String CartList(HttpServletRequest request){
		//화면 출력
		CartBiz cartBiz = new CartBiz();
		ArrayList<Items> cartList = cartBiz.getCartList(request);
		int totalMoney=0;
		if(cartList!=null){	
			for(int i=0;i<cartList.size();i++){
				int	money = 
						cartList.get(i).getI_price()*cartList.get(i).getBuyCount();
				totalMoney += money;
			}
		}
		request.setAttribute("totalMoney", totalMoney);
		request.setAttribute("cartList", cartList);
		return "vaps/user/sales/sale_cart";
	}
	
	@RequestMapping(value = "/CartListAdd")
	public String CartListAdd(HttpServletRequest request) throws UnsupportedEncodingException {
		//장바구니 추가
		request.setCharacterEncoding("UTF-8");
		ItemsListAction item = new ItemsListAction(itemsDAO);
		String str = request.getParameter("str");
		Items items = item.getContents(str);

		CartBiz cartBiz = new CartBiz();
		cartBiz.addCart(request,items);

		//화면 출력
		ArrayList<Items> cartList = cartBiz.getCartList(request);
		int totalMoney=0;
		if(cartList!=null){	
			for(int i=0;i<cartList.size();i++){
			int	money = 
		    cartList.get(i).getI_price()*cartList.get(i).getBuyCount();
			totalMoney += money;
			}
		}
			request.setAttribute("totalMoney", totalMoney);
			request.setAttribute("cartList", cartList);

		return "vaps/user/sales/sale_cart";
	}
}
