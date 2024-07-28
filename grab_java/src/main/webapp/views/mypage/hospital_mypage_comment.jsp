<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.grab.hospital_detail.vo.Review" %>
<%
    List<Review> reviewList = (List<Review>) request.getAttribute("reviewList");
%>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>병원 회원 마이페이지</title>
    <meta charset="UTF-8">
    <meta name="description" content="Deerhost Template">
    <meta name="keywords" content="Deerhost, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>여기아파</title>
    <!-- Google Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <!-- Css Styles -->
    <link rel="stylesheet" href="폰트.css">
    <link rel="stylesheet" href="../../resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../../resources/css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="../../resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/css/common/hospital_mypage.css" type="text/css">
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            background-color: #F5F5F5;
        }
        .header-section {
            width: 100%;
        }
        .main-content { /* 추가: 전체 콘텐츠를 감싸는 컨테이너 */
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
        }
        .container2 {
            width: 80%;
            max-width: 1200px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            display: flex;
            overflow: hidden;
            margin: 20px auto;
            margin-top: 10%;
        }
        .section-title {
            display: inline-block;
            position: relative;
            text-align: left;
            left: 10%;
            margin-bottom: 20px;
        }
        .section-title::after {
            content: '';
            display: block;
            width: 800%;
            height: 3px;
            background-color: rgb(173, 152, 80);
            position: absolute;
            bottom: -5px;
            left: 400%;
            transform: translateX(-50%);
        }
        .sidebar {
            width: 250px;
            border-right: 1px solid #ddd;
            background-color: #F8F8F8;
            padding: 20px;
        }
        .sidebar h3 {
            margin-top: 0;
            font-size: 24px;
            font-weight: 700;
            margin-bottom: 20px;
        }
        .sidebar ul {
            list-style-type: none;
            padding: 0;
        }
        .sidebar ul li {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        .sidebar ul li a {
            text-decoration: none;
            color: #000;
            display: block;
        }
        .sidebar ul li a.active {
            color: blue;
            font-weight: 600;
        }
        .content {
            flex: 1;
            padding: 20px;
        }
        .content-section {
            display: none;
        }
        .content-section.active {
            display: block;
        }
        .content h2 {
            font-size: 24px;
            margin-bottom: 20px;
        }
        .content p {
            margin: 10px 0;
        }
        .footer {
            background-color: #F1F1F1;
            text-align: center;
            padding: 20px 0;
            font-size: 14px;
            color: #666;
            width: 100%;
            margin-top: auto;
        }
        .footer a {
            color: #666;
            text-decoration: none;
            margin: 0 10px;
        }
        .footer a:hover {
            text-decoration: underline;
        }
        .footer_text {
            margin: 5px 0;
            text-align: left;
            padding-left: 2%;
        }
    </style>
</head>
<body>
    <div class="header">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" width="33" height="33" fill="currentColor">
            <path d="M64 32C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H384c35.3 0 64-28.7 64-64V96c0-35.3-28.7-64-64-64H64zM336 152V256 360c0 13.3-10.7 24-24 24s-24-10.7-24-24V280H160l0 80c0 13.3-10.7 24-24 24s-24-10.7-24-24l0-208c0-13.3 10.7-24 24-24s24 10.7 24 24v80H288V152c0-13.3 10.7-24 24-24s24 10.7 24 24z"/>
        </svg>
        <a href="#">여기아파</a>
        <div class="nav-links">
            <a href="#">병원상세</a>
            <a href="#">병원수정</a>
            <a href="hospital_mypage.jsp">마이페이지</a>
        </div>
    </div>
    <div class="container2">
        <div class="sidebar2">
            <div>
                <a href="hospital_mypage_change1.jsp" class="nav-link active">비밀번호 변경</a>
                <hr>
                <a href="hospital_mypage_comment.jsp" class="nav-link">답글 내역</a>
                <hr>
            </div>
            <a href="hospital_membershipwithdrawal.jsp" class="nav-link last">회원탈퇴 ></a>
        </div>
        <div class="main-content2">
            <h2>마이페이지</h2>
            <hr>
            <h3>답글</h3>
            <div class="tab-content">
                <div class="user-login">
                    <div class="form-group3">
                        <table id="commentTable">
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>작성한 댓글</th>
                                    <th>작성 시간</th>
                                </tr>
                            </thead>
                            <%-- <tbody>
                                <%
                                    int index = 1;
                                    if (reviewList != null) {
                                        for (Review review : reviewList) {
                                %>
                                <tr>
                                    <td><%= ++index %></td>
                                    <td><%= review. %></td>
                                    <td><%= review.getRegDate() %></td>
                                </tr>
                                <%
                                        }
                                    }
                                %>
                            </tbody> --%>
                        </table>
                        <div class="paging3">
                            <span>&lt; 1 &gt;</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer2">
        서비스 이용약관 | 개인정보 처리방침 | 고객문의 <br>
        전화: 123-456-789 <br>
        이메일: support@example.com <br>
        Copyright © GDacademy
    </div>
     <!-- Js Plugins -->
    <script src="../../resources/js/jquery-3.7.1.js"></script>
    <script src="../../resources/js/bootstrap.min.js"></script>
    <script src="../../resources/js/jquery.slicknav.js"></script>
    <script src="../../resources/js/owl.carousel.min.js"></script>
    <script src="../../resources/js/main.js"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>