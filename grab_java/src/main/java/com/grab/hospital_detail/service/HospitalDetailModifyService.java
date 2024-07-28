package com.grab.hospital_detail.service;

import static com.grab.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.grab.hospital_detail.dao.HospitalDetailModifyDao;
import com.grab.hospital_detail.vo.Hospital;
import com.grab.hospital_detail.vo.HospitalModifyRequest;

import static com.grab.common.sql.JDBCTemplate.close;

public class HospitalDetailModifyService {

	public int detailModify(int hospital_no, String hospital_time, String hospital_lunch_time, int doctor_num, String hospital_phone, String[] selectedTypes) {
		Connection conn = getConnection(); 
		int result = new HospitalDetailModifyDao().detailModify(hospital_no, hospital_time, hospital_lunch_time, doctor_num, hospital_phone, selectedTypes, conn);
		
		close(conn);
	
		return result; 
	}
	 
}
