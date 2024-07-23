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
import com.grab.community.vo.Board;

@WebServlet("/comment/delete")
public class CommentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public CommentDeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		int commentNo = Integer.parseInt(request.getParameter("commentNo"));
//		int commentNo = (int) session.getAttribute("commentNo");
		int result = new BoardService().deleteComment(commentNo);
		
		request.setAttribute("delete_comment", result);
		RequestDispatcher view = request.getRequestDispatcher("/community_board/list");
		view.forward(request, response);
//		response.sendRedirect("/");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
