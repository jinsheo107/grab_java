package com.grab.admin.aNotice.vo;

import java.time.LocalDateTime;

import com.grab.common.Paging;

public class Notice extends Paging{
	// 필드 7개
	private int notice_no;
	private int admin_no;
	private String notice_title;
	private String notice_content;
	private LocalDateTime reg_date;
	private LocalDateTime mod_date;
	private int notice_view;
	
	public Notice() {
		super();
	}

	public Notice(int notice_no, int admin_no, String notice_title, String notice_content, LocalDateTime reg_date,
			LocalDateTime mod_date, int notice_view) {
		super();
		this.notice_no = notice_no;
		this.admin_no = admin_no;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.reg_date = reg_date;
		this.mod_date = mod_date;
		this.notice_view = notice_view;
	}

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public int getAdmin_no() {
		return admin_no;
	}

	public void setAdmin_no(int admin_no) {
		this.admin_no = admin_no;
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

	public LocalDateTime getReg_date() {
		return reg_date;
	}

	public void setReg_date(LocalDateTime reg_date) {
		this.reg_date = reg_date;
	}

	public LocalDateTime getMod_date() {
		return mod_date;
	}

	public void setMod_date(LocalDateTime mod_date) {
		this.mod_date = mod_date;
	}

	public int getNotice_view() {
		return notice_view;
	}

	public void setNotice_view(int notice_view) {
		this.notice_view = notice_view;
	}

	@Override
	public String toString() {
		return "공지사항 목록 [notice_no=" + notice_no + ", admin_no=" + admin_no + ", notice_title=" + notice_title
				+ ", notice_content=" + notice_content + ", reg_date=" + reg_date + ", mod_date=" + mod_date
				+ ", notice_view=" + notice_view + "]";
	}

	

	
	
}
