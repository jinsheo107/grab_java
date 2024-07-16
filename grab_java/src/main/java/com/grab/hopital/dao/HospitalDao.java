package com.grab.hopital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import com.gn.hospital.vo.Hospital;
import static com.gn.common.sql.JDBCTemplate.close;

public class HospitalDao {

	public int createHospitalUser(Hospital h, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			String sql = "INSERT INTO `Hospital`(`hospital_registration`,`hospital_license`,`hospital_name`,`hospital_number`,`hospital_addr`,`hospital_doctor_num`,`hospital_homepage`,`hospital_mapping`,`hospital_time`,`hospital_price`,`hospital_view`,`hospital_login`) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, h.getHospital_registration());
			pstmt.setString(2, h.getHospital_license());
			pstmt.setString(3, h.getHospital_name());
			pstmt.setString(4,h.getHospital_number());
			pstmt.setString(5,h.getHospital_addr());
			pstmt.setInt(6,h.getHospital_doctor_num());
			pstmt.setString(7,h.getHospital_homepage());
			pstmt.setInt(8,h.getHospital_mapping());
			pstmt.setString(9,h.getHospital_time());
			pstmt.setString(10,h.getHospital_price());
			pstmt.setInt(11,h.getHospital_view());
			pstmt.setInt(12,h.getHospital_login());
			
			result = pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateHospitalUser(Hospital h, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			
			String sql = "INSERT INTO `Hospital`(`hospital_registration`,`hospital_license`,`hospital_name`,`hospital_number`,`hospital_addr`,`hospital_doctor_num`,`hospital_homepage`,`hospital_mapping`,`hospital_time`,`hospital_price`,`hospital_view`,`hospital_login`) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, h.getHospital_registration());
			pstmt.setString(2, h.getHospital_license());
			pstmt.setString(3, h.getHospital_name());
			pstmt.setString(4,h.getHospital_number());
			pstmt.setString(5,h.getHospital_addr());
			pstmt.setInt(6,h.getHospital_doctor_num());
			pstmt.setString(7,h.getHospital_homepage());
			pstmt.setInt(8,h.getHospital_mapping());
			pstmt.setString(9,h.getHospital_time());
			pstmt.setString(10,h.getHospital_price());
			pstmt.setInt(11,h.getHospital_view());
			pstmt.setInt(12,h.getHospital_login());
			
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int idSearch(Hospital h, Connection conn) {
		
	}
	
	public int deleteHospitalMember(Hospital h, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			String sql = "DELETE FROM tbl_book WHERE bk_name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, h.getMember_pw());
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
}
