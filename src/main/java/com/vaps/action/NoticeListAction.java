package com.vaps.action;

import java.util.List;

import com.vaps.bean.NoticeList;
import com.vaps.dao.NoticeDAO;
import com.vaps.userclass.Paging;


public class NoticeListAction {
	NoticeDAO dao;
	
	public NoticeListAction(NoticeDAO noticeDao){
		this.dao = noticeDao;
	}
	
	public List<NoticeList> getList(int pageNum){
		return dao.getList(pageNum);
	}
	
	public String getPaging(int pagenum){
		int maxNum=dao.getPageCNT();
		int pageNum=pagenum;
		int listCount= 10;
		int pageCount= 5;
		String pageName="notice";
		
		Paging paging=new Paging(maxNum, pageNum, listCount, pageCount, pageName);
		return paging.makePageGroup();
	}

	public NoticeList getContents(int bNum) {
		return dao.getContents(bNum);
	}
	
	public NoticeList getContentsModi(int n_num) {
		NoticeList bl = dao.getContentsModi(n_num);
		
		String str = bl.getN_contents();
		str = str.replaceAll("<br>", "\r\n");
		str = str.replaceAll("&nbsp;", "\u0020");
		bl.setN_contents(str);
		
		return bl;
	}
	
	public int setContentsModi(NoticeList setContnetns) {
		convertDBcontents(setContnetns);
		return dao.setContentsModi(setContnetns);
	}
	
	
	public int setContents(NoticeList setContnetns) {
		convertDBcontents(setContnetns);
		return dao.setContents(setContnetns);
	}
	
	public int delContents(int n_num) {
		return dao.delContents(n_num);
	}
	
	public int setUpdateCNT(int n_num) {
		return dao.setUpdateCNT(n_num);
	}
	
	// add method
	public void convertDBcontents(NoticeList setContnetns){
		String str = setContnetns.getN_contents();
		str = str.replaceAll("\r\n", "<br>");
		str = str.replaceAll("\u0020", "&nbsp;");
		setContnetns.setN_contents(str);
	}
}
