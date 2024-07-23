package com.grab.admin.aNotice.dao;

import static com.grab.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.grab.admin.aNotice.vo.Notice;

public class NoticeDao {

	public Notice getNoticeByNo(int notice_no, Connection conn) {
		Notice notice = new Notice();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
        
		try {
            String sql = "SELECT notice_title, notice_content FROM admin_notice WHERE notice_no = ?";

            pstmt = conn.prepareStatement(sql);
            
            pstmt.setInt(1, notice_no);
            
            rs = pstmt.executeQuery();

            if (rs.next()) {
                notice.setNotice_no(notice_no);
                notice.setNotice_title(rs.getString("notice_title"));
                notice.setNotice_content(rs.getString("notice_content"));
            }

            // 리소스 정리 코드
            rs.close();
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return notice;
    }
	
	
	public int createNotice(Notice n, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		LocalDateTime now = LocalDateTime.now();
	    Timestamp currentTime = Timestamp.valueOf(now);
		
		try {
			String sql = "INSERT INTO `admin_notice` (admin_no, notice_title, notice_content, reg_date, mod_date) VALUES (?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 1);
			pstmt.setString(2, n.getNotice_title());
			pstmt.setString(3, n.getNotice_content());
			pstmt.setTimestamp(4, currentTime);
	        pstmt.setTimestamp(5, currentTime);
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int selectNoticeCount(Notice option, Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT COUNT(*) AS cnt FROM admin_notice";
			if(option.getNotice_title() != null) {
				sql += " WHERE notice_title LIKE CONCAT('%','"+option.getNotice_title()+"','%')";
			}
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("cnt");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	
	// 공지사항 상세 내용 보기
	public Notice viewNotice(int notice_no, Connection conn){
		Notice n = new Notice();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT `notice_no`, `notice_title`, `notice_content`, `reg_date`, `mod_date`, `notice_view` FROM admin_notice WHERE notice_no = ?";
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, notice_no);
			rs = pstmt.executeQuery();
			
			 if(rs.next()) { 
				 n.setNotice_no(rs.getInt("notice_no"));
				 n.setNotice_title(rs.getString("notice_title"));
				 n.setNotice_content(rs.getString("notice_content"));
				 n.setReg_date(rs.getTimestamp("reg_date").toLocalDateTime());
				 n.setMod_date(rs.getTimestamp("mod_date").toLocalDateTime());
				 n.setNotice_view(rs.getInt("notice_view"));
			 }
			 
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs); 
			close(pstmt);
		}
		return n;
	}
	
	//리스트 출력(공지사항 메인화면)
	public List<Notice> selectNoticeList(Notice option, Connection conn){
		List<Notice> list = new ArrayList<Notice>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			// 검색 조건
			// x: SELECT * FROM board
			// o: SELECT * FROM board WHERE board_title LIKE CONCAT('%', board_title, '%')
			String sql = "SELECT * FROM admin_notice";
			if(option.getNotice_title() != null) {
				sql += " WHERE notice_title LIKE CONCAT('%','"+option.getNotice_title()+"','%')";
			}
			sql += " ORDER BY reg_date DESC";
			sql += " LIMIT " + option.getLimitPageNo() + ", " + option.getNumPerPage();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Notice resultVo = new Notice(rs.getInt("notice_no"),
											rs.getInt("admin_no"),
											rs.getString("notice_title"),
											rs.getString("notice_content"),
											rs.getTimestamp("reg_date").toLocalDateTime(),
											rs.getTimestamp("mod_date").toLocalDateTime(),
											rs.getInt("notice_view"));
				list.add(resultVo);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	// 수정하기
	public int updateNotice(int newNotice_no, String newNotice_title, String newNotice_content, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		LocalDateTime now = LocalDateTime.now();
        Timestamp currentTime = Timestamp.valueOf(now);
		
		try {
			String sql = "UPDATE `admin_notice` SET notice_title = ?, notice_content = ?, mod_date = ? "
						+ " WHERE notice_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newNotice_title);
			pstmt.setString(2, newNotice_content);
			pstmt.setTimestamp(3, currentTime);
			pstmt.setInt(4, newNotice_no);
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	// 삭제하기
	public int deleteNotice(int notice_no, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			String sql = "DELETE FROM `admin_notice` WHERE notice_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, notice_no);
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
}
