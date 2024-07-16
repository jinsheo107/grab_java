package com.grab.hospital.vo;

public class Department {
	private int hospital_no;
	private String type_content;
	
	public Department() {
		super();
	}
	
	public Department(int hospital_no, String type_content) {
		super();
		this.hospital_no = hospital_no;
		this.type_content = type_content;
	}
	
	public int getHospital_no() {
		return hospital_no;
	}
	
	public void setHospital_no(int hospital_no) {
		this.hospital_no = hospital_no;
	}
	
	public String getType_content() {
		return type_content;
	}
	
	public void setType_content(String type_content) {
		this.type_content = type_content;
	}
	
	@Override
	public String toString() {
		return "Department [hospital_no=" + hospital_no + ", type_content=" + type_content + "]";
	}
}
