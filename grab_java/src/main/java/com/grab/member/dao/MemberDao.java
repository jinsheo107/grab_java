package com.grab.member.dao;

import static com.grab.common.sql.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.grab.common.sql.JDBCTemplate;
import com.grab.hospital.vo.hospital_department;
import com.grab.member.vo.Member;

public class MemberDao {
	// 회원 생성 메서드
	public int createMember(Member m) {
		// 회원 정보를 데이터베이스에 삽입
		String sql = "INSERT INTO `member` (member_id, member_pw, member_email, member_type) VALUES (?, ?, ?, ?)";
		int result = 0;
		try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, m.getMember_id());
			pstmt.setString(2, m.getMember_pw());
			pstmt.setString(3, m.getMember_email());
			pstmt.setInt(4, m.getMember_type());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	// (아이디) 이메일로 회원 찾기 메서드
	public List<Member> findMembersByEmail(String email) {

		List<Member> members = new ArrayList<>();
		String sql = "SELECT * FROM `member` WHERE member_email = ?";
		try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, email);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Member member = new Member(rs.getInt("member_no"), rs.getString("member_id"), rs.getString("member_pw"),
						rs.getString("member_email"), rs.getInt("member_type"),
						rs.getTimestamp("member_login_time").toLocalDateTime());
				members.add(member);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return members;
	}

	// (비밀번호) 아이디로 회원 찾기 메서드
	public Member findMemberById(String memberId) {

		Member member = null;
		String sql = "SELECT * FROM `member` WHERE member_id = ?";
		try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, memberId);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				member = new Member(rs.getInt("member_no"), rs.getString("member_id"), rs.getString("member_pw"),
						rs.getString("member_email"), rs.getInt("member_type"),
						rs.getTimestamp("member_login_time").toLocalDateTime());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return member;
	}

	// 비밀번호 업데이트 메서드
	public boolean updatePassword(String memberId, String newPassword) {

		String sql = "UPDATE `member` SET member_pw = ? WHERE member_id = ?";
		int result = 0; // 실행 결과를 저장할 변수
		try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, newPassword);
			pstmt.setString(2, memberId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result > 0;
	}

	// DB 연결
	private Connection getConnection() {
		// 실제로는 적절한 데이터베이스 연결 로직을 작성
		return null;
	}

	// 병원 관련

	//////////////////////////////////////////////////

	// 병원 사용자
	// 아이디 중복값
	/*
	 * public int isUsernameTaken(String member_id, Connection conn) { int result =
	 * 0;
	 * 
	 * PreparedStatement pstmt = null; ResultSet rs = null;
	 * 
	 * String sql = "SELECT COUNT(*) cnt FROM member WHERE member_id = ?";
	 * 
	 * try { pstmt = conn.prepareStatement(sql); pstmt.setString(1, member_id); rs =
	 * pstmt.executeQuery();
	 * 
	 * if (rs.next()) { result = rs.getInt("cnt"); } } catch (SQLException e) {
	 * e.printStackTrace(); } // close(rs); // close(pstmt);
	 * 
	 * return result; }
	 */
	
	public Member selectById1(String id, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		try {
			String sql = "SELECT * FROM `member` WHERE member_id= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				m = new Member(rs.getInt("member_no")
						,rs.getString("member_id")
						,rs.getString("member_pw")
						,rs.getString("member_email")
						,rs.getInt("member_type")
						,rs.getTimestamp("member_login_time").toLocalDateTime()
						);

			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}


	//  마이 페이지 비밀번호 변경

	 public int changePassword(Member m, Connection conn) {
	        PreparedStatement pstmt = null;
	        int result = 0;
	        String sql = "UPDATE Member SET member_pw = ? WHERE member_id = ?";
	        try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, m.getMember_pw());
	            pstmt.setString(2, m.getMember_id());
	            result = pstmt.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            JDBCTemplate.close(pstmt);
	        }
	        return result;
	    }
	    public Member getMemberById(String memberId, Connection conn) {
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        Member member = null;
	        String sql = "SELECT * FROM Member WHERE member_id = ?";
	        try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, memberId);
	            rs = pstmt.executeQuery();
	            if (rs.next()) {
	                member = new Member();
	                member.setMember_no(rs.getInt("member_no"));
	                member.setMember_id(rs.getString("member_id"));
	                member.setMember_pw(rs.getString("member_pw"));
	                member.setMember_email(rs.getString("member_email"));
	                member.setMember_type(rs.getInt("member_type"));
	                member.setMember_login_time(rs.getTimestamp("member_login_time").toLocalDateTime());
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            JDBCTemplate.close(rs);
	            JDBCTemplate.close(pstmt);
	        }
	        return member;
	    }    
	

	// 아이디 찾기
	public String hospitalIdSearch(String email, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String result = null;

		try {
			String sql = "SELECT member_id FROM member WHERE member_email = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getString("member_id");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	// 비밀번호 찾기
	public Member findMemberByNameAndEmail(String name, String email, Connection conn) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM Member WHERE member_name = ? AND member_email = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				member = new Member();
				member.setMember_id(rs.getString("member_id"));
				member.setMember_email(rs.getString("member_email"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return member;
	}
	
	// 로그인
	public Member login(String userId, String userPw, Connection conn) {
        Member member = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM Member WHERE member_id = ? AND member_pw = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            pstmt.setString(2, userPw);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                member = new Member();
                member.setMember_id(rs.getString("member_id"));
                member.setMember_pw(rs.getString("member_pw"));
                member.setMember_email(rs.getString("member_email"));
   
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }

        return member;
    }

	// 회원 탈퇴
	public int deleteHospitalMember(Member m, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			String sql = "DELETE FROM Member m JOIN hospital h on m.hospital_no = h.hospital_no WHERE member_id = ?, member_pw = ?, member_email = ?, member_type = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getMember_id());
			pstmt.setString(2, m.getMember_pw());
			pstmt.setString(3, m.getMember_email());
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	
	// 아이디 중복
	public Member checkDuplicateUserId(String userId, Connection conn) {
		Member user = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM member WHERE member_id = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                user = new Member();
                user.setMember_id(rs.getString("member_id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }
        return user;
    }
	
    public int insertMember(Member member, Connection conn) {
        PreparedStatement pstmt = null;
        int result = 0;
        String sql = "INSERT INTO member (member_id, member_pw, member_email, member_type) VALUES (?, ?, ?, 3)"; 

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, member.getMember_id());
            pstmt.setString(2, member.getMember_pw());
            pstmt.setString(3, member.getMember_email());
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }

        return result;
    }

    public int getLastInsertId(Connection conn) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int lastId = 0;
        String sql = "SELECT LAST_INSERT_ID()";

        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                lastId = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }

        return lastId;
    }

   
}
	


	


