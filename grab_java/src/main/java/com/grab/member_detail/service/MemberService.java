package com.grab.member_detail.service;

import static com.grab.common.sql.JDBCTemplate.close;
import static com.grab.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.grab.hospital_detail.vo.Department;
import com.grab.hospital_detail.vo.Hospital;
import com.grab.member_detail.dao.MemberDao;
import com.grab.member_detail.vo.Member;

public class MemberService {
	public Member loginMember(String id, String pw) {
		Connection conn = getConnection();

		Member result = new MemberDao().loginMember(id, pw, conn);
		close(conn);

		return result;
	}

	public Hospital loginHospital(int no) {
		Connection conn = getConnection();

		Hospital result = new MemberDao().loginHospital(no, conn);
		close(conn);

		return result;
	}
	

}
