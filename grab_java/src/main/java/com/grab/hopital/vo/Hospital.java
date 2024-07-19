package com.grab.hopital.vo;

public class Hospital {
	
	private String hospital_registration;
	private String hospital_license;
	private String hospital_name;
	private String hospital_phone;
	private String hospital_addr;
	private int hospital_doctor_num;
	private String hospital_homepage;
	private int hospital_mapping;
	private String hospital_time;
	private String hospital_price;
	private char hospital_whether;
	private int hospital_view;
	private int hospital_login;
	
	
	public Hospital() {
		super();
	}


	public Hospital(String hospital_registration, String hospital_license, String hospital_name, String hospital_phone,
			String hospital_addr, int hospital_doctor_num, String hospital_homepage, int hospital_mapping,
			String hospital_time, String hospital_price, char hospital_whether, int hospital_view, int hospital_login) {
		super();
		this.hospital_registration = hospital_registration;
		this.hospital_license = hospital_license;
		this.hospital_name = hospital_name;
		this.hospital_phone = hospital_phone;
		this.hospital_addr = hospital_addr;
		this.hospital_doctor_num = hospital_doctor_num;
		this.hospital_homepage = hospital_homepage;
		this.hospital_mapping = hospital_mapping;
		this.hospital_time = hospital_time;
		this.hospital_price = hospital_price;
		this.hospital_whether = hospital_whether;
		this.hospital_view = hospital_view;
		this.hospital_login = hospital_login;
	}


	public String getHospital_registration() { 
		return hospital_registration;
	}


	public void setHospital_registration(String hospital_registration) {
		this.hospital_registration = hospital_registration;
	}


	public String getHospital_license() {
		return hospital_license;
	}


	public void setHospital_license(String hospital_license) {
		this.hospital_license = hospital_license;
	}


	public String getHospital_name() {
		return hospital_name;
	}


	public void setHospital_name(String hospital_name) {
		this.hospital_name = hospital_name;
	}


	public String getHospital_phone() {
		return hospital_phone;
	}


	public void setHospital_phone(String hospital_phone) {
		this.hospital_phone = hospital_phone;
	}


	public String getHospital_addr() {
		return hospital_addr;
	}


	public void setHospital_addr(String hospital_addr) {
		this.hospital_addr = hospital_addr;
	}


	public int getHospital_doctor_num() {
		return hospital_doctor_num;
	}


	public void setHospital_doctor_num(int hospital_doctor_num) {
		this.hospital_doctor_num = hospital_doctor_num;
	}


	public String getHospital_homepage() {
		return hospital_homepage;
	}


	public void setHospital_homepage(String hospital_homepage) {
		this.hospital_homepage = hospital_homepage;
	}


	public int getHospital_mapping() {
		return hospital_mapping;
	}


	public void setHospital_mapping(int hospital_mapping) {
		this.hospital_mapping = hospital_mapping;
	}


	public String getHospital_time() {
		return hospital_time;
	}


	public void setHospital_time(String hospital_time) {
		this.hospital_time = hospital_time;
	}


	public String getHospital_price() {
		return hospital_price;
	}


	public void setHospital_price(String hospital_price) {
		this.hospital_price = hospital_price;
	}


	public char getHospital_whether() {
		return hospital_whether;
	}


	public void setHospital_whether(char hospital_whether) {
		this.hospital_whether = hospital_whether;
	}


	public int getHospital_view() {
		return hospital_view;
	}


	public void setHospital_view(int hospital_view) {
		this.hospital_view = hospital_view;
	}


	public int getHospital_login() {
		return hospital_login;
	}


	public void setHospital_login(int hospital_login) {
		this.hospital_login = hospital_login;
	}


	@Override
	public String toString() {
		return "hospital [hospital_registration=" + hospital_registration + ", hospital_license=" + hospital_license
				+ ", hospital_name=" + hospital_name + ", hospital_number=" + hospital_phone + ", hospital_addr="
				+ hospital_addr + ", hospital_doctor_num=" + hospital_doctor_num + ", hospital_homepage="
				+ hospital_homepage + ", hospital_mapping=" + hospital_mapping + ", hospital_time=" + hospital_time
				+ ", hospital_price=" + hospital_price + ", hospital_whether=" + hospital_whether + ", hospital_view="
				+ hospital_view + ", hospital_login=" + hospital_login + "]";
	}

	
}


