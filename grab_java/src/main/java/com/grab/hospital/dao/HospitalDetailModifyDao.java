package com.grab.hospital.dao;

import static com.grab.common.sql.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.grab.hospital.vo.Hospital;
import com.grab.hospital.vo.HospitalModifyRequest;

public class HospitalDetailModifyDao {
	public int select_modify(HospitalModifyRequest modifyRequest, Connection conn) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = "UPDATE `hospital` "
					+"SET hospital_name = ?, hospital_addr = ?, "
					+"hospital_doctor_num = ? WHERE hospital_no = ?";
			
			
			
			result = pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
