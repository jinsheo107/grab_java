package com.grab.hospital.service;


import static com.grab.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.SQLException;

import com.grab.common.sql.JDBCTemplate;
import com.grab.hospital.dao.HospitalDao;
import com.grab.hospital.vo.Hospital;
import com.grab.hospital.vo.hospital_department;
import com.grab.member.dao.MemberDao;
import com.grab.member.vo.Member;

import com.grab.hospital.dao.HospitalDepartmentDao;



public class HospitalService {

	// 회원 가입
	/*
	 * public int createHospitalUser(Hospital h, Member m) { Connection conn =
	 * getConnection(); MemberDao memberDao = new MemberDao(); HospitalDao
	 * hospitalDao = new HospitalDao(); HospitalDepartmentDao departmentDao = new
	 * HospitalDepartmentDao();
	 * 
	 * int result1 = memberDao.insertMember(m, conn); if (result1 > 0) { int
	 * memberNo = memberDao.getLastInsertId(conn); h.setHospital_no(memberNo);
	 * hospital_department department = new hospital_department();
	 * department.setHospital_no(memberNo);
	 * 
	 * int result2 = hospitalDao.insertHospital(h, conn); int result3 =
	 * departmentDao.insertHospitalDepartment(department, conn);
	 * 
	 * if (result2 > 0 && result3 > 0) { JDBCTemplate.commit(conn); return 1; } else
	 * { JDBCTemplate.rollback(conn); return 0; } } else {
	 * JDBCTemplate.rollback(conn); return 0; } }
	 */

	// 기존 가입 회원 검사
	   public boolean isExistingMember(String memberId, String memberEmail) {
	       Connection conn = JDBCTemplate.getConnection();
	       boolean isExisting = false;
	       try {
	           isExisting = new HospitalDao().isExistingMember(memberId, memberEmail, conn);
	       } catch (SQLException e) {
	           e.printStackTrace();
	       } finally {
	           JDBCTemplate.close(conn);
	       }
	       return isExisting;
	   }

    // 진료과 3개 미만
    public int saveSpecialties(Hospital h, String[] specialties) {
        Connection conn = JDBCTemplate.getConnection();
        int result = 0;
        try {
            result = new HospitalDao().saveSpecialties(h, specialties, conn);
            if (result > 0) {
                JDBCTemplate.commit(conn);
            } else {
                JDBCTemplate.rollback(conn);
            }
        } catch (SQLException e) {
            JDBCTemplate.rollback(conn);
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(conn);
        }
        return result;
    }
    // 파일 등록 
    public int saveHospitalFile(int hospitalNo, String newLicense, String orgLicense, String newRegistration, String orgRegistration) {
        Connection conn = JDBCTemplate.getConnection();
        int result = 0;
        try {
            result = new HospitalDao().saveHospitalFile(hospitalNo, newLicense, orgLicense, newRegistration, orgRegistration, conn);
            if (result > 0) {
                JDBCTemplate.commit(conn);
            } else {
                JDBCTemplate.rollback(conn);
            }
        } catch (SQLException e) {
            JDBCTemplate.rollback(conn);
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(conn);
        }
        return result;
    }

	// 마이페이지 병원 리뷰
//	public List<Review> getReviewsByHospitalNo(int hospitalNo) {
//		
//		return ReviewDAO.getReviewByHospitalNo(HospitalNo);
//	}
	
    
    
}
