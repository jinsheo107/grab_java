package com.grab.hospital.dao;

import static com.grab.common.sql.JDBCTemplate.close;
import static com.grab.common.sql.JDBCTemplate.commit;
import static com.grab.common.sql.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class HospitalDetailModifyDao {
	public int detailModify(int hospital_no, String hospital_time, String hospital_lunch_time, int doctor_num, String hospital_phone, String[] selectedTypes, Connection conn) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			commit(conn);
			String hospitalUpdateSql = "UPDATE `hospital` "
					+"SET hospital_time = ?, hospital_lunch_time = ?, "
					+"hospital_doctor_num = ?, hospital_phone = ? WHERE hospital_no = ?";
			
			pstmt = conn.prepareStatement(hospitalUpdateSql);
			
			pstmt.setString(1, hospital_time);
			pstmt.setString(2, hospital_lunch_time);
			pstmt.setInt(3, doctor_num);
			pstmt.setString(4, hospital_phone);
			pstmt.setInt(5, hospital_no);
			
			result = pstmt.executeUpdate();
			
			if(result > 0) {
				String searchTypeSql = "SELECT COUNT(*) cnt FROM hospital_department WHERE hospital_no = ?";
				pstmt = conn.prepareStatement(searchTypeSql);
				pstmt.setInt(1, hospital_no);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					if(rs.getInt("cnt") > 0 && selectedTypes.length > 0) {
						String deleteTypeSql = "DELETE FROM hospital_department WHERE hospital_no = ?";
						pstmt = conn.prepareStatement(deleteTypeSql);
						pstmt.setInt(1, hospital_no);
						
						result = pstmt.executeUpdate();
						
						if(result > 0) {
							for(int i = 0; i < selectedTypes.length; i++) {
								String createTypeSql = "INSERT INTO hospital_department (type_no, hospital_no) VALUES (?, ?)";
								pstmt = conn.prepareStatement(createTypeSql);
								pstmt.setInt(1, Integer.parseInt(selectedTypes[i]));
								pstmt.setInt(2, hospital_no);
								
								result = pstmt.executeUpdate();
							}
						}
					} else if(rs.getInt("cnt") == 0) {
						for(int i = 0; i < selectedTypes.length; i++) {
							String createTypeSql = "INSERT INTO hospital_department (type_no, hospital_no) VALUES (?, ?) ";
							pstmt = conn.prepareStatement(createTypeSql);
							pstmt.setInt(1, Integer.parseInt(selectedTypes[i]));
							pstmt.setInt(2, hospital_no);
							
							result = pstmt.executeUpdate();
						}
					} else {
						result = -1;
					}
				}
			}
		} catch(Exception e) {
			rollback(conn);
			e.printStackTrace();
			
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return result;
	}
}
