package com.grab.community.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/send/create/board")
public class SendCreateBaord extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SendCreateBaord() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int boardType = Integer.parseInt(request.getParameter("boardType"));
		request.setAttribute("boardType", boardType);
		RequestDispatcher view = request.getRequestDispatcher("/views/community/create_board.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
