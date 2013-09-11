package com.vaps.bean;


public class Items {
	//items와 itemsored와 같이 쓴다.
	private String i_name; //상품이름(i_name)
	private String i_category; //범주(i_category)
	private int i_price; //가격(i_price)
	private String i_pic;//이미지파일
	private String i_description; //상품설명
	private String is_name; //재고상품(is_name)
	private int is_count; //재고상품수량(is_count)
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
	public String getI_description() {
		return i_description;
	}
	public void setI_description(String i_description) {
		this.i_description = i_description;
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

}
