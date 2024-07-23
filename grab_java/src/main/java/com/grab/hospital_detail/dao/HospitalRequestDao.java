package com.grab.hospital_detail.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import static com.grab.common.sql.JDBCTemplate.close;

public class HospitalRequestDao {
	public int createRequest(int member_no, int hospital_no, String re, String rt, Connection conn) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = "INSERT INTO `hospital_request` (hospital_no, member_no, request_element, request_content)"
					+"VALUES (?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hospital_no);
			pstmt.setInt(2, member_no);
			pstmt.setString(3, re);
			pstmt.setString(4, rt);
			
			result = pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
