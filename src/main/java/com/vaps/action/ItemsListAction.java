package com.vaps.action;

import java.util.List;

import com.vaps.bean.Items;
import com.vaps.dao.ItemsDAO;
import com.vaps.bean.SalesList;


public class ItemsListAction {
	ItemsDAO dao;
	
	public ItemsListAction(ItemsDAO items){
		this.dao = items;
	}
	
	public List<Items> getItemsList(){
		// 상품 리스트
		return dao.getItemsList();
	}
	public int setItems(Items item) {
		// 상품등록
		convertDBcontents(item); // 내용저장 처리
		return dao.setItems(item);
	}
	public int setItemsTored(Items item){
		// 상품재고등록(상품등록과 같은 시점에서 등록함)
		return dao.setItemsTored(item);
	}
	public Items getContents(String i_name){
		// 상품 상세 정보
		return dao.getContents(i_name); 
	}
	public List<Items> getCategoryContents(String i_category){
		// 상품 상세 정보
		return dao.getCategoryContents(i_category); 
	}
	public Items getContentsModi(String i_name){
		// 상품 상세 정보 수정 textarea 문제때문에 변환 필요
		Items item = dao.getContents(i_name); 
		String str = item.getI_description();
		try{
			if(str==null){//str이 null일때
				str = "";
				item.setI_description(str);
			}else{
				str = str.replaceAll("<br>", "\r\n");
				str = str.replaceAll("&nbsp;", "\u0020");
				item.setI_description(str);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return item;
	}
	public int setItemsUpdate(Items item) {
		// 상품update
		convertDBcontents(item); // 내용저장 처리
		return dao.setItemsUpdate(item);
	}
	public int setItemsToredUpdate(Items item){
		// 상품재고update
		return dao.setItemsToredUpdate(item);
	}
	public int delContents(String i_name){
		// 상품재고update
		return dao.delContents(i_name);
	}
	//
	public int getMaxBuyCode(){
		// 최근 상품코드 번호 가져오기
		return dao.getMaxBuyCode();
	}
	
	public int setBuyItems(SalesList saleslist){
		// 상품 구입 처리
		return dao.setBuyItems(saleslist);
	}
	public List<SalesList> getBuyHistory(String id){
		// 상품 구입 내역보기(아이디로 검색)
		return dao.getBuyHistory(id);
	}
	public List<SalesList> getBuyDetailed(int code){
		//구입 내역 자세히 보기(상품코드 검색)
		return dao.getBuyDetailed(code);
	}
	public Items getRandom(){
		//랜덤 상품 출력
		return dao.getRandom();
	}
	public List<SalesList> getRecentItem(String id){
		//최근 구입한 상품출력
		return dao.getRecentItem(id);
	}
	// add method
	public void convertDBcontents(Items item){
		// db에 줄바꿈과 공백 처리
		String str = item.getI_description();
		str = str.replaceAll("\r\n", "<br>");
		str = str.replaceAll("\u0020", "&nbsp;");
		item.setI_description(str);
	}
}
