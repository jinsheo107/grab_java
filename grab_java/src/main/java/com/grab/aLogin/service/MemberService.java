package com.grab.aLogin.service;

import static com.grab.common.sql.JDBCTemplate.close;
import static com.grab.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.grab.aLogin.dao.MemberDao;
import com.grab.aLogin.vo.Member;

public class MemberService {
	public Member loginMember(String id, String pw) {
		Connection conn = getConnection();
		
		Member result = new MemberDao().loginMember(id, pw, conn);
		close(conn);
		
		return result;
	}

}
