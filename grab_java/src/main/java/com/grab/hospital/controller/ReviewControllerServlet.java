package com.grab.hospital.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.grab.hospital.service.HospitalService;

//hospital
//리뷰

//@WebServlet("/reviews")
//public class ReviewControllerServlet extends HttpServlet {
//	
//    private static final long serialVersionUID = 1L;
//    
//    public ReviewControllerServlet() {
//        super();
//    }
//    
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int hospitalNo = Integer.parseInt(request.getParameter("hospitalNo"));
//        HospitalService reviewService = new HospitalService();
//        List<Review> reviewList = reviewService.getReviewsByHospitalNo(hospitalNo);
//        request.setAttribute("reviewList", reviewList);
//        request.getRequestDispatcher("/hospital_mypage_comment.jsp").forward(request, response);
//    }
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doGet(request, response);
//    }
//}