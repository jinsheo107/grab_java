package com.grab.community.vo;

import java.time.LocalDateTime;

public class BoardComment {
	
	private int comment_no;
	private int member_no;
	private int board_no;
	private String user_comment;
	private LocalDateTime user_comment_reg_date;
	private LocalDateTime user_comment_mod_date;
	private int member_type; //회원 종류 1=관리자, 2=일반, 3=병원
	private String member_name;
	
	public BoardComment() {
		super();
	}

	public BoardComment(int comment_no, int member_no, int board_no, String user_comment,
			LocalDateTime user_comment_reg_date, LocalDateTime user_comment_mod_date, int member_type, String member_name) {
		super();
		this.comment_no = comment_no;
		this.member_no = member_no;
		this.board_no = board_no;
		this.user_comment = user_comment;
		this.user_comment_reg_date = user_comment_reg_date;
		this.user_comment_mod_date = user_comment_mod_date;
		this.member_type = member_type;
		this.member_name =member_name;
	}
	
	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public int getComment_no() {
		return comment_no;
	}

	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getUser_comment() {
		return user_comment;
	}

	public void setUser_comment(String user_comment) {
		this.user_comment = user_comment;
	}

	public LocalDateTime getUser_comment_reg_date() {
		return user_comment_reg_date;
	}

	public void setUser_comment_reg_date(LocalDateTime user_comment_reg_date) {
		this.user_comment_reg_date = user_comment_reg_date;
	}

	public LocalDateTime getUser_comment_mod_date() {
		return user_comment_mod_date;
	}

	public void setUser_comment_mod_date(LocalDateTime user_comment_mod_date) {
		this.user_comment_mod_date = user_comment_mod_date;
	}

	public int getMember_type() {
		return member_type;
	}

	public void setMember_type(int member_type) {
		this.member_type = member_type;
	}

	@Override
	public String toString() {
		return "BoardComment [comment_no=" + comment_no + ", member_no=" + member_no + ", board_no=" + board_no
				+ ", user_comment=" + user_comment + ", user_comment_reg_date=" + user_comment_reg_date
				+ ", user_comment_mod_date=" + user_comment_mod_date + ", member_type=" + member_type + "]";
	}

}
