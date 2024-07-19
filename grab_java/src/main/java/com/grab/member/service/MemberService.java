package com.grab.member.service;

import java.sql.Connection;

import static com.grab.common.sql.JDBCTemplate.getConnection;
import static com.grab.common.sql.JDBCTemplate.close;

import com.grab.member.dao.MemberDao;
import com.grab.member.vo.Member;

public class MemberService {
	public Member loginMember(String id, String pw) {
		Connection conn = getConnection();
		
		Member result = new MemberDao().loginMember(id, pw, conn);
		close(conn);
		
		return result;
	}
	
	public int hospitalIdSearch(Member m) {
		
	}
}
