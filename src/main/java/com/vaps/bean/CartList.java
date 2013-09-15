package com.vaps.bean;

public class CartList {
	private String i_name; //상품이름(i_name)
	private String i_category; //범주(i_category)
	private int i_price; //가격(i_price)
	private String i_pic;//이미지파일
	private String is_name; //재고상품(is_name)
	private int is_count; //재고상품수량(is_count)
	private String str; // 검색을 위한
	
	//sales 테이블(판매기록)
	private int s_num; //판매기록 번호(시퀀스)
	private int s_code; //판매기록 코드
	private String s_id; //판매기록 구입자
	private String s_name; //판매기록 물품이름
	private int s_count; //판매기록 구입수량
	private int s_price; //판매기록 구입금액
	private String s_date; //판매기록 구입날짜
	public String getI_name() {
		return i_name;
	}
	public void setI_name(String i_name) {
		this.i_name = i_name;
	}
	public String getI_category() {
		return i_category;
	}
	public void setI_category(String i_category) {
		this.i_category = i_category;
	}
	public int getI_price() {
		return i_price;
	}
	public void setI_price(int i_price) {
		this.i_price = i_price;
	}
	public String getI_pic() {
		return i_pic;
	}
	public void setI_pic(String i_pic) {
		this.i_pic = i_pic;
	}
	public String getIs_name() {
		return is_name;
	}
	public void setIs_name(String is_name) {
		this.is_name = is_name;
	}
	public int getIs_count() {
		return is_count;
	}
	public void setIs_count(int is_count) {
		this.is_count = is_count;
	}
	public String getStr() {
		return str;
	}
	public void setStr(String str) {
		this.str = str;
	}
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	public int getS_code() {
		return s_code;
	}
	public void setS_code(int s_code) {
		this.s_code = s_code;
	}
	public String getS_id() {
		return s_id;
	}
	public void setS_id(String s_id) {
		this.s_id = s_id;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public int getS_count() {
		return s_count;
	}
	public void setS_count(int s_count) {
		this.s_count = s_count;
	}
	public int getS_price() {
		return s_price;
	}
	public void setS_price(int s_price) {
		this.s_price = s_price;
	}
	public String getS_date() {
		return s_date;
	}
	public void setS_date(String s_date) {
		this.s_date = s_date;
	}
	
	
	
}
