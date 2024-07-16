package com.grab.hopital.service;

import static com.grab.common.sql.JDBCTemplate.getConnection;
import static com.grab.common.sql.JDBCTemplate.close;

import java.sql.Connection;

import com.grab.hopital.dao.HospitalRequestDao;

public class HospitalRequestService {
	public int createRequest(String re, String rt) {
		Connection conn = getConnection();
		
		int result = new HospitalRequestDao().createRequest(re, rt, conn);
		close(conn);
		
		return result;
	}
}
