package com.grab.hopital.dao;

import static com.grab.common.sql.JDBCTemplate.*;

import java.lang.reflect.Member;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.grab.common.sql.JDBCTemplate;
import com.grab.hopital.vo.Hospital; 



public class HospitalDao {
	// 회원 정보(의사면허증, 사업자등록증) 관리자 전달
	public List<Hospital> saveHospitalRequest(Hospital h, Connection conn) {
		List<Hospital> list = new ArrayList<Hospital>();
		PreparedStatement pstmt = null;

		try {
			String sql = "INSERT INTO `Hospital`(`hospital_registration`,`hospital_license`) VALUES (?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, h.getHospital_registration());
			pstmt.setString(2, h.getHospital_license());
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return list;
	}
	
//	public List<Hospital> getLicense(){
//		PreparedStatement pstmt = null;
//		try {
//			String sql = "SELECT * FROM hospital";
//			return JDBCTemplate.query(sql,Hospital.getHospital_registration(),Hospital.getHospital_license());
//			
//		} catch(Exception e) {
//			e.printStackTrace();
//		} finally {
//			close(pstmt);
//		}
//		
//	}

	// 회원가입
	// SQL 순서변경, MEMBER 기본 정보 - > 병원 기본 정보 -> 가격 이나 (폴인 키 확인) 
	
	// 인설
	    // 회원 정보(의사면허증, 사업자등록증) 관리자 전달
	    public int createHospitalUser(Hospital h, Connection conn) {
	        PreparedStatement pstmt = null;
	        int result = 0;
	        try {
	            // 트랜잭션 시작
	            conn.setAutoCommit(false);
	            // 첫 번째 쿼리
	            String sql1 = "INSERT INTO `Hospital`(`hospital_name`,`hospital_phone`,`hospital_addr`,`hospital_doctor_num`,`hospital_homepage`,`hospital_whether`,`hospital_view`) VALUES(?,?,?,?,?,?,?)";
	            pstmt = conn.prepareStatement(sql1);
	            pstmt.setString(1, h.getHospital_name());
	            pstmt.setString(2, h.getHospital_phone());
	            pstmt.setString(3, h.getHospital_addr());
	            pstmt.setInt(4, h.getHospital_doctor_num());
	            pstmt.setString(5, h.getHospital_homepage());
	            pstmt.setLong(6, h.getHospital_whether());
	            pstmt.setInt(7, h.getHospital_view());
	            result += pstmt.executeUpdate();
	            pstmt.close();
	            // 두 번째 쿼리
	            String sql2 = "INSERT INTO `Hospital_license_registration`(`license_registration`,`hospital_no`,`org_license`,`new_license`,`org_registration`,`new_registration`) VALUES(?,?,?,?,?,?)";
	            pstmt = conn.prepareStatement(sql2);
	            pstmt.setInt(1, h.getLicense_registration());
	            pstmt.setInt(2, h.getHospital_no());
	            pstmt.setString(3, h.getOrg_license());
	            pstmt.setString(4, h.getNew_license());
	            pstmt.setString(5, h.getOrg_registration());
	            pstmt.setString(6, h.getNew_registration());
	            result += pstmt.executeUpdate();
	            pstmt.close();
	            // 세 번째 쿼리
	            String sql3 = "INSERT INTO `Hospital_price` (`hospital_no`,`price_no`,`type`,`price`) VALUES(?,?,?,?) ";
	            pstmt = conn.prepareStatement(sql3);
	            pstmt.setInt(1, h.getHospital_no());
	            pstmt.setInt(2, h.getPrice_no());
	            pstmt.setString(3, h.getType());
	            pstmt.setString(4, h.getPrice());
	            result += pstmt.executeUpdate();
	            pstmt.close();
	            // 네 번째 쿼리
	            String sql4 = "INSERT INTO `Hospital_time`(`time_no`,`hospital_no`,`time_day`,`time_start`,`time_end`,`lunch_start`,`lunch_end`,`rest_day`) VALUES(?,?,?,?,?,?,?,?)";
	            pstmt = conn.prepareStatement(sql4);
	            pstmt.setInt(1, h.getTime_no());
	            pstmt.setInt(2, h.getHospital_no());
	            pstmt.setString(3, h.getTime_day());
	            pstmt.setString(4, h.getTime_start());
	            pstmt.setString(5, h.getTime_end());
	            pstmt.setString(6, h.getLunch_start());
	            pstmt.setString(7, h.getLunch_end());
	            pstmt.setString(8, h.getRest_day());
	            result += pstmt.executeUpdate();
	            pstmt.close();
	            // 트랜잭션 커밋
	            conn.commit();
	        } catch (Exception e) {
	            try {
	                // 트랜잭션 롤백
	                if (conn != null) {
	                    conn.rollback();
	                }
	            } catch (SQLException se) {
	                se.printStackTrace();
	            }
	            e.printStackTrace();
	        } finally {
	            try {
	                if (pstmt != null) {
	                    pstmt.close();
	                }
	                if (conn != null) {
	                    conn.setAutoCommit(true);
	                }
	            } catch (SQLException se) {
	                se.printStackTrace();
	            }
	        }
	        return result;
	    }
	
	
	// 아이디 중복 검사
	 public boolean isUsernameTaken(Member m, Connection conn) {
	        String query = "SELECT COUNT(*) FROM Member_id WHERE Member_id = ?";
	        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
	            pstmt.setString(1, Member_id);
	            try (ResultSet rs = pstmt.executeQuery()) {
	                if (rs.next()) {
	                    return rs.getInt(1) > 0;
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return false;
	    
	}
	
	
	public int updateHospitalUser(Hospital h, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			
			String sql = "INSERT INTO `Hospital`(`hospital_registration`,`hospital_license`,`hospital_name`,`hospital_number`,`hospital_addr`,`hospital_doctor_num`,`hospital_homepage`,`hospital_mapping`,`hospital_time`,`hospital_price`,`hospital_view`,`hospital_login`) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, h.getHospital_registration());
			pstmt.setString(2, h.getHospital_license());
			pstmt.setString(3, h.getHospital_name());
			pstmt.setString(4,h.getHospital_number());
			pstmt.setString(5,h.getHospital_addr());
			pstmt.setInt(6,h.getHospital_doctor_num());
			pstmt.setString(7,h.getHospital_homepage());
			pstmt.setInt(8,h.getHospital_mapping());
			pstmt.setString(9,h.getHospital_time());
			pstmt.setString(10,h.getHospital_price());
			pstmt.setInt(11,h.getHospital_view());
			pstmt.setInt(12,h.getHospital_login());
			
			result = pstmt.executeUpdate();

		        if (result > 0) {
		            System.out.println("<script>alert('회원가입이 완료되었습니다.'); location.href='index.jsp';</script>");
		        } else {
		        	System.out.println("<script>alert('회원가입에 실패했습니다. 다시 시도해 주세요.'); history.back();</script>");
		       }		
		        
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println("<script>alert('오류가 발생했습니다. 관리자에게 문의하세요.'); history.back();</script>");
			} finally {
				close(pstmt);
			}
			return result;
		}
	// 아이디 찾기
	public int hospitalIdSearch(Member m, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			String sql = "SELECT member_id FROM member WHERE member_email = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt = setString(1,m.member_email);
			
			result = pstmt.executeUpdate();
			
			if(result > 0) {
				System.out.println("<script>alert('회원가입이 완료되었습니다.'); location.href='index.jsp';</script>");
			} else {
				
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 비밀번호 찾기
	public int hospitalPwSearch(Member m, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			String sql = "SELECT member_pw FROM member WHERE member_id = ? , member_email = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,m.member_id);
			pstmt.setString(2,m.member_email);
			
			result = pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	// 회원 삭제
	public int deleteHospitalMember(Member m, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			String sql = "DELETE FROM member WHERE member_id = ?, member_pw = ?, member_email = ?, member_type = ? ";
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
	// 비밀번호 변경
	public int hospitalPwChange(Member m, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			String sql = "SELECT member_pw FROM member WHERE member_pw = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,m.member_pw);

			result = pstmt.executeUpdate();
			
			if(result == 0) {
				 System.out.println("<script> location.href='hospital_pw_change2.jsp';</script>");
			} else {
				System.out.println("<script>alert('비밀번호가 잘못되었습니다. 다시 입력해 주세요.'); history.back();</script>");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	private int getHospitalIdByEmail(String userEmail , Connection conn) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			String sql = "SELECT member_id FROM member WHERE member_email = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt = setString(1,userEmail.member_email);
			
			result = pstmt.executeUpdate();
			
			if(result > 0) {
				System.out.println("<script>alert('userId.'); location.href='index.jsp';</script>");
			} else {
				
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public List<Member> getHospitalIdByEmail(String email){
		List<Member> MemberList = new ArrayList<>();
		
	}
	// 진료과 3가지 선택
	 public int saveSpecialties(int hospitalId, String[] specialties, Connection conn) throws SQLException {
	        String sql = "INSERT INTO hospital_specialties (hospital_id, specialty) VALUES (?, ?)";
	        PreparedStatement pstmt = null;
	        int result = 0;
	        try {
	            pstmt = conn.prepareStatement(sql);
	            for (String specialty : specialties) {
	                pstmt.setInt(1, hospitalId);
	                pstmt.setString(2, specialty);
	                result += pstmt.executeUpdate();
	            }
	        } finally {
	            if (pstmt != null) {
	                pstmt.close();
	            }
	        }
	        return result;
	    }
	
	public int saveHospitalLicense() {
		
	}

	// 이메일 인증번호
//	public boolean isUsernameTaken(String member_email, Connection conn) {
//		String sql = "SELECT COUNT(*) FROM member WHERE member_email = ?";
//        try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
//        	pstmt.setString(1, member_email);
//        	try(ResultSet rs = pstmt.executeQuery()) {
//        		if(rs.next()) {
//        			return rs.getInt(1) > 0;
//        		}
//        	}
//        } catch(Exception e) {
//        	e.printStackTrace();
//        }
//        return false;
//    }
//	
//	  public static void saveAuthCode(String email, String authCode) {
//	        String sql = "UPDATE member SET auth_code = ? WHERE email = ?";
//	        try (Connection conn = getConnection();
//	             PreparedStatement pstmt = conn.prepareStatement(sql)) {
//	            pstmt.setString(1, authCode);
//	            pstmt.setString(2, email);
//	            pstmt.executeUpdate();
//	        } catch (SQLException e) {
//	            e.printStackTrace();
//	        }
//	    }
//	    public static boolean isAuthCodeValid(String code) {
//	        String sql = "SELECT COUNT(*) FROM member WHERE auth_code = ?";
//	        try (Connection conn = getConnection();
//	             PreparedStatement pstmt = conn.prepareStatement(sql)) {
//	            pstmt.setString(1, code);
//	            try (ResultSet rs = pstmt.executeQuery()) {
//	                if (rs.next()) {
//	                    return rs.getInt(1) > 0;
//	                }
//	            }
//	        } catch (SQLException e) {
//	            e.printStackTrace();
//	        }
//	        return false;
//	    }
//	    private static Connection getConnection() {
//	        
//	        return null;
//	    }
	
	// 진료과 3가지 체크
		 public int saveSpecialties1(int hospitalId, String[] specialties, Connection conn) throws SQLException {
		        String sql = "INSERT INTO hospital_specialties (hospital_id, specialty) VALUES (?, ?)";
		        PreparedStatement pstmt = null;
		        int result = 0;
		        try {
		            pstmt = conn.prepareStatement(sql);
		            for (String specialty : specialties) {
		                pstmt.setInt(1, hospitalId);
		                pstmt.setString(2, specialty);
		                result += pstmt.executeUpdate();
		            }
		        } finally {
		            if (pstmt != null) {
		                pstmt.close();
		            }
		        }
		        return result;
		    }
		
		public int saveHospitalLicense() {
			
		}
		// 마이페이지 비밀번호 변경
		public boolean changePassword(String name, String email, String newPassword, Connection conn) throws SQLException {
	        String sql = "UPDATE hospital SET password = ? WHERE name = ? AND email = ?";
	        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	            pstmt.setString(1, newPassword);
	            pstmt.setString(2, name);
	            pstmt.setString(3, email);

	            int rowsUpdated = pstmt.executeUpdate();
	            return rowsUpdated > 0;
	        }
	    }
	
		
		// 로그인 성공 혹은 실패
		public Hospital login(String userId, String password) {
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        Hospital hospital = null;

	        try {
	            conn = JDBCTemplate.getConnection();
	            String sql = "SELECT * FROM Member WHERE user_id = ? AND password = ?";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, userId);
	            pstmt.setString(2, password);

	            rs = pstmt.executeQuery();
	            if (rs.next()) {
	                hospital = new Hospital();
	                hospital.setMemberId(rs.getString("hospital_id"));
	                hospital.setMemberName(rs.getString("member-name"));
	               
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            close(rs);
	            close(pstmt);
	        }

	        return hospital;
	    }
		
}	

	
