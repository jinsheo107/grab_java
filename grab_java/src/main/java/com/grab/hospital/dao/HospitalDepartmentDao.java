package com.grab.hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.grab.common.sql.JDBCTemplate;
import com.grab.hospital.vo.hospital_department;

public class HospitalDepartmentDao {
	

	    public int insertHospitalDepartment(hospital_department department, Connection conn) {
	        PreparedStatement pstmt = null;
	        int result = 0;
	        String sql = "INSERT INTO hospital_department (type_no, hospital_no) VALUES (?, ?)";

	        try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, department.getType_no());
	            pstmt.setInt(2, department.getHospital_no());
	            result = pstmt.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            JDBCTemplate.close(pstmt);
	        }

	        return result;
	    }
	}


