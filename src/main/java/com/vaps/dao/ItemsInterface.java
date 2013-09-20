package com.vaps.dao;

import java.util.List;

import com.vaps.bean.Items;
import com.vaps.bean.SalesList;

public interface ItemsInterface {
	public List<Items> getItemsList(); //상품리스트 가져오기
	public Items getContents(String i_name); //상품 정보
	public int setItems(Items item); // 상품 올리기
	public int setItemsTored(Items item); // 상품재고 올리기
	public int delContents(String i_name); // 상품 삭제
	public int setItemsUpdate(Items item); //상품정보 update
	public int setItemsToredUpdate(Items item); //상품재고 update
	public List<Items> getCategoryContents(String i_category); // 카테고리별로 출력
	
	public int getMaxBuyCode(); // 상품코드 얻기
	public int setBuyItems(SalesList saleslist); //상품 구입 처리
	public List<SalesList> getBuyHistory(String id); //구입 내역보기(아이디 검색)

}
