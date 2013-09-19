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
	
	public int getMaxBuyCode();

}
