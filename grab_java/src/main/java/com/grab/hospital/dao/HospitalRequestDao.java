package com.grab.hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import static com.grab.common.sql.JDBCTemplate.close;

public class HospitalRequestDao {
	public int createRequest(String re, String rt, Connection conn) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "INSERT INTO `amendment_request` (hospital_no, member_no, request_element, request_content)"
					+"VALUES (?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 1);
			pstmt.setInt(2, 2);
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
