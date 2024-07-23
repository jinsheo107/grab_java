package com.grab.member.service;

import java.sql.Connection;

import  static com.grab.common.sql.JDBCTemplate.close;
import  static com.grab.common.sql.JDBCTemplate.getConnection;

import com.grab.common.sql.JDBCTemplate;
import com.grab.member.dao.MemberDao;
import com.grab.member.vo.Member;

public class MemberService {

	// 로그인
	public Member loginMember(String id, String pw) {
		Member m = new Member();
		m.setMember_id(id);
		m.setMember_pw(pw);

		Connection conn = getConnection();

		Member result = new MemberDao().loginMember(m, conn);
		return result;
	}


	// 회원가입
	public int createMember(Member m) {
		Connection conn = getConnection();
		int result = new MemberDao().createMember(m,conn);
		close(conn);
		return result;

	}

	// (회원가입) 아이디 중복 확인
	public Member selectById(String id) {
		Connection conn = getConnection();
		Member u = new MemberDao().selectById(id,conn);
		close(conn);
		return u;
	}

	// 아이디 찾기
	public Member searchId(String email) {

		Connection conn = getConnection();
		MemberDao dao = new MemberDao();
		Member m = dao.searchId(conn, email);
		close(conn);

		System.out.println("m : " + m);
		return m;
	}
	
	//비밀번호 찾기
		public Member searchPw(String id, String email) {
			Connection conn = getConnection();
			MemberDao dao = new MemberDao();
			Member m = dao.searchPw(conn, id, email);
			close(conn);
			

			System.out.println("service : " + m);
			return m;
		}
		

	// 비번변경
	public int editUser(int memberNo, String pw) {
		Member m = new Member();
		m.setMember_no(memberNo);
		m.setMember_pw(pw);

		Connection conn = getConnection();
		int result = new MemberDao().editMember(m, conn);
		close(conn);return result;

	}


}
