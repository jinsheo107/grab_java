package com.grab.member.service;

import java.sql.Connection;

import static com.grab.common.sql.JDBCTemplate.getConnection;
import static com.grab.common.sql.JDBCTemplate.close;

import com.grab.common.sql.JDBCTemplate;
import com.grab.member.dao.MemberDao;
import com.grab.member.vo.Member;

public class MemberService {
//	public Member loginMember(String id, String pw) {
//		Connection conn = getConnection();
//		
//		Member result = new MemberDao().loginMember(id, pw, conn);
//		close(conn);
//		
//		return result;
//	}
//	
//	public int hospitalIdSearch(Member m) {
//		
//	}
	
	
	/////////////////////////////////////
	// 병원 사용자
	// 아이디 중복값
//	    public int checkDuplicateId(String member_id) {
//	        Connection conn = JDBCTemplate.getConnection();
//	        int result = new MemberDao().isUsernameTaken(member_id, conn);
//	        JDBCTemplate.close(conn);
//	        return result;
//	    }
	
	// 비밀번호 변경
	       public int changePassword(Member m) {
	           Connection conn = JDBCTemplate.getConnection();
	           int result = new MemberDao().changePassword(m, conn);
	           if (result > 0) {
	               JDBCTemplate.commit(conn);
	           } else {
	               JDBCTemplate.rollback(conn);
	           }
	           JDBCTemplate.close(conn);
	           return result;
	       }
	        public Member getMemberById(String memberId) {
	            Connection conn = JDBCTemplate.getConnection();
	            Member member = new MemberDao().getMemberById(memberId, conn);
	            JDBCTemplate.close(conn);
	            return member;
	       }
	    
	    
	    
	    
	// 아이디 찾기
	    public String hospitalIdSearch(String email) {
	        Connection conn = JDBCTemplate.getConnection();
	        String result = new MemberDao().hospitalIdSearch(email, conn);
	        JDBCTemplate.close(conn);
	        return result;
	    }
	// 비밀번호 찾기
	        public Member findMemberByNameAndEmail(String name, String email) {
	            Connection conn = getConnection();
	            Member member = new MemberDao().findMemberByNameAndEmail(name, email, conn);
	            close(conn);
	            return member;
	        }
	
	// 로그인
	        public Member login(String userId, String userPw) {
	            Connection conn = getConnection();
	            Member member = new MemberDao().login(userId, userPw, conn);
	            close(conn);
	            return member;
	        }
	// 회원 탈퇴
	        public int deleteHospitalMember(Member m) {
	            Connection conn = JDBCTemplate.getConnection();
	            int result = new MemberDao().deleteHospitalMember(m, conn);
	            if (result > 0) {
	                JDBCTemplate.commit(conn);
	            } else {
	                JDBCTemplate.rollback(conn);
	            }
	            JDBCTemplate.close(conn);
	            return result;
	        }
	       
	        // 아이디 중복
	       
	        public Member checkDuplicateUserId(String userId) {
	            Connection conn = getConnection();
	            Member result = new MemberDao().checkDuplicateUserId(userId, conn);
	            close(conn);
	            return result;
	        }
			
		}
			
	
		



