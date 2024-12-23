package com.grab.hospital_detail.dao;

import static com.grab.common.sql.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.grab.hospital_detail.vo.Department;
import com.grab.hospital_detail.vo.Hospital;
import com.grab.hospital_detail.vo.HospitalNotice;
import com.grab.hospital_detail.vo.HospitalType;
import com.grab.hospital_detail.vo.Review;
import com.grab.member_detail.vo.Member;

public class HospitalGetDao {
	public Hospital getHospital(int hospital_no, Connection conn) {
		Hospital result = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM `hospital` WHERE hospital_no = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hospital_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = new Hospital(rs.getInt("hospital_no"), rs.getString("hospital_name"),
						rs.getString("hospital_phone"), rs.getString("hospital_addr"), rs.getInt("hospital_doctor_num"),
						rs.getString("hospital_homepage"), rs.getString("hospital_new_license"),
						rs.getString("hospital_org_license"), rs.getString("hospital_new_registration"), 
						rs.getString("hospital_org_registration") , rs.getString("hospital_time") , 
						rs.getString("hospital_lunch_time"),rs.getString("hospital_whether"),
						rs.getInt("hospital_view"),rs.getTimestamp("hospital_login").toLocalDateTime());
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return result;
	}
	
	public List<Member> getMemberList(List<Review> reviewList, Connection conn) {
		List<Member> result= new ArrayList<Member>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
            String sql = "SELECT * FROM member WHERE member_no = ?";
            pstmt = conn.prepareStatement(sql);
          

            for (Review review : reviewList) {
                pstmt.setInt(1, review.getMember_no());
                rs = pstmt.executeQuery();
               

                if (rs.next()) {
                    Member member = new Member(
                        rs.getInt("member_no"),
                        rs.getString("member_id"),
                        rs.getString("member_pw"),
                        rs.getString("member_email"),
                        rs.getInt("member_type")
                    );
                    result.add(member);
                }
            }
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return result;
	}
	
	public Member getMember(int member_no, Connection conn) {
		Member result = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM member WHERE member_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = new Member(rs.getInt("member_no"),
						rs.getString("member_id"), rs.getString("member_pw"),
						rs.getString("member_email"), rs.getInt("member_type"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return result;
	}
	
	public List<Department> getDepartment(int hospital_no, Connection conn) {
		List<Department> result = new ArrayList<Department>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String departmetSql = "SELECT h.hospital_no, h.hospital_name, ty.type_content FROM `hospital_department` de JOIN `hospital_type` ty ON de.type_no = ty.type_no JOIN `hospital` h ON h.hospital_no = de.hospital_no WHERE h.hospital_no = ? AND h.hospital_whether = ?";

			pstmt = conn.prepareStatement(departmetSql);
			pstmt.setInt(1, hospital_no);
			pstmt.setString(2, "Y");

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
	
	public Map<String, Integer> getKeyword(List<Review> reviews, Connection conn) {
		Map<String, Integer> map = new HashMap<>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			StringBuilder reviewNos = new StringBuilder();
			for (int i = 0; i < reviews.size(); i++) {
				reviewNos.append(reviews.get(i).review_no);
				if (i < reviews.size() - 1) {
					reviewNos.append(",");
				}
			}
			
			String sql = "SELECT keyword_no, 0 AS cnt FROM `review_keyword_mapping` WHERE 1=0";
			
			if(reviews.size() > 0) {
				sql = "SELECT keyword_no, COUNT(*) cnt FROM `review_keyword_mapping` WHERE `review_no` IN (" + reviewNos.toString() + ") GROUP BY keyword_no";				
			}

			// PreparedStatement 생성 및 실행
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			// 결과 처리
			while (rs.next()) {
				String keyword_no = Integer.toString(rs.getInt("keyword_no"));
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
	
	public List<HospitalNotice> getNotice(int hospital_no, Connection conn) {
		List<HospitalNotice> result = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM `hospital_notice` WHERE hospital_no = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hospital_no);
			
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
						+" WHERE (h.hospital_name LIKE CONCAT('%', '"+ keyword +"', '%') OR ty.type_content LIKE CONCAT('%', '"+ keyword +"', '%')) "
						+" AND h.hospital_whether = 'Y'";
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
						+ " WHERE (h.hospital_name LIKE CONCAT('%', '" + keyword + "', '%') OR ty.type_content LIKE CONCAT('%', '" + keyword + "', '%')) AND h.hospital_whether = 'Y' GROUP BY de.hospital_no";
			}
			
			sql += " LIMIT " + option.getLimitPageNo() + ", " + option.getNumPerPage();
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Hospital resultVo = new Hospital(rs.getInt("hospital_no"), rs.getString("hospital_name"),
						rs.getString("hospital_phone"), rs.getString("hospital_addr"), rs.getInt("hospital_doctor_num"),
						rs.getString("hospital_homepage"), rs.getString("hospital_new_license"),
						rs.getString("hospital_org_license"), rs.getString("hospital_new_registration"), 
						rs.getString("hospital_org_registration") , rs.getString("hospital_time") , 
						rs.getString("hospital_lunch_time"),rs.getString("hospital_whether"),
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
	
	public List<HospitalType> getHospitalType(Connection conn) {
		List<HospitalType> result = new ArrayList<HospitalType>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM hospital_type";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				HospitalType resultVo = new HospitalType(rs.getInt("type_no"), rs.getString("type_content"));
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
