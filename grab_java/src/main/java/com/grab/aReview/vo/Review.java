package com.grab.aReview.vo;

import java.time.LocalDateTime;

import com.grab.common.Paging;

public class Review extends Paging{
	// 필드
	int review_no;
	int hospital_no;
	int member_no;
	int review_score;
	String review_content;
	String review_image;
	LocalDateTime reg_date;
	LocalDateTime mod_date;
	String review_check;
	
	// 생성자
	public Review() {
		super();
	}

	public Review(int review_no, int hospital_no, int member_no, int review_score, String review_content,
			String review_image, LocalDateTime reg_date, LocalDateTime mod_date, String review_check) {
		super();
		this.review_no = review_no;
		this.hospital_no = hospital_no;
		this.member_no = member_no;
		this.review_score = review_score;
		this.review_content = review_content;
		this.review_image = review_image;
		this.reg_date = reg_date;
		this.mod_date = mod_date;
		this.review_check = review_check;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public int getHospital_no() {
		return hospital_no;
	}

	public void setHospital_no(int hospital_no) {
		this.hospital_no = hospital_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public int getReview_score() {
		return review_score;
	}

	public void setReview_score(int review_score) {
		this.review_score = review_score;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getReview_image() {
		return review_image;
	}

	public void setReview_image(String review_image) {
		this.review_image = review_image;
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

	public String getReview_check() {
		return review_check;
	}

	public void setReview_check(String review_check) {
		this.review_check = review_check;
	}

	@Override
	public String toString() {
		return "리뷰 테이블 [review_no=" + review_no + ", hospital_no=" + hospital_no + ", member_no=" + member_no
				+ ", review_score=" + review_score + ", review_content=" + review_content + ", review_image="
				+ review_image + ", reg_date=" + reg_date + ", mod_date=" + mod_date + ", review_check=" + review_check
				+ "]";
	}
	
	
}
