package com.grab.hospital.service;

import static com.grab.common.sql.JDBCTemplate.close;
import static com.grab.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.grab.hospital.dao.HospitalGetDao;
import com.grab.hospital.vo.Department;
import com.grab.hospital.vo.HospitalPrice;

public class HospitalGetService {

	public List<Department> getDepartment(int no) {
		Connection conn = getConnection();

		List<Department> result = new HospitalGetDao().getDepartment(no, conn);
		close(conn);

		return result;
	}
	
	public List<HospitalPrice> getPrice(int no) {
		Connection conn = getConnection();
		
		List<HospitalPrice> result = new HospitalGetDao().getPrice(no, conn);
		close(conn);
		
		return result;
	}
}
