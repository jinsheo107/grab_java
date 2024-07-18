package com.grab.hospital.vo;

public class HospitalModifyRequest {
	private int request_no;
	private int hospital_no;
	private String post_no;
	private String addr;
	private String addr_detail;
	private String hospital_name;
	public HospitalModifyRequest() {
		super();
		// TODO Auto-generated constructor stub
	}
	public HospitalModifyRequest(int request_no, int hospital_no, String post_no, String addr, String addr_detail,
			String hospital_name) {
		super();
		this.request_no = request_no;
		this.hospital_no = hospital_no;
		this.post_no = post_no;
		this.addr = addr;
		this.addr_detail = addr_detail;
		this.hospital_name = hospital_name;
	}
	public int getRequest_no() {
		return request_no;
	}
	public void setRequest_no(int request_no) {
		this.request_no = request_no;
	}
	public int getHospital_no() {
		return hospital_no;
	}
	public void setHospital_no(int hospital_no) {
		this.hospital_no = hospital_no;
	}
	public String getPost_no() {
		return post_no;
	}
	public void setPost_no(String post_no) {
		this.post_no = post_no;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddr_detail() {
		return addr_detail;
	}
	public void setAddr_detail(String addr_detail) {
		this.addr_detail = addr_detail;
	}
	public String getHospital_name() {
		return hospital_name;
	}
	public void setHospital_name(String hospital_name) {
		this.hospital_name = hospital_name;
	}
	@Override
	public String toString() {
		return "HospitalModifyRequest [request_no=" + request_no + ", hospital_no=" + hospital_no + ", post_no="
				+ post_no + ", addr=" + addr + ", addr_detail=" + addr_detail + ", hospital_name=" + hospital_name
				+ "]";
	}
	
	
}
