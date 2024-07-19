package com.grab.hospital.vo;

import com.grab.common.Paging10;

public class Department extends Paging10{
	private int hospital_no;
	private String hospital_name;
	private String type_content;
	public Department() {
		super();
	}
	public Department(int hospital_no, String hospital_name, String type_content) {
		super();
		this.hospital_no = hospital_no;
		this.hospital_name = hospital_name;
		this.type_content = type_content;
	}
	public int getHospital_no() {
		return hospital_no;
	}
	public void setHospital_no(int hospital_no) {
		this.hospital_no = hospital_no;
	}
	public String getHospital_name() {
		return hospital_name;
	}
	public void setHospital_name(String hospital_name) {
		this.hospital_name = hospital_name;
	}
	public String getType_content() {
		return type_content;
	}
	public void setType_content(String type_content) {
		this.type_content = type_content;
	}
	@Override
	public String toString() {
		return "Department [hospital_no=" + hospital_no + ", hospital_name=" + hospital_name + ", type_content="
				+ type_content + "]";
	}
	
	
}
