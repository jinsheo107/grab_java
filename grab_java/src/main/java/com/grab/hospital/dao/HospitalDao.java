package com.grab.hospital.dao;

import static com.grab.common.sql.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.grab.common.sql.JDBCTemplate;
import com.grab.hospital.vo.Hospital;
import com.grab.hospital.dao.HospitalDepartmentDao;

public class HospitalDao {

		public boolean isExistingMember(String memberId, String memberEmail, Connection conn) throws SQLException {
	        
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        boolean isExisting = false;
	
	        try {
	        	
	        	String sql = "SELECT COUNT(*) FROM Member WHERE member_id = ? OR member_email = ?";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, memberId);
	            pstmt.setString(2, memberEmail);
	            rs = pstmt.executeQuery();
	            if (rs.next()) {
	               
	             System.out.println(rs);
	            }
	        } finally {
	            JDBCTemplate.close(rs);
	            JDBCTemplate.close(pstmt);
	        }
	
	        return isExisting;
	    }

	    public int insertHospital(Hospital hospital, Connection conn) {
	        PreparedStatement pstmt = null;
	        int result = 0;
	        String sql = "INSERT INTO hospital (hospital_no, hospital_name, hospital_phone, hospital_addr, hospital_doctor_num, hospital_homepage, hospital_new_license, hospital_org_license, hospital_new_registration, hospital_org_registration, hospital_time, hospital_lunch_time, hospital_whether, hospital_view, hospital_login, reg_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'N', 0, current_timestamp(), current_timestamp())";

	        try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, hospital.getHospital_no());
	            pstmt.setString(2, hospital.getHospital_name());
	            pstmt.setString(3, hospital.getHospital_phone());
	            pstmt.setString(4, hospital.getHospital_addr());
	            pstmt.setInt(5, hospital.getHospital_doctor_num());
	            pstmt.setString(6, hospital.getHospital_homepage());
	            pstmt.setString(7, hospital.getHospital_new_license());
	            pstmt.setString(8, hospital.getHospital_org_license());
	            pstmt.setString(9, hospital.getHospital_new_registration());
	            pstmt.setString(10, hospital.getHospital_org_registration());
	            pstmt.setString(11, hospital.getHospital_time());
	            pstmt.setString(12, hospital.getHospital_lunch_time());
	            result = pstmt.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            JDBCTemplate.close(pstmt);
	        }

	        return result;
	    }
	

		
	 		 // 진료과 3가지 체크
	 		  public int saveSpecialties(Hospital h, String[] specialties, Connection conn) throws SQLException {
	 		        String sql = "INSERT INTO `hospital_department` (hospital_no, type_no) VALUES (?, ?)";
	 		        PreparedStatement pstmt = null;
	 		        int result = 0;
	 		        try {
	 		            pstmt = conn.prepareStatement(sql);
	 		            for (String specialty : specialties) {
	 		                pstmt.setInt(1, h.getHospital_no());
	 		                pstmt.setInt(2, Integer.parseInt(specialty)); // Assuming specialty is the type_no
	 		                result += pstmt.executeUpdate();
	 		            } 
	 		        } finally {
	 		            if (pstmt != null) {
	 		                JDBCTemplate.close(pstmt);
	 		            }
	 		        }
	 		        return result;
	 		    }		
	 		 // 병원 마이페이지 답글
