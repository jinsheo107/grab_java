package com.grab.hopital.service;

import static com.grab.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.grab.hopital.dao.HospitalDetailModifyDao;

public class HospitalDetailModifyService {
	public int essentail_modify(String hn, String dn, String ha) {
		
		Connection conn = getConnection();
		int result = new HospitalDetailModifyDao().essentail_modify(hn, dn, ha, conn);
		
		return result;
	}
}
