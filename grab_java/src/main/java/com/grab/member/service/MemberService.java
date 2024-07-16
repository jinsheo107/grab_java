package com.grab.member.service;

import static com.grab.common.sql.JDBCTemplate.close;
import static com.grab.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.grab.hopital.vo.Hospital;
import com.grab.member.dao.MemberDao;
import com.grab.member.vo.Member;

public class MemberService {
	public Member loginMember(String id, String pw) {
		Connection conn = getConnection();
		
		Member result = new MemberDao().loginMember(id, pw, conn);
		close(conn);
		
		return result;
	}
	
	public Hospital loginHospital (int no){
		Connection conn = getConnection();
		
		Hospital result = new MemberDao().loginHospital(no, conn);
		close(conn);
		
		return result;
	}
}
