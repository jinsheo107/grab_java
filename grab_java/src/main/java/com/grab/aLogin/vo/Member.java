package com.grab.aLogin.vo;

public class Member {
	String member_id;
	String member_pw;
	String member_email;
	int member_type;
	
	public Member() {
		super();
	}

	public Member(String member_id, String member_pw, String member_email, int member_type) {
		super();
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_email = member_email;
		this.member_type = member_type;
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


	@Override
	public String toString() {
		return "회원 [member_id=" + member_id + ", member_pw=" + member_pw + ", member_email=" + member_email
				+ ", member_type=" + member_type + "]";
	}
	
	
	
}
