package com.grab.community.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.grab.community.service.BoardService;

@WebServlet("/modify/comment")
public class ModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ModifyServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int commentNo = Integer.parseInt(request.getParameter("commentNo"));
		
		String content = request.getParameter("comment");
		int result = new BoardService().modifyComment(content, commentNo);

		request.setAttribute("comment_upload", result);
		RequestDispatcher view = request.getRequestDispatcher("/community_board/list");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
