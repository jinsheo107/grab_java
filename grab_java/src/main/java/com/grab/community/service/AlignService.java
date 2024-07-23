package com.grab.community.service;

import static com.grab.common.sql.JDBCTemplate.close;
import static com.grab.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.grab.community.dao.AlignDao;
import com.grab.community.dao.BoardDao;
import com.grab.community.vo.Board;

public class AlignService {

	// 게시글 조회수 적은 순 정렬
	public List<Board> viewASC(int boardType, Board b) {
		Connection conn = getConnection();
		List<Board> result = new AlignDao().viewASC(boardType, b, conn);
		close(conn);
		return result;
	}

	// 게시글 조회수 많은순 정렬
	public List<Board> viewDESC(int boardType, Board b) {
		Connection conn = getConnection();
		List<Board> result = new AlignDao().viewDESC(boardType, b, conn);
		close(conn);
		return result;
	}

	// 게시글 작성일 오래된순 정렬
	public List<Board> dateASC(int boardType, Board b) {
		Connection conn = getConnection();
		List<Board> result = new AlignDao().dateASC(boardType, b, conn);
		close(conn);
		return result;
	}

	// 게시글 작성일 최신순 정렬
	public List<Board> dateDESC(int boardType, Board b) {
		Connection conn = getConnection();
		List<Board> result = new AlignDao().dateDESC(boardType, b, conn);
		close(conn);
		return result;
	}

}
