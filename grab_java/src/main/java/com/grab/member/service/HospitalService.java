package com.grab.member.service;


import static com.gn.common.sql.JDBCTemplate.close;
import static com.gn.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.gn.hospital.dao.HospitalDao;
import com.gn.hospital.vo.Hospital;

public class HospitalService {

	public int createHospitalUser(Hospital h) {
		Connection conn = getConnection();
		int result = new HospitalDao().createHospitalUser(h,conn);
		close(conn);
		return result;
	}
	
	public int updateHospitalUser(Hospital h) {
		Connection conn = getConnection();
		int result = new HospitalDao().updateHospitalUser(h,conn);
		close(conn);
		return result;
	}
}
