package com.vaps.bean;

import java.sql.Date;

public class NoticeList {
	private int n_num;
	private String n_id;
	private String m_nick;
	private String n_sub;
	private String n_contents;
	private Date n_date;
	private int n_readcount;
	public int getN_num() {
		return n_num;
	}
	public void setN_num(int n_num) {
		this.n_num = n_num;
	}
	public String getN_id() {
		return n_id;
	}
	public void setN_id(String n_id) {
		this.n_id = n_id;
	}
	public String getM_nick() {
		return m_nick;
	}
	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}
	public String getN_sub() {
		return n_sub;
	}
	public void setN_sub(String n_sub) {
		this.n_sub = n_sub;
	}
	public String getN_contents() {
		return n_contents;
	}
	public void setN_contents(String n_contents) {
		this.n_contents = n_contents;
	}
	public Date getN_date() {
		return n_date;
	}
	public void setN_date(Date n_date) {
		this.n_date = n_date;
	}
	public int getN_readcount() {
		return n_readcount;
	}
	public void setN_readcount(int n_readcount) {
		this.n_readcount = n_readcount;
	}
}
