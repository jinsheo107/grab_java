package com.grab.hospital_detail.service;

import static com.grab.common.sql.JDBCTemplate.close;
import static com.grab.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.grab.hospital_detail.dao.HospitalGetDao;
import com.grab.hospital_detail.dao.ReviewDao;
import com.grab.hospital_detail.vo.Department;
import com.grab.hospital_detail.vo.Hospital;
import com.grab.hospital_detail.vo.HospitalNotice;
import com.grab.hospital_detail.vo.HospitalType;
import com.grab.hospital_detail.vo.Review;
import com.grab.member_detail.vo.Member;

public class HospitalGetService {
	
	// 병원 상세 정보
	public Hospital getHospital(int hospital_no) {
		Connection conn = getConnection();
		
		Hospital result = new HospitalGetDao().getHospital(hospital_no, conn);
		close(conn);
		
		return result;
		
	}
	
	// 사용자 정보
	public Member getMember(int member_no) {
		Connection conn = getConnection();
		
		Member result = new HospitalGetDao().getMember(member_no, conn);
		close(conn);
		
		return result;
	}
	
	// 리뷰를 작성한 사용자 리스트
	public List<Member> getMemberList(List<Review> reviewList) {
		Connection conn = getConnection();
		
		List<Member> result = new HospitalGetDao().getMemberList(reviewList, conn);
		close(conn);
		
		return result;
	}

	// 병원 진료과 리스트
	public List<Department> getDepartment(int hospital_no) {
		Connection conn = getConnection();

		List<Department> result = new HospitalGetDao().getDepartment(hospital_no, conn);
		close(conn);

		return result;
	}
	
	
	// 특정 병원의 리뷰에서 키워드
	public Map<String, Integer> getKeyword(List<Review> reviews) {
		Connection conn = getConnection();
		
		Map<String, Integer> map = new HospitalGetDao().getKeyword(reviews, conn);
		
		close(conn);
		
		return map;
	}
	
	// 병원 공지사항 리스트
	public List<HospitalNotice> getNotice(int no) {
		Connection conn = getConnection();
		
		List<HospitalNotice> result = new HospitalGetDao().getNotice(no, conn);
		
		close(conn);
		
		return result;
	}
	
	// 병원 키워드 검색 시 해당하는 병원의 수
	public int selectHospitalCount(String keyword) {
		Connection conn = getConnection();
		
		int result = new HospitalGetDao().selectHospitalCount(keyword, conn);
		
		close(conn);
		
		return result;
	}
	
	// 검색 시 키워드에 해당하는 병원의 리스트
	public List<Hospital> selectHospitalList(String keyword, Hospital option) {
		Connection conn = getConnection();
		
		List<Hospital> result = new HospitalGetDao().selectHospitalList(keyword, option, conn);
		close(conn);
		
		return result;
	}
	
	// 병원의 타입 출력(병원 정보 수정)
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
