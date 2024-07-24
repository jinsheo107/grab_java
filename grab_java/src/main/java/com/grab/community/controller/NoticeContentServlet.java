package com.grab.community.controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.grab.community.service.BoardService;
import com.grab.community.vo.Board;
import com.grab.community.vo.BoardComment;

import static com.grab.common.sql.JDBCTemplate.getConnection;

@WebServlet("/board/notice/content")
public class NoticeContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NoticeContentServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		
		int boardNo = (Integer.parseInt(request.getParameter("boardNo")));
		Board b = new BoardService().noticeBoardContent(boardNo);
		
		// 데이터 보내기
		request.setAttribute("boardContent", b);
			RequestDispatcher view = request.getRequestDispatcher("/views/community/community_notice_board.jsp");
			view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
