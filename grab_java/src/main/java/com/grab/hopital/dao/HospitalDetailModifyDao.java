package com.grab.hopital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import static com.grab.common.sql.JDBCTemplate.close;

public class HospitalDetailModifyDao {
	public int essentail_modify(String hn, String dn, String ha, Connection conn) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = "UPDATE `hospital` "
					+"SET hospital_name = ?, hospital_addr = ?, "
					+"hospital_doctor_num = ? WHERE hospital_no = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hn);
			pstmt.setString(2, ha);
			pstmt.setString(3, dn);
			pstmt.setString(4, "1");
			
			result = pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
