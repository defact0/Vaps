package com.vaps.action;

import java.util.List;

import com.vaps.bean.Items;
import com.vaps.dao.ItemsDAO;


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
		return dao.setItems(item);
	}
	public Items getContents(String i_name){
		// 상품 상세 정보
		return dao.getContents(i_name);
	}
}
