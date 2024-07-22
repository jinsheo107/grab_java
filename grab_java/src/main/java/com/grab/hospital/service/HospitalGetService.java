package com.grab.hospital.service;

import static com.grab.common.sql.JDBCTemplate.close;
import static com.grab.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.grab.hospital.dao.HospitalGetDao;
import com.grab.hospital.dao.ReviewDao;
import com.grab.hospital.vo.Department;
import com.grab.hospital.vo.Hospital;
import com.grab.hospital.vo.HospitalNotice;
import com.grab.hospital.vo.HospitalType;
import com.grab.hospital.vo.Review;
import com.grab.member.vo.Member;

public class HospitalGetService {
	
	public Hospital getHospital(int hospital_no) {
		Connection conn = getConnection();
		
		Hospital result = new HospitalGetDao().getHospital(hospital_no, conn);
		close(conn);
		
		return result;
		
	}
	
	public Member getMember(int member_no) {
		Connection conn = getConnection();
		
		Member result = new HospitalGetDao().getMember(member_no, conn);
		close(conn);
		
		return result;
	}
	
	public List<Member> getMemberList(List<Review> reviewList) {
		Connection conn = getConnection();
		
		List<Member> result = new HospitalGetDao().getMemberList(reviewList, conn);
		close(conn);
		
		return result;
	}

	public List<Department> getDepartment(int hospital_no) {
		Connection conn = getConnection();

		List<Department> result = new HospitalGetDao().getDepartment(hospital_no, conn);
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
	
	public List<HospitalType> getHospitalType() {
		Connection conn = getConnection();
		
		List<HospitalType> result = new HospitalGetDao().getHospitalType(conn);
		close(conn);
		
		return result;
	}
	
	public Map<String, Object> getStarType(int hospital_no) {
		Connection conn = getConnection();
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		List<Department> departmentResult = new HospitalGetDao().getDepartment(hospital_no, conn);
		List<Review> reviewResult = new ReviewDao().getReviewList(hospital_no, conn);
		
		result.put("departmentList", departmentResult);
		result.put("reviewList", reviewResult);
		
		close(conn);
		
		return result;
	}
}
