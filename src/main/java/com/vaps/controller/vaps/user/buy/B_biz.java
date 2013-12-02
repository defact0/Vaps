package com.vaps.controller.vaps.user.buy;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.vaps.action.ItemsListAction;
import com.vaps.bean.Items;
import com.vaps.bean.SalesList;
import com.vaps.controller.Home;
import com.vaps.dao.ItemsDAO;
import com.vaps.userclass.CartBiz;

@Controller
@SessionAttributes("members")
public class B_biz{
	@Resource(name = "itemsDao")
	private ItemsDAO itemsDAO;

	// 주문수량 증가
	@RequestMapping(value = "/itemsCntUp")
	public void itemsCntUp(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("UTF-8");
		String str = request.getParameter("str");
		CartBiz cartBiz = new CartBiz();
		cartBiz.cntUp(request,str);

		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("location.href='/CartList'");
		out.println("</script>");
	}
	// 주문수량 감소
	@RequestMapping(value = "/itemsCntDown")
	public void itemsCntDown(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("UTF-8");
		String str = request.getParameter("str");
		CartBiz cartBiz = new CartBiz();
		cartBiz.cntDown(request,str);

		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("location.href='/CartList'");
		out.println("</script>");
	}
	// 주문 삭제
	@RequestMapping(value = "/itemsRemove")
	public void itemsRemove(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("UTF-8");
		String[] str = request.getParameterValues("delete");
		CartBiz cartBiz = new CartBiz();
		cartBiz.removeCartItem(request,str);

		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("location.href='/CartList'");
		out.println("</script>");
	}

	// 주문관련 로직(sales)
		@SuppressWarnings("null")
		@RequestMapping(value = "/itemsPurchase")
		public void itemsPurchase(HttpServletRequest request,HttpServletResponse response) throws IOException{
			request.setCharacterEncoding("UTF-8");
			SalesList saleslist = new SalesList();
			CartBiz cartBiz = new CartBiz();
			ItemsListAction item = new ItemsListAction(itemsDAO);
			ArrayList<Items> cartList = cartBiz.getCartList(request);
			
			int getBuyCode = item.getMaxBuyCode()+1;// s_buy_code는 저장된 code에서 +1하여 새로 코드를 저장함
			String getBuyID = (String) Home.session.getAttribute("id"); // s_id는 현재 세션의 id값을 가져온다
			for (int i = 0; i < cartList.size(); i++){
					// s_num, 시퀀스
				saleslist.setS_buy_code(getBuyCode); // s_id
				saleslist.setS_id(getBuyID); // s_buy_code
				saleslist.setS_item_name(cartList.get(i).getI_name()); //s_item_name
				int buyCnt = cartList.get(i).getBuyCount();
				saleslist.setS_buy_cnt(buyCnt); //s_buy_cnt
				saleslist.setS_buy_price(cartList.get(i).getI_price() * buyCnt); //s_buy_price
					// s_buy_date, 디폴트
				item.setBuyItems(saleslist);// db로 insert 수행
			}
				
				response.setContentType("text/html;charset=UTF-8"); // 한글처리코드
				PrintWriter out = response.getWriter();
					//구매완료 했으면 장바구니를 날린다.
					Home.session.removeAttribute("cartList");
					
					out.println("<script>");
					out.println("alert('구매 감사합니다!')");
					out.println("location.href='/'");
					out.println("</script>");
		}


}