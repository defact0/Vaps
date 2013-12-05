package com.vaps.dao;

import java.util.List;
import com.vaps.bean.NoticeList;

public interface NoticeInterface {
	public List<NoticeList> getList(int pageNum);

	public NoticeList getContents(int n_num);

	public int setContents(NoticeList n_contents);

	public int delContents(int n_num);

	public NoticeList getContentsModi(int n_num);

	public int setContentsModi(NoticeList n_contents);

	public int getPageCNT();

	public int setUpdateCNT(int n_num);
	
}
