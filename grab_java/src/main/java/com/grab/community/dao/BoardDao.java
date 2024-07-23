package com.grab.community.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.grab.community.vo.Board;
import com.grab.community.vo.BoardComment;

import static com.grab.common.sql.JDBCTemplate.close;

public class BoardDao {
	
	// 페이징
	public int boardCount(Board b, Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT COUNT(*) AS cnt FROM `board`";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("cnt");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	// 게시글 작성
	public int createBoard(int boardType, Board b, int memberNo, Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		try {
			String sql = "INSERT INTO `board` (`member_no` , `board_title` , `board_content` , `board_type` , `board_img`) VALUES (? , ? , ? , ? , ?);";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			pstmt.setString(2, b.getBoard_title());
			pstmt.setString(3, b.getBoard_content());
			pstmt.setInt(4, boardType);
			pstmt.setString(5, b.getBoard_img());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 게시글 삭제
	public int deleteBoard(int boardNo, Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		try {
			System.out.println("DELETE"+result);
			String sql = "DELETE FROM `board` WHERE `board_no` = ?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 댓글 삭제
	public int deleteComment(int commentNo, Connection conn) {
		System.out.println("dao확인");
		int result = 0;
		PreparedStatement pstmt = null;
		System.out.println("deleteComment확인2"+commentNo);
		try {
			String sql = "DELETE FROM `board_comment` WHERE `comment_no` = ?;";
			System.out.println("댓글 넘버"+commentNo);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, commentNo);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 댓글 수정
		public int modifyComment(String comment, int commentNo, Connection conn) {
			int result = 0;
			PreparedStatement pstmt = null;
			try {
				String sql = "UPDATE `board_comment` SET `comment` = ? , `comment_mod_date` = ? WHERE `comment_no` = ?;";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, comment);
//				LocalDateTime ldt = LocalDateTime.now(); // 입력 시간 작성
//				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
//				String today = dtf.format(ldt);
				pstmt.setTimestamp(2, new java.sql.Timestamp(System.currentTimeMillis()).valueOf("yyyy-MM-dd HH:mm"));
				pstmt.setInt(3, commentNo);
				result = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}
	
	// 댓글 작성
	public int createComment(String comment, int boardNo, int memberNo, Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		try {
			String sql = "INSERT INTO `board_comment` (`member_no` , `board_no` , `comment`) VALUES (? , ? , ?);";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, boardNo);
			pstmt.setString(3, comment);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public List Boardcomment(int boardNo, Connection conn) {
		List<BoardComment> comment = new ArrayList<BoardComment>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM `board_comment` b JOIN `member` m ON b.member_no = m.member_no WHERE `board_no` = ?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardComment list = new BoardComment(
						rs.getInt("comment_no"),
						rs.getInt("board_no"),
						rs.getInt("member_no"),
						rs.getString("comment"),
						rs.getTimestamp("comment_reg_date").toLocalDateTime(),
						rs.getTimestamp("comment_mod_date").toLocalDateTime(),
						rs.getInt("member_type"),
						rs.getString("member_id")
						);
				comment.add(list);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return comment;
	}
//	public int boardCount(int boardNo, Connection conn) {
//		PreparedStatement pstmt = null;
//		int result = 0;
//		try {
//			String sql1 = "UPDATE `board` SET `hits` = hits+1 WHERE `board_no` = ?;";
//			pstmt = conn.prepareStatement(sql1);
//			pstmt.setInt(1, boardNo);
//			result = pstmt.executeUpdate();
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			close(pstmt);
//		}
//		return result;
//	}
	
	// 게시글 상세 출력
	public Board BoardContent(int boardNo, Connection conn) {
		Board b = new Board();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			String sql1 = "UPDATE `board` SET `hits` = hits+1 WHERE `board_no` = ?;";
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, boardNo);
			result = pstmt.executeUpdate();
			String sql = "SELECT * FROM `board` b JOIN `member` m ON b.member_no = m.member_no WHERE `board_no` = ? ;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Board list = new Board(
						rs.getInt("board_no"),
						rs.getInt("member_no"),
						rs.getInt("hits"),
						rs.getString("board_title"),
						rs.getString("board_content"),
						rs.getTimestamp("board_reg_date").toLocalDateTime(),
						rs.getTimestamp("board_mod_date").toLocalDateTime(),
						rs.getInt("member_type"),
						rs.getString("member_id"),
						rs.getInt("board_type"),
						rs.getString("board_img")
						);
				b = list;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return b;
	}
	
	// 게시글 리스트 출력
	public List<Board> boardList(int boardType, Board b, Connection conn){
		List<Board> result = new ArrayList<Board>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			String sql = "SELECT * FROM `board` b JOIN `member` m ON b.member_no = m.member_no WHERE `board_type` = ? ORDER BY `board_reg_date` DESC LIMIT "+b.getLimitPage()+", "+b.getBoardList();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardType);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board list = new Board(
						rs.getInt("board_no"),
						rs.getInt("member_no"),
						rs.getInt("hits"),
						rs.getString("board_title"),
						rs.getString("board_content"),
						rs.getTimestamp("board_reg_date").toLocalDateTime(),
						rs.getTimestamp("board_mod_date").toLocalDateTime(),
						rs.getInt("member_type"),
						rs.getString("member_id"),
						rs.getInt("board_type"),
						rs.getString("board_img")
						);
				result.add(list);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public int boardCount(Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT COUNT(*) AS cnt FROM `board`;";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("cnt");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

}
