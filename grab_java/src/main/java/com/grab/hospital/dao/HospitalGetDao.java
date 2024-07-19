package com.grab.hospital.dao;

import static com.grab.common.sql.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.grab.hospital.vo.Department;
import com.grab.hospital.vo.Hospital;
import com.grab.hospital.vo.HospitalNotice;
import com.grab.hospital.vo.HospitalPrice;
import com.grab.hospital.vo.Review;

public class HospitalGetDao {
	public List<Department> getDepartment(int no, Connection conn) {
		List<Department> result = new ArrayList<Department>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String departmetSql = "SELECT h.hospital_no, h.hospital_name, ty.type_content FROM `hospital_department` de JOIN `hospital_type` ty ON de.type_no = ty.type_no JOIN `hospital` h ON h.hospital_no = de.hospital_no WHERE h.hospital_no = ?";

			pstmt = conn.prepareStatement(departmetSql);
			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Department resultVo = new Department(rs.getInt("hospital_no"),rs.getString("hospital_name") ,rs.getString("type_content"));
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

	public List<HospitalPrice> getPrice(int no, Connection conn) {
		List<HospitalPrice> result = new ArrayList<HospitalPrice>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String priceSql = "SELECT * FROM `hospital_price` WHERE `hospital_no` = ?";

			pstmt = conn.prepareStatement(priceSql);
			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				HospitalPrice resultVo = new HospitalPrice(rs.getInt("price_no"), rs.getInt("hospital_no"),
						rs.getString("type"), rs.getInt("price"));

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

	public Map<String, Integer> getKeyword(List<Review> reviews, Connection conn) {
		Map<String, Integer> map = new HashMap<>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			// 리뷰 리스트에서 review_no만 추출하여 쉼표로 구분된 문자열 생성
			StringBuilder reviewNos = new StringBuilder();
			for (int i = 0; i < reviews.size(); i++) {
				reviewNos.append(reviews.get(i).review_no);
				if (i < reviews.size() - 1) {
					reviewNos.append(",");
				}
			}

			// SQL 쿼리 작성
			String sql = "SELECT keyword_no, COUNT(*) cnt FROM `review_keyword_mapping` WHERE `review_no` IN (" + reviewNos.toString() + ") GROUP BY keyword_no";

			// PreparedStatement 생성 및 실행
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			// 결과 처리
			while (rs.next()) {
				String keyword_no = "" + rs.getInt("keyword_no");
				int cnt = rs.getInt("cnt");
				map.put(keyword_no, cnt);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return map;
	}
	
	public List<HospitalNotice> getNotice(int no, Connection conn) {
		List<HospitalNotice> result = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM `hospital_notice` WHERE hospital_no = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				HospitalNotice resultVo = new HospitalNotice(rs.getInt("notice_no"), rs.getInt("hospital_no"),
						rs.getString("notice_title"), rs.getString("notice_content"), rs.getTimestamp("notice_reg_date").toLocalDateTime(),
						rs.getTimestamp("notice_mod_date").toLocalDateTime(), rs.getInt("notice_view"));
				
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
	
	public int selectHospitalCount(String keyword, Connection conn) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT COUNT(*) cnt FROM `hospital`";
			
			if(keyword != "") {
				sql = "SELECT COUNT(DISTINCT h.hospital_no) cnt FROM `hospital_department` de JOIN `hospital_type` ty ON de.type_no = ty.type_no JOIN `hospital` h ON h.hospital_no = de.hospital_no" 
						+" WHERE h.hospital_name LIKE CONCAT('%', '"+ keyword +"', '%') OR ty.type_content LIKE CONCAT('%', '"+ keyword +"', '%')";
			}
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt("cnt");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return result;
	}
	
	public List<Hospital> selectHospitalList(String keyword, Hospital option, Connection conn) {
		List<Hospital> result = new ArrayList<Hospital>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM hospital";
			if(keyword != null) {
				sql = "SELECT h.*  FROM `hospital_department` de JOIN `hospital_type` ty ON de.type_no = ty.type_no JOIN `hospital` h ON h.hospital_no = de.hospital_no"
						+ " WHERE h.hospital_name LIKE CONCAT('%', '" + keyword + "', '%') OR ty.type_content LIKE CONCAT('%', '" + keyword + "', '%') GROUP BY de.hospital_no";
			}
			
			sql += " LIMIT " + option.getLimitPageNo() + ", " + option.getNumPerPage();
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Hospital resultVo = new Hospital(rs.getInt("hospital_no"), rs.getString("hospital_name"),
						rs.getString("hospital_phone"), rs.getString("hospital_addr"), rs.getInt("hospital_doctor_num"),
						rs.getString("hospital_homepage"), rs.getString("hospital_whether"),
						rs.getInt("hospital_view"),rs.getTimestamp("hospital_login").toLocalDateTime());
				
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
