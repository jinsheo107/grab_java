package com.grab.community.service;

import java.sql.Connection;
import java.util.List;

import com.grab.community.dao.BoardDao;
import com.grab.community.vo.Board;
import com.grab.community.vo.BoardComment;

import static com.grab.common.sql.JDBCTemplate.getConnection;
import static com.grab.common.sql.JDBCTemplate.close;

public class BoardService {

	// 페이징
	public int boardCount(Board b) {
		Connection conn = getConnection();
		int result = new BoardDao().boardCount(b, conn);
		close(conn);
		return result;
	}

	// 게시글 작성
	public int createBoard(int boardType, int memberNo, Board b) {
		Connection conn = getConnection();
		int result = new BoardDao().createBoard(boardType, b, memberNo, conn);
		close(conn);
		return result;
	}

	// 게시글 삭제
	public int deleteBoard(int boardNo) {
		Connection conn = getConnection();
		int result = new BoardDao().deleteBoard(boardNo, conn);
		close(conn);
		return result;
	}

	// 댓글 삭제
	public int deleteComment(int commentNo) {
		System.out.println("서블릿 확인");
		Connection conn = getConnection();
		int result = new BoardDao().deleteComment(commentNo, conn);
		close(conn);
		return result;
	}

	// 댓글 수정
	public int modifyComment(String comment, int commentNo) {
		Connection conn = getConnection();
		int result = new BoardDao().modifyComment(comment, commentNo, conn);
		close(conn);
		return result;
	}

	// 댓글 작성
	public int createComment(String comment, int boardNo, int memberNo) {
		Connection conn = getConnection();
		int result = new BoardDao().createComment(comment, boardNo, memberNo, conn);
		close(conn);
		return result;
	}

	// 댓글 리스트 및 내용 출력
	public List Boardcomment(int boardNo) {
		Connection conn = getConnection();
		List<Board> comment = new BoardDao().Boardcomment(boardNo, conn);
		close(conn);
		return comment;
	}

	// 게시글 상세 내용 출력
	public Board BoardContent(int boardNo) {
		Connection conn = getConnection();
		Board b = new BoardDao().BoardContent(boardNo, conn);
		close(conn);
		return b;
	}

	//******* 공지사항 상세 내용 출력 *********
	public Board noticeBoardContent(int boardNo) {
		Connection conn = getConnection();
		Board b = new BoardDao().noticeBoardContent(boardNo, conn);
		close(conn);
		return b;
	}

	// 게시글 리스트 출력
	public List<Board> boardList(int boardType, Board b) {
		Connection conn = getConnection();
		List<Board> result = new BoardDao().boardList(boardType, b, conn);
		close(conn);
		return result;
	}

	//********** 공지사항 리스트 출력 **********
	public List<Board> boardList(int boardType, Board b){
		Connection conn = getConnection();
		List<Board> result = new BoardDao().boardList(boardType, b, conn);
		close(conn);
		return result;
	}

	// 페이징 바 세팅
	public int boardCount() {
		Connection conn = getConnection();
		int result = new BoardDao().boardCount(conn);
		close(conn);
		return result;
	}

}
