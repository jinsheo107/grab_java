package com.grab.admin.aLogin.service;

import static com.grab.common.JDBCTemplate.close;
import static com.grab.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.grab.admin.aLogin.dao.MemberDao;
import com.grab.admin.aLogin.vo.Member;

public class MemberService {
	public Member loginMember(String id, String pw) {
		Connection conn = getConnection();
		
		Member result = new MemberDao().loginMember(id, pw, conn);
		close(conn);
		
		return result;
	}

}
