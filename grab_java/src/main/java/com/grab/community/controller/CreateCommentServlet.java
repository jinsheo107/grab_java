package com.grab.community.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.grab.community.service.BoardService;
import com.grab.community.vo.BoardComment;

@WebServlet("/create/comment")
public class CreateCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CreateCommentServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		request.setCharacterEncoding("UTF-8");
		int memberNo = (int) session.getAttribute("member_no");
		String memberId = (String) session.getAttribute("member_id");
		String content = request.getParameter("comment");

		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		int result = new BoardService().createComment(content, boardNo, memberNo);

		request.setAttribute("comment_upload", result);
		RequestDispatcher view = request.getRequestDispatcher("/community_board/list");
		view.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
