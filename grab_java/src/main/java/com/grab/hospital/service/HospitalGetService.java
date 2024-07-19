package com.grab.hospital.service;

import static com.grab.common.sql.JDBCTemplate.close;
import static com.grab.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.grab.hospital.dao.HospitalGetDao;
import com.grab.hospital.vo.Department;
import com.grab.hospital.vo.Hospital;
import com.grab.hospital.vo.HospitalNotice;
import com.grab.hospital.vo.HospitalPrice;
import com.grab.hospital.vo.Review;

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
	
	public Map<String, Integer> getKeyword(List<Review> reviews) {
		Connection conn = getConnection();
		
		Map<String, Integer> map = new HospitalGetDao().getKeyword(reviews, conn);
		
		close(conn);
		
		return map;
	}
	
	public List<HospitalNotice> getNotice(int no) {
		Connection conn = getConnection();
		
		List<HospitalNotice> result = new HospitalGetDao().getNotice(no, conn);
		
		close(conn);
		
		return result;
	}
	
	public int selectHospitalCount(String keyword) {
		Connection conn = getConnection();
		
		int result = new HospitalGetDao().selectHospitalCount(keyword, conn);
		
		close(conn);
		
		return result;
	}
	
	public List<Hospital> selectHospitalList(String keyword, Hospital option) {
		Connection conn = getConnection();
		
		List<Hospital> result = new HospitalGetDao().selectHospitalList(keyword, option, conn);
		close(conn);
		
		return result;
	}
}
