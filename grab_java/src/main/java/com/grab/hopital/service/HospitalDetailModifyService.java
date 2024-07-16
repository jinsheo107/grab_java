package com.grab.hopital.service;

import static com.grab.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.grab.hopital.dao.HospitalDetailModifyDao;
import com.grab.hopital.vo.Hospital;

public class HospitalDetailModifyService {
	public int essentail_modify(String hn, String dn, String ha, Hospital h) {
		
		Connection conn = getConnection();
		int result = new HospitalDetailModifyDao().essentail_modify(hn, dn, ha, conn, h);
		
		return result;
	}
}
