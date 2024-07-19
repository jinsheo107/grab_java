package com.grab.hopital.service;


import static com.grab.common.sql.JDBCTemplate.close;
import static com.grab.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.grab.hopital.dao.HospitalDao;
import com.grab.hopital.vo.Hospital;
import com.grab.member.vo.Member;
import com.grab.member.dao.MemberDao;



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
	
	public int hospitalIdSearch(Member m) {
		Connection conn = getConnection();
		int result = new HospitalDao().hospitalIdSearch(m,conn);
		close(conn);
		return result;
	}
	
	public int hospitalPwSearch(Member m) {
		Connection conn = getConnection();
		int result = new HospitalDao().hospitalPwSearch(m, conn);
		close(conn);
		return result;
	}
	
	public int deleteHospitalMember(Member m) {
		Connection conn = getConnection();
		int result = new HospitalDao().deleteHospitalMember(m, conn);
		close(conn);
		return result;
	}
	
	public int hospitalPwChange(Member m) {
		Connection conn = getConnection();
		int result = new HospitalDao().hospitalPwChange(m, conn);
		close(conn);
		return result;
	}
	
	public int checkMemberId(Member m) {
		Connection conn = getConnection();
		int result = new HospitalDao().hospitalPwChange(m, conn);
		close(conn);
		return result;
	}
	
	// 이메일 인증 코드
//	public static boolean sendAutoCode(String email) {
//		
//		String authCode = generateAuthCode();
//		boolean isEmailSent = EmailSender.sendEmail(email, authCode);
//		
//		if(isEmailSent) {
//			HospitalDao.saveAuthCode(email, authCode);
//			return true;
//		}
//		return false;
//	}
//	
//	public static boolean verifyAuthCode(String code) {
//		return HospitalDao.isAuthCodeValid(code);
//	}
//	
//	private boolean validateAuthCode(String authCode) {
//	       
//        String savedAuthCode = getSavedAuthCode(); 
//        return authCode.equals(savedAuthCode);
//    }
//	
//	private static int generateAuthCode() {
//		return 123456;
//	}
	
	// 회원 정보(의사면허증, 사업자등록증) 관리자 전달
	public static List<Hospital> saveHospitalRequest(Hospital h) {
		Connection conn = getConnection();
		List<Hospital> list = new HospitalDao().saveHospitalRequest(h, conn);
		close(conn); 
		return list;
	}
}
