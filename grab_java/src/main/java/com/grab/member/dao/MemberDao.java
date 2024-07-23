package com.grab.member.dao;

import static com.grab.common.sql.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.grab.common.sql.JDBCTemplate;
import com.grab.member.vo.Member;


public class MemberDao {

	// 로그인
	public Member loginMember(Member m, Connection conn) {
		Member result = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM `member` WHERE `member_id` = ? AND `member_pw` = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getMember_id());
			pstmt.setString(2, m.getMember_pw());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = new Member(
						rs.getInt("member_no"),
						rs.getString("member_id"),
						rs.getString("member_pw"),
						rs.getString("member_email"),
						rs.getInt("member_type"),
						rs.getTimestamp("member_login_time").toLocalDateTime()
						);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}



	// 회원가입
	public int createMember(Member m, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			String sql = "INSERT INTO `member` (member_id,member_pw,member_email,  member_type)"
					+ "VALUES (?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getMember_id());
			pstmt.setString(2, m.getMember_pw());
			pstmt.setString(3, m.getMember_email());
			pstmt.setInt(4, m.getMember_type());

			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	// (회원가입) 아이디 중복확인
	// CheckIdServlet
	public Member selectById(String id, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		try {
			String sql = "SELECT * FROM `member` WHERE member_id= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				m = new Member(rs.getInt("member_no")
						,rs.getString("member_id")
						,rs.getString("member_pw")
						,rs.getString("member_email")
						,rs.getInt("member_type")
						,rs.getTimestamp("member_login_time").toLocalDateTime()
						);

			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}

	// 아이디 찾기
	public Member searchId(Connection conn, String email) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from `member` where member_email=? ";
		Member m = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			while(rs.next()){
				m = new Member();
				m.setMember_no(rs.getInt("member_no"));
				m.setMember_id(rs.getString("member_id"));
				m.setMember_pw(rs.getString("member_pw"));
				m.setMember_email(rs.getString("member_email"));
				m.setMember_type(rs.getInt("member_type"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rs);
		}	

		return m;
	}
	

	// 비밀번호 찾기
	public Member searchPw(Connection conn, String id, String email) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from `member` where member_id=? and email=?";
		Member m = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			while(rs.next()){
				m = new Member();
				m.setMember_no(rs.getInt("member_no"));
				m.setMember_id(rs.getString("member_id"));
				m.setMember_pw(rs.getString("member_pw"));
				m.setMember_email(rs.getString("member_email"));
				m.setMember_type(rs.getInt("member_type"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rs);
		}	
		return m;
	}

	// 비번 변경
	public int editMember(Member m, Connection conn) {
		int result = 0;

		return result;
	}


} 