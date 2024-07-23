//package com.grab.member.controller;
//
//import java.io.IOException;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.grab.member.service.MemberService;
//import com.grab.member.vo.Member;
//
//// member
//// 아이디 중복 검사
//@WebServlet("/user/checkDuplicateId")
//public class checkMemberIdServlet extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//
//    public checkMemberIdServlet() {
//        super();
//    }
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    	request.setCharacterEncoding("UTF-8");
//
//        String userId = request.getParameter("member_id");
//        System.out.println(userId);
//
//        int isDuplicateUser = new MemberService().checkDuplicateId(userId);
//        
//        String result;
//        if (isDuplicateUser > 0) {
//            result = "duplicate";
//        } else {
//            result = "available";
//        }
//
//        response.setContentType("text/html;charset=utf-8");
//      response.getWriter().append(result);
//
//    }
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    	doGet(request, response);
//    }
//}
