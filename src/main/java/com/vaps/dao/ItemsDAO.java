package com.vaps.dao;

import java.io.InputStream;
import java.util.List;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.support.lob.LobHandler;

import com.vaps.bean.Items;

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
	public Items getContents(String i_name) {
		// 상품 정보 가져오기
		return getSqlSession().selectOne("ItemsInterface.getContents", i_name);
	}
	@Override
	public int getPageCount() {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int delItems(int num) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public Items getItemsModi(int num) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int setItemsModi(Items item) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public InputStream getPicture(Integer itemId) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
