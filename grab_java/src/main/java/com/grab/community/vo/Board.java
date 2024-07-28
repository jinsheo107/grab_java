package com.grab.community.vo;

import java.time.LocalDateTime;

import com.grab.common.Paging;

public class Board extends Paging{
	
	private int board_no;
	private int member_no;
	private int hits;
	private String board_title;
	private String board_content;
	private LocalDateTime board_reg_date;
	private LocalDateTime board_mod_date;
	private int member_type;
	private String member_name;
	private int board_type;
	private String board_img;
	
	public Board() {
		super();
	}

	

	public Board(int board_no, int member_no, int hits, String board_title, String board_content,
			LocalDateTime board_reg_date, LocalDateTime board_mod_date, int member_type, String member_name, int board_type, String board_img) {
		super();
		this.board_no = board_no;
		this.member_no = member_no;
		this.hits = hits;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_reg_date = board_reg_date;
		this.board_mod_date = board_mod_date;
		this.member_type = member_type;
		this.member_name = member_name;
		this.board_type = board_type;
		this.board_img = board_img;
	}
	
	public String getBoard_img() {
		return board_img;
	}

	public void setBoard_img(String board_img) {
		this.board_img = board_img;
	}
	
	public int getBoard_type() {
		return board_type;
	}

	public void setBoard_type(int board_type) {
		this.board_type = board_type;
	}
	
	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public int getMember_type() {
		return member_type;
	}

	public void setMember_type(int member_type) {
		this.member_type = member_type;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}


	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public LocalDateTime getBoard_reg_date() {
		return board_reg_date;
	}

	public void setBoard_reg_date(LocalDateTime board_reg_date) {
		this.board_reg_date = board_reg_date;
	}

	public LocalDateTime getBoard_mod_date() {
		return board_mod_date;
	}

	public void setBoard_mod_date(LocalDateTime board_mod_date) {
		this.board_mod_date = board_mod_date;
	}

	@Override
	public String toString() {
		return "Board [board_no=" + board_no + ", member_no=" + member_no + ", hits=" + hits + ", board_title="
				+ board_title + ", board_content=" + board_content + ", board_reg_date=" + board_reg_date
				+ ", board_mod_date=" + board_mod_date + "]";
	}
}
