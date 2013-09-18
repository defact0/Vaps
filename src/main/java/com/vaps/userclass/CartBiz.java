package com.vaps.userclass;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.vaps.bean.Items;
import com.vaps.home.HomeController;

public class CartBiz {

	public void addCart(HttpServletRequest request, Items items) {
		HomeController.session = request.getSession();
		@SuppressWarnings("unchecked")
		ArrayList<Items> cartList = (ArrayList<Items>)HomeController.session.getAttribute("cartList");	//한 번만 만들기 위해서
		//목록 하나가 있는 cart 객체를 ArrayList 로 받아옴
		if(cartList == null) { //session에 존재하지 않을 때
			cartList = new ArrayList<Items>();	// 객체 새로 생성
		}
		Items cart = null;	//session 에 존재하면 초기화하고
		boolean newCart = true;
		for(int i=0 ; i<cartList.size() ; i++) {
			cart = cartList.get(i);
			if(items.getI_name().equals(cart.getI_name())){
					//지금 선택한 상품이 카트 리스트에 있는지 kind 로 확인
				newCart = false;
				cart.setBuyCount(cart.getBuyCount()+1);	// 지금 찾아진 카트 객체(cart) 상품이 있으면 수량만 증가
			}		
		}
			
		if(newCart) {
		//추가되어 있지 않을 때 새로운 카트 객체 생성
			cart = new Items();
			cart.setI_name(items.getI_name()); // 상품이름
			cart.setI_category(items.getI_category()); // 상품 카테고리
			cart.setI_pic(items.getI_pic()); //상품이미지
			cart.setI_price(items.getI_price()); // 상품가격
			cart.setBuyCount(1); //무조건 1이 들어감 (주문시, 상품 수량)
			
			cartList.add(cart);
		}
		HomeController.session.setAttribute("cartList", cartList);	//공유
	}

	public ArrayList<Items> getCartList(HttpServletRequest request) {
		HttpSession session = request.getSession();
		@SuppressWarnings("unchecked")
		ArrayList<Items> cartList = (ArrayList<Items>)session.getAttribute("cartList");

		return cartList;
	}

	public void removeCartItem(HttpServletRequest request, String[] kinds) {
		// 주문 상품 삭제하기(장바구니)
		HttpSession session = request.getSession();
		@SuppressWarnings("unchecked")
		ArrayList<Items> cartList = 
		(ArrayList<Items>)session.getAttribute("cartList");
		for(int i=0;i<kinds.length;i++){
			for(int j=0;j<cartList.size();j++){
				if(kinds[i].equals(cartList.get(j).getI_name())){
					cartList.remove(cartList.get(j));
				}
			}
		}
		
	}

	public void upCartQty(HttpServletRequest request, String kind) {
		// 주문수량 증가
		HttpSession session = request.getSession();
		@SuppressWarnings("unchecked")
		ArrayList<Items> cartList = 
		(ArrayList<Items>)session.getAttribute("cartList");
		for(int i=0;i<cartList.size();i++){
			if(cartList.get(i).getI_name().equals(kind)){
				cartList.get(i).setBuyCount(cartList.get(i).getBuyCount()+1);
			}
		}
	}

	public void downCartQty(HttpServletRequest request, String kind) {
		// 주문수량 감소
		HttpSession session = request.getSession();
		@SuppressWarnings("unchecked")
		ArrayList<Items> cartList = 
		(ArrayList<Items>)session.getAttribute("cartList");
		for(int i=0;i<cartList.size();i++){
			if(cartList.get(i).getI_name().equals(kind)){
				
				cartList.get(i).setBuyCount(cartList.get(i).getBuyCount()-1);
			}
		}
	}

}
