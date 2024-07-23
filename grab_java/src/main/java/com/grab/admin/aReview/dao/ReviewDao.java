package com.grab.admin.aReview.dao;

import static com.grab.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.grab.admin.aReview.vo.Review;

public class ReviewDao {
	public int selectReviewCount(Review option, Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT COUNT(*) AS cnt From review";
			if(option.getReview_content() != null) {
				sql += " WHERE review_content LIKE CONCAT('%', '"+ option.getReview_content() +"','%')";
			}
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("cnt");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public List<Review> selectReviewList(Review option, Connection conn){
		List<Review> list = new ArrayList<Review>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM review";
			if(option.getReview_content() != null) {
				sql += " WHERE review_no = ?";
			}
			sql += " LIMIT " + option.getLimitPageNo() + ", " + option.getNumPerPage();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, option.getReview_no());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Review resultVo = new Review(rs.getInt("review_no"),
										rs.getInt("hospital_no"),
										rs.getInt("member_no"),
										rs.getInt("review_score"),
										rs.getString("review_content"),
										rs.getString("new_img_name"),
										rs.getTimestamp("reg_date").toLocalDateTime(),
										rs.getTimestamp("mod_date").toLocalDateTime());
				list.add(resultVo);
				
			}
			System.out.println("안녕 dao");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
		
		
		
	}
	
}
