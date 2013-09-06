package com.vaps.dao;

import java.util.List;
import com.vaps.bean.Items;

public interface ItemsInterface {
	public List<Items> getItemsList(); //상품리스트 가져오기
	public int getPageCount();
	public Items getContents(int num); //상품 정보
	public int setItems(Items item); // 상품 올리기
	public int delItems(int num);
	public Items getItemsModi(int num); //상품 수정
	public int setItemsModi(Items item); //수정한 상품 저장


}
