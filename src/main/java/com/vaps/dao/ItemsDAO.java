package com.vaps.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.support.lob.LobHandler;

import com.vaps.bean.Items;
import com.vaps.bean.SalesList;

public class ItemsDAO extends SqlSessionDaoSupport implements ItemsInterface {
	
	@Autowired
	private LobHandler lobHandler;
	
	@Override
	public List<Items> getItemsList() {
		// 상품목록을 출력, 개선필요(내용보기x, 그림x)
		return getSqlSession().selectList("ItemsInterface.getItemsList");
	}
	@Override
	public int setItems(Items item) {
		// 상품정보를 저장
		return getSqlSession().insert("ItemsInterface.setItems", item);
	}
	@Override
	public int setItemsTored(Items item) {
		// 상품 재고를 저장
		return getSqlSession().insert("ItemsInterface.setItemsTored", item);
	}
	@Override
	public int setItemsUpdate(Items item) {
		// 상품정보Update
		return getSqlSession().update("ItemsInterface.setItemsUpdate", item);
	}
	@Override
	public int setItemsToredUpdate(Items item) {
		// 상품 재고Update
		return getSqlSession().update("ItemsInterface.setItemsToredUpdate", item);
	}
	@Override
	public Items getContents(String i_name) {
		// 상품 정보 가져오기
		return getSqlSession().selectOne("ItemsInterface.getContents", i_name);
	}
	@Override
	public int delContents(String i_name) {
		// 상품 정보 삭제
		return getSqlSession().delete("ItemsInterface.delContents", i_name);
	}
	
	@Override
	public List<Items> getCategoryContents(String i_category) {
		// 해당 상품 카데고리 리스트를 가져오기
		return getSqlSession().selectList("ItemsInterface.getCategoryContents", i_category);
	}
	
	//
	@Override
	public int getMaxBuyCode() {
		// 최근 상품코드 정보얻어오기
		return getSqlSession().selectOne("ItemsInterface.getMaxBuyCode");
	}

	@Override
	public int setBuyItems(SalesList saleslist) {
		// 상품 구입
		return getSqlSession().insert("ItemsInterface.setBuyItems",saleslist);
	}
	@Override
	public List<SalesList> getBuyHistory(String id) {
		// 구입 내역보기(아이디 검색)
		return getSqlSession().selectList("ItemsInterface.getBuyHistory",id);
	}
	
	
	
}
