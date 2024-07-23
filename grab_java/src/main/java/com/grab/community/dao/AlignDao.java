package com.grab.community.dao;

import static com.grab.common.sql.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.grab.community.vo.Board;

public class AlignDao {

	// 게시글 조회수 적은 순 정렬
	public List<Board> viewASC(int boardType, Board b, Connection conn) {
		List<Board> result = new ArrayList<Board>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			String sql = "SELECT * FROM `board` b JOIN `member` m ON b.member_no = m.member_no WHERE `board_type` = ? ORDER BY `hits` ASC LIMIT "
					+ b.getLimitPage() + ", " + b.getBoardList();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardType);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board list = new Board(rs.getInt("board_no"), rs.getInt("member_no"), rs.getInt("hits"),
						rs.getString("board_title"), rs.getString("board_content"),
						rs.getTimestamp("board_reg_date").toLocalDateTime(),
						rs.getTimestamp("board_mod_date").toLocalDateTime(), rs.getInt("member_type"),
						rs.getString("member_id"), rs.getInt("board_type"), rs.getString("board_img"));
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

	// 게시글 조회수 많은순 정렬
	public List<Board> viewDESC(int boardType, Board b, Connection conn) {
		List<Board> result = new ArrayList<Board>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			String sql = "SELECT * FROM `board` b JOIN `member` m ON b.member_no = m.member_no WHERE `board_type` = ? ORDER BY `hits` DESC LIMIT "
					+ b.getLimitPage() + ", " + b.getBoardList();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardType);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board list = new Board(rs.getInt("board_no"), rs.getInt("member_no"), rs.getInt("hits"),
						rs.getString("board_title"), rs.getString("board_content"),
						rs.getTimestamp("board_reg_date").toLocalDateTime(),
						rs.getTimestamp("board_mod_date").toLocalDateTime(), rs.getInt("member_type"),
						rs.getString("member_id"), rs.getInt("board_type"), rs.getString("board_img"));
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

	// 게시글 작성일 오래된순 정렬
	public List<Board> dateASC(int boardType, Board b, Connection conn) {
		List<Board> result = new ArrayList<Board>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			String sql = "SELECT * FROM `board` b JOIN `member` m ON b.member_no = m.member_no WHERE `board_type` = ? ORDER BY `board_reg_date` ASC LIMIT "
					+ b.getLimitPage() + ", " + b.getBoardList();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardType);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board list = new Board(rs.getInt("board_no"), rs.getInt("member_no"), rs.getInt("hits"),
						rs.getString("board_title"), rs.getString("board_content"),
						rs.getTimestamp("board_reg_date").toLocalDateTime(),
						rs.getTimestamp("board_mod_date").toLocalDateTime(), rs.getInt("member_type"),
						rs.getString("member_id"), rs.getInt("board_type"), rs.getString("board_img"));
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

	// 게시글 작성일 최신순 정렬
	public List<Board> dateDESC(int boardType, Board b, Connection conn) {
		List<Board> result = new ArrayList<Board>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			String sql = "SELECT * FROM `board` b JOIN `member` m ON b.member_no = m.member_no WHERE `board_type` = ? ORDER BY `board_reg_date` DESC LIMIT "
					+ b.getLimitPage() + ", " + b.getBoardList();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardType);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board list = new Board(rs.getInt("board_no"), rs.getInt("member_no"), rs.getInt("hits"),
						rs.getString("board_title"), rs.getString("board_content"),
						rs.getTimestamp("board_reg_date").toLocalDateTime(),
						rs.getTimestamp("board_mod_date").toLocalDateTime(), rs.getInt("member_type"),
						rs.getString("member_id"), rs.getInt("board_type"), rs.getString("board_img"));
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

}