//	 		 public class ReviewDAO {
//	 		    public List<Review> getReviewsByHospitalNo(int hospitalNo, Connection conn) {
//	 		        List<Review> reviewList = new ArrayList<>();
//	 		        PreparedStatement pstmt = null;
//	 		        ResultSet rs = null;
//	 		        try {
//	 		            String sql = "SELECT review_content, reg_date FROM review WHERE hospital_no = ?";
//	 		            pstmt = conn.prepareStatement(sql);
//	 		            pstmt.setInt(1, hospitalNo);
//	 		            rs = pstmt.executeQuery();
//	 		            while (rs.next()) {
//	 		                Review review = new Review();
//	 		                review.setReviewContent(rs.getString("review_content"));
//	 		                review.setRegDate(rs.getTimestamp("reg_date").toLocalDateTime());
//	 		                reviewList.add(review);
//	 		            }
//	 		        } catch (Exception e) {
//	 		            e.printStackTrace();
//	 		        } finally {
//	 		            JDBCTemplate.close(rs);
//	 		            JDBCTemplate.close(pstmt);
//	 		        }
//	 		        return reviewList;
//	 		    }
//	 		}
	 				
				// 파일 등록 및 삭제
				 public int saveHospitalFile(int hospitalNo, String newLicense, String orgLicense, String newRegistration, String orgRegistration, Connection conn) throws SQLException {
				        String sql = "INSERT INTO `hospital_license_registration` (`hospital_no`, `new_license`, `org_license`, `new_registration`, `org_registration`) VALUES (?, ?, ?, ?, ?)";
				        PreparedStatement pstmt = null;
				        int result = 0;
				        try {
				            pstmt = conn.prepareStatement(sql);
				            pstmt.setInt(1, hospitalNo);
				            pstmt.setString(2, newLicense);
				            pstmt.setString(3, orgLicense);
				            pstmt.setString(4, newRegistration);
				            pstmt.setString(5, orgRegistration);
				            result = pstmt.executeUpdate();
				        } finally {
				            JDBCTemplate.close(pstmt);
				        }
				        return result;
				    }
				 
				 // 진료과
				 public int detailModify(int hospital_no, String hospital_time, String hospital_lunch_time, int doctor_num, String hospital_phone, String[] selectedTypes, Connection conn) throws SQLException {
						int result = 0;
						
						PreparedStatement pstmt = null;
						ResultSet rs = null;
						try {
							conn.commit();
							String hospitalUpdateSql = "INSERT `hospital` "
									+"SET hospital_time = ?, hospital_lunch_time = ?, "
									+"hospital_doctor_num = ?, hospital_phone = ? WHERE hospital_no = ?";
							
							pstmt = conn.prepareStatement(hospitalUpdateSql);
							
							pstmt.setString(1, hospital_time);
							pstmt.setString(2, hospital_lunch_time);
							pstmt.setInt(3, doctor_num);
							pstmt.setString(4, hospital_phone);
							pstmt.setInt(5, hospital_no);
							
							result = pstmt.executeUpdate();
							
							if(result > 0) {
								String searchTypeSql = "SELECT COUNT(*) cnt FROM hospital_department WHERE hospital_no = ?";
								pstmt = conn.prepareStatement(searchTypeSql);
								pstmt.setInt(1, hospital_no);
								
								rs = pstmt.executeQuery();
								
								if(rs.next()) {
									if(rs.getInt("cnt") > 0 && selectedTypes.length > 0) {
										String deleteTypeSql = "DELETE FROM hospital_department WHERE hospital_no = ?";
										pstmt = conn.prepareStatement(deleteTypeSql);
										pstmt.setInt(1, hospital_no);
										
										result = pstmt.executeUpdate();
										
										if(result > 0) {
											for(int i = 0; i < selectedTypes.length; i++) {
												String createTypeSql = "INSERT INTO hospital_department (type_no, hospital_no) VALUES (?, ?)";
												pstmt = conn.prepareStatement(createTypeSql);
												pstmt.setInt(1, Integer.parseInt(selectedTypes[i]));
												pstmt.setInt(2, hospital_no);
												
												result = pstmt.executeUpdate();
											}
										}
									} else if(rs.getInt("cnt") == 0) {
										for(int i = 0; i < selectedTypes.length; i++) {
											String createTypeSql = "INSERT INTO hospital_department (type_no, hospital_no) VALUES (?, ?)";
											pstmt = conn.prepareStatement(createTypeSql);
											pstmt.setInt(1, Integer.parseInt(selectedTypes[i]));
											pstmt.setInt(2, hospital_no);
											
											result = pstmt.executeUpdate();
										}
									} else {
										result = -1;
									}
								}
							}
						} catch(Exception e) {
							conn.rollback();
							e.printStackTrace();
							
						} finally {
							close(rs);
							close(pstmt);
						}
						
						return result;
					}
				}
				


	
