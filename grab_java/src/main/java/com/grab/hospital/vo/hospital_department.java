package com.grab.hospital.vo;

public class hospital_department {

	private int department_no;
	private int type_no;
	private int hospital_no;
	
	public hospital_department() {
		super();
	}
	
	public hospital_department(int department_no, int type_no, int hospital_no) {
		super();
		this.department_no = department_no;
		this.type_no = type_no;
		this.hospital_no = hospital_no;
	}

	public int getDepartment_no() {
		return department_no;
	}

	public void setDepartment_no(int department_no) {
		this.department_no = department_no;
	}

	public int getType_no() {
		return type_no;
	}

	public void setType_no(int type_no) {
		this.type_no = type_no;
	}

	public int getHospital_no() {
		return hospital_no;
	}

	public void setHospital_no(int hospital_no) {
		this.hospital_no = hospital_no;
	}

	@Override
	public String toString() {
		return "hospital_department [department_no=" + department_no + ", type_no=" + type_no + ", hospital_no="
				+ hospital_no + "]";
	}

}
