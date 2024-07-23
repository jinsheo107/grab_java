package com.grab.admin.aInfo.dao;

import static com.grab.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.grab.admin.aInfo.vo.HospiInfo;

public class HospiInfoDao {
	
	// 페이징바
	public int selectHospiInfoCount(HospiInfo option, Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT COUNT(*) AS cnt FROM hospital";
			if(option.getHospital_name() != null) {
				sql += " WHERE hospital_name LIKE CONCAT('%','"+option.getHospital_name()+"','%')";
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
	
	
	// 리스트 출력(병원 정보 메인 화면)
	public List<HospiInfo> selectHospiInfoList(HospiInfo option, Connection conn){
		List<HospiInfo> list = new ArrayList<HospiInfo>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM hospital";
			if(option.getHospital_name() != null) {
				sql += " WHERE hospital_whether NOT IN ('Y', 'y')"
						+ " AND hospital_name LIKE CONCAT('%',?,'%')";
			}
			sql += " ORDER BY hospital_reg_date DESC";
			sql += " LIMIT " + option.getLimitPageNo() + ", " + option.getNumPerPage();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, option.getHospital_name());
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				HospiInfo resultVo = new HospiInfo(rs.getInt("hospital_no"),
											rs.getString("hospital_name"),
											rs.getString("hospital_phone"),
											rs.getString("hospital_addr"),
											rs.getInt("hospital_doctor_num"),
											rs.getString("hospital_homepage"),
											rs.getString("hospital_new_license"),
											rs.getString("hospital_org_license"),
											rs.getString("hospital_new_registration"),
											rs.getString("hospital_org_registration"),
											rs.getString("hospital_time"),
											rs.getString("hospital_lunch_time"),
											rs.getString("hospital_whether").charAt(0),
											rs.getInt("hospital_view"),
											rs.getInt("hospital_login"),
											rs.getTimestamp("hospital_reg_date").toLocalDateTime());
									list.add(resultVo);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	// 병원 상세 정보
	public HospiInfo viewHospiInfo(int hospital_no, Connection conn) {
		HospiInfo hi = new HospiInfo();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT `hospital_no`, `hospital_name`, `hospital_phone`, `hospital_addr`, `hospital_reg_date` "
					+ ", `hospital_homepage`, `hospital_org_license`, `hospital_org_registration` "
					+ "FROM hospital WHERE hospital_no = ?";
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hospital_no);
			rs = pstmt.executeQuery();
			
			 if(rs.next()) { 
				 hi.setHospital_no(rs.getInt("hospital_no"));
				 hi.setHospital_name(rs.getString("hospital_name"));
				 hi.setHospital_phone(rs.getString("hospital_phone"));
				 hi.setHospital_addr(rs.getString("hospital_addr"));
				 hi.setHospital_reg_date(rs.getTimestamp("hospital_reg_date").toLocalDateTime());
				 hi.setHospital_homepage(rs.getString("hospital_homepage"));
				 hi.setHospital_org_license(rs.getString("hospital_org_license"));
				 hi.setHospital_org_registration(rs.getString("hospital_org_registration"));
			 }
			 
			 
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs); 
			close(pstmt);
		}
		return hi;
	}
	
	public int permit(int hospital_no, Connection conn) {
		HospiInfo hi = new HospiInfo();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			
			String sql = "UPDATE `hospital` SET hospital_whether = 'y' WHERE hospital_no = ?";
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hospital_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) { 
				hi.setHospital_whether(rs.getString("hospital_whether").charAt(0));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs); 
			close(pstmt);
		}
		return result;
	}
}
