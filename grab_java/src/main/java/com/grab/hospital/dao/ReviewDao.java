package com.grab.hospital.dao;

import static com.grab.common.sql.JDBCTemplate.close;
import static com.grab.common.sql.JDBCTemplate.commit;
import static com.grab.common.sql.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.mariadb.jdbc.export.Prepare;

import com.grab.hospital.vo.Review;

public class ReviewDao {
	public int[] createReview(int hospital_no, int member_no, int star, int[] arr, String content, String orName,
			String reName, Connection conn) {
		int[] result = new int[arr.length];

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			commit(conn);

			String createReviewSql = "INSERT INTO `review` (hospital_no, member_no, review_score, review_content, "
					+ " org_img_name, new_img_name) VALUE (?,?,?,?,?,?)";

			pstmt = conn.prepareStatement(createReviewSql, Statement.RETURN_GENERATED_KEYS);
			pstmt.setInt(1, hospital_no);
			pstmt.setInt(2, member_no);
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

	public List<Review> getReviewList(int hospital_no, Connection conn) {
		List<Review> result = new ArrayList<Review>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT * FROM `review` WHERE hospital_no = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hospital_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Review r = new Review(rs.getInt("review_no"), rs.getInt("hospital_no"), rs.getInt("member_no"),
						rs.getInt("review_score"), rs.getString("review_content"), rs.getString("org_img_name"),
						rs.getString("new_img_name"), rs.getTimestamp("reg_date").toLocalDateTime(),
						rs.getTimestamp("mod_date").toLocalDateTime(), rs.getString("review_check"));

				result.add(r);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return result;
	}

	public List<Review> selectedReviewList(Review option, Connection conn) {
		List<Review> result = new ArrayList<Review>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT * FROM `review` LIMIT " + option.getLimitPageNo() + ", " + option.getNumPerPage();

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Review resultVo = new Review(rs.getInt("review_no"), rs.getInt("hospital_no"), rs.getInt("member_no"),
						rs.getInt("review_score"), rs.getString("review_content"), rs.getString("org_img_name"),
						rs.getString("new_img_name"), rs.getTimestamp("reg_date").toLocalDateTime(),
						rs.getTimestamp("mod_date").toLocalDateTime(), rs.getString("review_check"));

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

	public Review getReview(int review_no, Connection conn) {
		Review result = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM review WHERE review_no = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, review_no);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = new Review(rs.getInt("review_no"), rs.getInt("hospital_no"), rs.getInt("member_no"),
						rs.getInt("review_score"), rs.getString("review_content"), rs.getString("org_img_name"),
						rs.getString("new_img_name"), rs.getTimestamp("reg_date").toLocalDateTime(),
						rs.getTimestamp("mod_date").toLocalDateTime(), rs.getString("review_check"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return result;
	}

	public int deleteReview(int review_no, Connection conn) {
		int result = 0;

		PreparedStatement pstmt = null;
		try {
			commit(conn);

			String deleteMapSql = "DELETE FROM review_keyword_mapping WHERE review_no = ?";

			pstmt = conn.prepareStatement(deleteMapSql);
			pstmt.setInt(1, review_no);

			result = pstmt.executeUpdate();

			String deleteReviewSql = "DELETE FROM review WHERE review_no = ?";

			pstmt = conn.prepareStatement(deleteReviewSql);
			pstmt.setInt(1, review_no);

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			rollback(conn);
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int[] modifyReview(int review_no, int hospital_no, int member_no, int star, int[] arr, String content,
			String orName, String reName, Connection conn) {
		int[] result = new int[arr.length];

		int re = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			commit(conn);

			String findReviewSql = "SELECT COUNT(*) cnt FROM review WHERE review_no = ?";

			pstmt = conn.prepareStatement(findReviewSql);
			pstmt.setInt(1, review_no);

			rs = pstmt.executeQuery();

			LocalDateTime ldt = LocalDateTime.now();
			Timestamp ts = Timestamp.valueOf(ldt);

			if (rs.next() && rs.getInt("cnt") > 0) {
				String updateReviewSql = "UPDATE review SET hospital_no = ?, "
						+ "member_no=?, review_score=?, review_content=?,"
						+ " org_img_name=?, new_img_name=?, mod_date=?, review_check=? " + "WHERE review_no = ?";

				pstmt = conn.prepareStatement(updateReviewSql);
				pstmt.setInt(1, hospital_no);
				pstmt.setInt(2, member_no);
				pstmt.setInt(3, star);
				pstmt.setString(4, content);
				pstmt.setString(5, orName);
				pstmt.setString(6, reName);
				pstmt.setTimestamp(7, ts);
				pstmt.setString(8, "N");
				pstmt.setInt(9, review_no);

				re = pstmt.executeUpdate();
			}

			if (re > 0) {
				String findReviewMapSql = "SELECT COUNT(*) cnt FROM review_keyword_mapping = ?";

				pstmt = conn.prepareStatement(findReviewMapSql);
				pstmt.setInt(1, review_no);

				rs = pstmt.executeQuery();

				if (rs.next() && rs.getInt("cnt") > 0) {
					String deleteMappingSql = "DELETE FROM review_keyword_mapping WHERE review_no = ?";
					pstmt = conn.prepareStatement(deleteMappingSql);
					pstmt.setInt(1, review_no);

					
				}
				
				re = pstmt.executeUpdate();

				String insertMappingSql = "INSERT INTO `review_keyword_mapping` (keyword_no, review_no) VALUES (?, ?)";

				pstmt = conn.prepareStatement(insertMappingSql);
				for (int i = 0; i < arr.length; i++) {
					pstmt.setInt(1, arr[i]);
					pstmt.setInt(2, review_no);
					result[i] = pstmt.executeUpdate();
				}
			}

		} catch (Exception e) {
			rollback(conn);
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return result;
	}
}
