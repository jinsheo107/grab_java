package com.grab.admin.aReview.service;

import static com.grab.common.JDBCTemplate.close;
import static com.grab.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.grab.admin.aReview.dao.ReviewDao;
import com.grab.admin.aReview.vo.Review;

public class ReviewService {
	public int selectReviewCount(Review option) {
		Connection conn = getConnection();
		int result = new ReviewDao().selectReviewCount(option, conn);
		close(conn);
		return result;
	}
	
	public List<Review> selectReviewList(Review option){
		Connection conn = getConnection();
		List<Review> list = new ReviewDao().selectReviewList(option, conn);
		close(conn);
		System.out.println("안녕 service");
		return list;
		
	}

}
