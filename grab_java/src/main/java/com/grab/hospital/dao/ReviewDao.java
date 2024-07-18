package com.grab.hospital.dao;

import static com.grab.common.sql.JDBCTemplate.close;
import static com.grab.common.sql.JDBCTemplate.commit;
import static com.grab.common.sql.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.grab.hospital.vo.Review;

public class ReviewDao {
	public int[] createReview(int star, int[] arr, String content, String orName, String reName, Connection conn) {
		int[] result = new int[arr.length];
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			commit(conn);
			
			String createReviewSql = "INSERT INTO `review` (hospital_no, member_no, review_score, review_content, "
					+" org_img_name, new_img_name) VALUE (?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(createReviewSql, Statement.RETURN_GENERATED_KEYS);
			pstmt.setInt(1, 1);
			pstmt.setInt(2, 3);
			pstmt.setInt(3, star);
			pstmt.setString(4, content);
			pstmt.setString(5, orName);
			pstmt.setString(6, reName);
			
			pstmt.executeUpdate();
			
			rs = pstmt.getGeneratedKeys();
			
			try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    long reviewNo = generatedKeys.getLong(1);

                    // review_keyword_mapping 테이블에 데이터 삽입
                    String insertMappingSql = "INSERT INTO `review_keyword_mapping` (keyword_no, review_no) VALUES (?, ?)";
                    try (PreparedStatement mappingStmt = conn.prepareStatement(insertMappingSql)) {
                        for (int i = 0; i < arr.length; i++) {
                            mappingStmt.setInt(1, arr[i]);
                            mappingStmt.setLong(2, reviewNo);
                            mappingStmt.addBatch();
                        }
                        result = mappingStmt.executeBatch();
                    }
                } else {
                    throw new SQLException("Creating review failed, no ID obtained.");
                }
            }
			
		} catch (Exception e) {
			rollback(conn);
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public List<Review> getReview(int hospital_no, Connection conn) {
		List<Review> result = new ArrayList<Review>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM `review` WHERE hospital_no = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hospital_no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Review r = new Review(rs.getInt("review_no"), rs.getInt("hospital_no"),
						rs.getInt("member_no"), rs.getInt("review_score"), rs.getString("review_content"),
						rs.getString("org_img_name"), rs.getString("new_img_name"),
						rs.getTimestamp("reg_date").toLocalDateTime(), rs.getTimestamp("mod_date").toLocalDateTime());
				
				result.add(r);
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return result;
	}
	
	public List<Review> selectedReviewList (Review option, Connection conn) {
		List<Review> result = new ArrayList<Review>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM `review` LIMIT " 
					+ option.getLimitPageNo() + ", " + option.getNumPerPage();
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Review resultVo = new Review(rs.getInt("review_no"), rs.getInt("hospital_no"),
						rs.getInt("member_no"), rs.getInt("review_score"), rs.getString("review_content"),
						rs.getString("org_img_name"), rs.getString("new_img_name"),
						rs.getTimestamp("reg_date").toLocalDateTime(), rs.getTimestamp("mod_date").toLocalDateTime());
				
				result.add(resultVo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return result;
	}
}
