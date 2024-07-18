package com.grab.hospital.vo;

import java.time.LocalDateTime;

import com.grab.common.Paging10;

public class HospitalNotice extends Paging10{
	private int notice_no;
	private int hospital_no;
	private String notice_title;
	private String notice_content;
	private LocalDateTime notice_reg_date;
	private LocalDateTime notice_mod_date;
	private int notice_view;
	
	public HospitalNotice() {
		super();
		// TODO Auto-generated constructor stub
	}

	public HospitalNotice(int notice_no, int hospital_no, String notice_title, String notice_content,
			LocalDateTime notice_reg_date, LocalDateTime notice_mod_date, int notice_view) {
		super();
		this.notice_no = notice_no;
		this.hospital_no = hospital_no;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_reg_date = notice_reg_date;
		this.notice_mod_date = notice_mod_date;
		this.notice_view = notice_view;
	}

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public int getHospital_no() {
		return hospital_no;
	}

	public void setHospital_no(int hospital_no) {
		this.hospital_no = hospital_no;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public LocalDateTime getNotice_reg_date() {
		return notice_reg_date;
	}

	public void setNotice_reg_date(LocalDateTime notice_reg_date) {
		this.notice_reg_date = notice_reg_date;
	}

	public LocalDateTime getNotice_mod_date() {
		return notice_mod_date;
	}

	public void setNotice_mod_date(LocalDateTime notice_mod_date) {
		this.notice_mod_date = notice_mod_date;
	}

	public int getNotice_view() {
		return notice_view;
	}

	public void setNotice_view(int notice_view) {
		this.notice_view = notice_view;
	}

	@Override
	public String toString() {
		return "HospitalNotice [notice_no=" + notice_no + ", hospital_no=" + hospital_no + ", notice_title="
				+ notice_title + ", notice_content=" + notice_content + ", notice_reg_date=" + notice_reg_date
				+ ", notice_mod_date=" + notice_mod_date + ", notice_view=" + notice_view + "]";
	}
	
	
	
}
