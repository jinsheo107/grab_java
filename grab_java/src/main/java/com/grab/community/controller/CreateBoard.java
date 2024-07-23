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
import com.grab.member_detail.vo.Member;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/create/board")
public class CreateBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public CreateBoard() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String dir = request.getServletContext().getRealPath("upload");
		int maxSize = 1024*1024*10;
		String encoding = "UTF-8";
		DefaultFileRenamePolicy dfr = new DefaultFileRenamePolicy();
		MultipartRequest mr = new MultipartRequest(request, dir, maxSize, encoding, dfr);
		String boardImg = mr.getOriginalFileName("img");
		
		
		int boardType = Integer.parseInt(request.getParameter("boardType"));
		System.out.println(boardType + "CreateBoard 확인");
		
		Member member = (Member) session.getAttribute("member");
		
		int memberNo = member.getMember_no();
		Board b = new Board();
		b.setBoard_content(mr.getParameter("boardContent"));
		b.setBoard_title(mr.getParameter("boardTitle"));
		b.setBoard_type(boardType);
		b.setBoard_img(boardImg);
		int result = new BoardService().createBoard(boardType, memberNo, b);
		
		request.setAttribute("boardType", boardType);
		if(boardType == 1) {
			RequestDispatcher view = request.getRequestDispatcher("/community_board/list");
			view.forward(request, response);
		} else if(boardType == 2) {
			RequestDispatcher view = request.getRequestDispatcher("/Q&A_board/list");
			view.forward(request, response);
		} else {
			RequestDispatcher view = request.getRequestDispatcher("/information_share/list");
			view.forward(request, response);	
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
