package com.grab.hospital.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthToggleButtonUI;

@WebServlet(name="HospitalCreateReviewEnd", urlPatterns = "/hospital/create_review_end")
public class HospitalCreateReviewEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public HospitalCreateReviewEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reviewStar = request.getParameter("reviewStar");
        String selectedKeywords = request.getParameter("selectedKeywords");
        String reviewContent = request.getParameter("review_content");
        
        // 선택된 키워드들을 확인해봅니다
        System.out.println("별점: " + reviewStar);
        System.out.println("선택된 키워드들: " + selectedKeywords);
        System.out.println("리뷰 내용: " + reviewContent);
        
        String[] arr = selectedKeywords.split(","); 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
