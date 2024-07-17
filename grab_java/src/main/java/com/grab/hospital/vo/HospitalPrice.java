package com.grab.hospital.vo;

public class HospitalPrice {
	public int price_no;
	public int hospital_no;
	public String type;
	public int price;
	
	public HospitalPrice() {
		super();
	}
	public HospitalPrice(int price_no, int hospital_no, String type, int price) {
		super();
		this.price_no = price_no;
		this.hospital_no = hospital_no;
		this.type = type;
		this.price = price;
	}
	public int getPrice_no() {
		return price_no;
	}
	public void setPrice_no(int price_no) {
		this.price_no = price_no;
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
		return "HospitalPrice [price_no=" + price_no + ", hospital_no=" + hospital_no + ", type=" + type + ", price="
				+ price + "]";
	}
	
	
}
