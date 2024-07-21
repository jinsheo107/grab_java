package com.grab.member.dao;

import static com.grab.common.sql.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.grab.hospital.vo.Department;
import com.grab.hospital.vo.Hospital;
import com.grab.member.vo.Member;

public class MemberDao {
	public Member loginMember(String id, String pw, Connection conn) {
		Member result = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT * FROM `member` WHERE `member_id` = ? AND `member_pw` = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = new Member(rs.getInt("member_no"),
						rs.getString("member_id"), rs.getString("member_pw"),
						rs.getString("member_email"), rs.getInt("member_type"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	public Hospital loginHospital(int no, Connection conn) {
		Hospital result = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM `hospital` WHERE `hospital_no` = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			
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
			
			String departmetSql = "SELECT * FROM `hospital_department` WHERE `hospital_no` = ?";
			
			pstmt = conn.prepareStatement(departmetSql);
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				new Department();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return result;
	}
	
	
}
