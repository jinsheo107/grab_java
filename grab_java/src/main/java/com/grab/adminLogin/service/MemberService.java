package com.grab.adminLogin.service;

import static com.grab.common.JDBCTemplate.close;
import static com.grab.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.grab.adminLogin.dao.MemberDao;
import com.grab.adminLogin.vo.Member;

public class MemberService {
	public Member loginMember(String id, String pw) {
		Connection conn = getConnection();
		
		Member result = new MemberDao().loginMember(id, pw, conn);
		close(conn);
		
		return result;
	}

}
