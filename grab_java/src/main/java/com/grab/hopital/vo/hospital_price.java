package com.grab.hopital.vo;

public class hospital_price {

	private int hospital_no;
	private String type;
	private int price;
	
	public hospital_price() {
		super();
	}
	
	public hospital_price(int hospital_no, String type, int price) {
		super();
		this.hospital_no = hospital_no;
		this.type = type;
		this.price = price;
	}

	public int getHospital_no() {
		return hospital_no;
	}

	public void setHospital_no(int hospital_no) {
		this.hospital_no = hospital_no;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "hospital_price [hospital_no=" + hospital_no + ", type=" + type + ", price=" + price + "]";
	}
	
	
}
