package com.grab.hospital.service;

import static com.grab.common.sql.JDBCTemplate.close;
import static com.grab.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.grab.hospital.dao.ReviewDao;
import com.grab.hospital.vo.Review;

public class ReviewService {
	public int[] createReview(int hospital_no, int member_no, int star, int[] selectedArr, String content, String orName, String reName) {
		
		Connection conn = getConnection();
		
		int[] result = new ReviewDao().createReview(hospital_no, member_no, star, selectedArr, content, orName, reName, conn);
		close(conn);
		
		return result;
	}
	
	public List<Review> getReviewList (int hospital_no) {
		Connection conn = getConnection();
		
		List<Review> result = new ReviewDao().getReviewList(hospital_no, conn);
		close(conn);
		
		return result;
	}
	
	public List<Review> selectReviewList (Review option) {
		Connection conn = getConnection();
		
		List<Review> result = new ReviewDao().selectedReviewList(option, conn);
		
		close(conn);
		
		return result;
	}
	
	public Review getReview(int review_no) {
		Connection conn = getConnection();
		
		Review review = new ReviewDao().getReview(review_no, conn);
		close(conn);
		
		return review;
	}
	
	public int deleteReview(int review_no) {
		Connection conn = getConnection();
		
		int result = new ReviewDao().deleteReview(review_no, conn);
		close(conn);
		
		return result;
		
	}
	
	public int[] modifyReview(int review_no, int hospital_no, int member_no, int star, int[] selectedArr, String content, String orName, String reName) {
		Connection conn = getConnection();
		
		int[] result = new ReviewDao().modifyReview(review_no, hospital_no, member_no, star, selectedArr, content, orName, reName, conn);
		close(conn);
		
		return result;
	}
	
	
}
