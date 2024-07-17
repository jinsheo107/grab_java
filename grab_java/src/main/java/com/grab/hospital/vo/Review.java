package com.grab.hospital.vo;

import java.time.LocalDateTime;

public class Review {
	public int review_no;
	public int hospital_no;
	public int member_no;
	public int review_score;
	public String review_content;
	public String org_img_name;
	public String new_img_name;
	public LocalDateTime review_create_date;
	public LocalDateTime reivew_modification_date;
	
	
	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Review(int review_no, int hospital_no, int member_no, int review_score, String review_content,
			String org_img_name, String new_img_name, LocalDateTime review_create_date,
			LocalDateTime reivew_modification_date) {
		super();
		this.review_no = review_no;
		this.hospital_no = hospital_no;
		this.member_no = member_no;
		this.review_score = review_score;
		this.review_content = review_content;
		this.org_img_name = org_img_name;
		this.new_img_name = new_img_name;
		this.review_create_date = review_create_date;
		this.reivew_modification_date = reivew_modification_date;
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


	public String getOrg_img_name() {
		return org_img_name;
	}


	public void setOrg_img_name(String org_img_name) {
		this.org_img_name = org_img_name;
	}


	public String getNew_img_name() {
		return new_img_name;
	}


	public void setNew_img_name(String new_img_name) {
		this.new_img_name = new_img_name;
	}


	public LocalDateTime getReview_create_date() {
		return review_create_date;
	}


	public void setReview_create_date(LocalDateTime review_create_date) {
		this.review_create_date = review_create_date;
	}


	public LocalDateTime getReivew_modification_date() {
		return reivew_modification_date;
	}


	public void setReivew_modification_date(LocalDateTime reivew_modification_date) {
		this.reivew_modification_date = reivew_modification_date;
	}


	@Override
	public String toString() {
		return "Review [review_no=" + review_no + ", hospital_no=" + hospital_no + ", member_no=" + member_no
				+ ", review_score=" + review_score + ", review_content=" + review_content + ", org_img_name="
				+ org_img_name + ", new_img_name=" + new_img_name + ", review_create_date=" + review_create_date
				+ ", reivew_modification_date=" + reivew_modification_date + "]";
	}
	
}
