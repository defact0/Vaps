package com.vaps.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.support.lob.LobHandler;

import com.vaps.bean.NoticeList;



public class NoticeDAO extends SqlSessionDaoSupport implements NoticeInterface {

	@Autowired
	private LobHandler lobHandler;
	
	@Override
	public List<NoticeList> getList(int pageNum) {
		return getSqlSession().selectList("NoticeGetList.select", pageNum);
	}

	@Override
	public NoticeList getContents(int n_num) {
		return getSqlSession().selectOne("NoticeGetContents.select", n_num);
	}

	@Override
	public int setContents(NoticeList n_contents) {
		return getSqlSession().insert("NoticeSetContents.insert", n_contents);
	}

	@Override
	public int delContents(int n_num) {
		return getSqlSession().delete("NoticeDelContents.delete", n_num);
	}

	@Override
	public NoticeList getContentsModi(int n_num) {
		return getSqlSession().selectOne("NoticeGetContents.select", n_num);
	}

	@Override
	public int setContentsModi(NoticeList n_contents) {
		return getSqlSession().update("NoticeSetModi.update", n_contents);
	}

	@Override
	public int getPageCNT() {
		return getSqlSession().selectOne("NoticeGetPageCNT.select");
	}

	@Override
	public int setUpdateCNT(int n_num) {
		return getSqlSession().update("NoticeSetUpCNT.update", n_num);
	}
}