package com.grab.aLogin.dao;

import static com.grab.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.grab.aLogin.vo.Member;

public class MemberDao {
	public Member loginMember(String id, String pw, Connection conn) {
		Member result = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM `member` WHERE `member_id`= ? AND `member_pw`=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = new Member(rs.getString("member_id"),
									rs.getString("member_pw"),
									rs.getString("member_email"),
									rs.getInt("member_type"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return result;
	}
}
