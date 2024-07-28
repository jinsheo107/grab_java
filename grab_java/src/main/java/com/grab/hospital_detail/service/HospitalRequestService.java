package com.grab.hospital_detail.service;

import static com.grab.common.sql.JDBCTemplate.getConnection;
import static com.grab.common.sql.JDBCTemplate.close;

import java.sql.Connection;

import com.grab.hospital_detail.dao.HospitalRequestDao;

public class HospitalRequestService {
	public int createRequest(int member_no, int hospital_no, String re, String rt) {
		Connection conn = getConnection();
		
		int result = new HospitalRequestDao().createRequest(member_no, hospital_no, re, rt, conn);
		close(conn);
		
		return result;
	}
}
