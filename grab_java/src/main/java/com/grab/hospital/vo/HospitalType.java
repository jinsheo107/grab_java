package com.grab.hospital.vo;

public class HospitalType {
	private int type_no;
	private String type_content;
	public HospitalType() {
		super();
		// TODO Auto-generated constructor stub
	}
	public HospitalType(int type_no, String type_content) {
		super();
		this.type_no = type_no;
		this.type_content = type_content;
	}
	public int getType_no() {
		return type_no;
	}
	public void setType_no(int type_no) {
		this.type_no = type_no;
	}
	public String getType_content() {
		return type_content;
	}
	public void setType_content(String type_content) {
		this.type_content = type_content;
	}
	@Override
	public String toString() {
		return "HospitalType [type_no=" + type_no + ", type_content=" + type_content + "]";
	}
	
	
}
