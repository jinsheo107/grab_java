package com.grab.community.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.grab.community.service.BoardService;

@WebServlet("/board/delete")
public class DeleteBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteBoardServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		int result = new BoardService().deleteBoard(boardNo);
		RequestDispatcher view = request.getRequestDispatcher("/community_board/list");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
