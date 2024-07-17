package com.grab.hospital.dao;

import static com.grab.common.sql.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.mariadb.jdbc.export.Prepare;

import com.grab.hospital.vo.Department;
import com.grab.hospital.vo.HospitalPrice;

public class HospitalGetDao {
	public List<Department> getDepartment(int no, Connection conn) {
		List<Department> result = new ArrayList<Department>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {			
			String departmetSql = "SELECT hospital_no, type_content FROM `hospital_department` hd JOIN `hospital_type` hy ON hd.type_no = hy.type_no WHERE hospital_no = ?";
			
			pstmt = conn.prepareStatement(departmetSql);
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Department resultVo = new Department(rs.getInt("hospital_no"), rs.getString("type_content"));
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
			
			while(rs.next()) {
				HospitalPrice resultVo = new HospitalPrice(rs.getInt("price_no"), rs.getInt("hospital_no"),
						rs.getString("type"), rs.getInt("price"));
				
				result.add(resultVo);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return result;
	}
}
