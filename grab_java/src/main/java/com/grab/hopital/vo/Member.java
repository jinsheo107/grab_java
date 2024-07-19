package com.grab.hopital.vo;

import java.time.LocalDateTime;

public class Member {
	private int member_no;
	private String member_id;
	private String member_pw;
	private String member_email;
	private int member_type;
	private LocalDateTime member_login_time;
	
	public Member() {
		super();
	}

	public Member(int member_no, String member_id, String member_pw, String member_email, int member_type,
			LocalDateTime member_login_time) {
		super();
		this.member_no = member_no;
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_email = member_email;
		this.member_type = member_type;
		this.member_login_time = member_login_time;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public int getMember_type() {
		return member_type;
	}

	public void setMember_type(int member_type) {
		this.member_type = member_type;
	}

	public LocalDateTime getMember_login_time() {
		return member_login_time;
	}

	public void setMember_login_time(LocalDateTime member_login_time) {
		this.member_login_time = member_login_time;
	}

	@Override
	public String toString() {
		return "Member [member_no=" + member_no + ", member_id=" + member_id + ", member_pw=" + member_pw
				+ ", member_email=" + member_email + ", member_type=" + member_type + ", member_login_time="
				+ member_login_time + "]";
	}
	
	
	
}
