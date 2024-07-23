package com.grab.hospital.vo;

public class Hospital {
	
	private int hospital_no;
	private String hospital_new_registration;
	private String hospital_new_license;
	private String hospital_org_registration;
	private String hospital_org_license;
	private String hospital_name;
	private String hospital_phone;
	private String hospital_addr;
	private int hospital_doctor_num;
	private String hospital_homepage;
	private String hospital_time;
	private String hospital_lunch_time;
	private char hospital_whether;
	private int hospital_view;
	private int hospital_login;
	
	
	public Hospital() {
		super();
	}


	public Hospital(int hospital_no, String hospital_new_registration, String hospital_new_license,
			String hospital_org_registration, String hospital_org_license, String hospital_name, String hospital_phone,
			String hospital_addr, int hospital_doctor_num, String hospital_homepage, String hospital_time,
			String hospital_lunch_time, char hospital_whether, int hospital_view, int hospital_login) {
		super();
		this.hospital_no = hospital_no;
		this.hospital_new_registration = hospital_new_registration;
		this.hospital_new_license = hospital_new_license;
		this.hospital_org_registration = hospital_org_registration;
		this.hospital_org_license = hospital_org_license;
		this.hospital_name = hospital_name;
		this.hospital_phone = hospital_phone;
		this.hospital_addr = hospital_addr;
		this.hospital_doctor_num = hospital_doctor_num;
		this.hospital_homepage = hospital_homepage;
		this.hospital_time = hospital_time;
		this.hospital_lunch_time = hospital_lunch_time;
		this.hospital_whether = hospital_whether;
		this.hospital_view = hospital_view;
		this.hospital_login = hospital_login;
	}


	public int getHospital_no() {
		return hospital_no;
	}


	public void setHospital_no(int hospital_no) {
		this.hospital_no = hospital_no;
	}


	public String getHospital_new_registration() {
		return hospital_new_registration;
	}


	public void setHospital_new_registration(String hospital_new_registration) {
		this.hospital_new_registration = hospital_new_registration;
	}


	public String getHospital_new_license() {
		return hospital_new_license;
	}


	public void setHospital_new_license(String hospital_new_license) {
		this.hospital_new_license = hospital_new_license;
	}


	public String getHospital_org_registration() {
		return hospital_org_registration;
	}


	public void setHospital_org_registration(String hospital_org_registration) {
		this.hospital_org_registration = hospital_org_registration;
	}


	public String getHospital_org_license() {
		return hospital_org_license;
	}


	public void setHospital_org_license(String hospital_org_license) {
		this.hospital_org_license = hospital_org_license;
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


	public String getHospital_time() {
		return hospital_time;
	}


	public void setHospital_time(String hospital_time) {
		this.hospital_time = hospital_time;
	}


	public String getHospital_lunch_time() {
		return hospital_lunch_time;
	}


	public void setHospital_lunch_time(String hospital_lunch_time) {
		this.hospital_lunch_time = hospital_lunch_time;
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
		return "Hospital [hospital_no=" + hospital_no + ", hospital_new_registration=" + hospital_new_registration
				+ ", hospital_new_license=" + hospital_new_license + ", hospital_org_registration="
				+ hospital_org_registration + ", hospital_org_license=" + hospital_org_license + ", hospital_name="
				+ hospital_name + ", hospital_phone=" + hospital_phone + ", hospital_addr=" + hospital_addr
				+ ", hospital_doctor_num=" + hospital_doctor_num + ", hospital_homepage=" + hospital_homepage
				+ ", hospital_time=" + hospital_time + ", hospital_lunch_time=" + hospital_lunch_time
				+ ", hospital_whether=" + hospital_whether + ", hospital_view=" + hospital_view + ", hospital_login="
				+ hospital_login + "]";
	}


	
	
}