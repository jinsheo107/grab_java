<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="com.grab.member_detail.vo.Member" %>
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
    <title>DEERHOST | Template</title>
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
    @charset "UTF-8";
body {
            font-family: 'Noto Sans KR', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .header {
            display: flex;
            align-items: center;
            padding: 10px 20px;
            background-color: #f9f9f9;
            border-bottom: 1px solid #ddd;
        }
        .header img {
            width: 50px;
            height: 50px;
            margin-right: 10px;
        }
        .header a {
            font-size: 24px;
            font-weight: bold;
            color: #000;
            text-decoration: none;
        }
        .nav-links {
            margin-left: auto;
            display: flex;
            gap: 20px;
        }
        .nav-links a {
            color: #000;
            font-size: 14px;
            text-decoration: none;
        }
        .nav-links a:hover {
            text-decoration: underline;
        }
        .container3 {
            display: flex;
            flex: 1;
            margin-top: 20px;
        }
        .sidebar3 {
            display : flex;
            border-right: 1px solid #b8860b;
            padding-right: 20px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            width : 30%;
        }
        .sidebar3 .nav-link {
            display: block;
            padding: 10px;
            margin-bottom: 10px;
            color: #000;
            background-color: white;
            text-decoration: none;
            text-align: center;
            border-radius: 5px;
        }
        .sidebar3 .nav-link.active {
            background-color: white; 
        }
        .sidebar3 .nav-link:hover {
            background-color: white; 
        }
        .sidebar3 .nav-link.last {
            font-size: 12px; 
            background-color: #ede8e8; 
            padding: 5px; 
            margin-bottom: 20px; 
        }
        .main-content3 {
            diplay : flex;
            width : 70%;
            padding-left: 20px;
        }
        .profile {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            flex-direction: column; 
            justify-content: center; 
        }
        .profile img {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            margin-bottom: 20px; 
        }
        .profile-info {
            text-align: center;
        }
        .profile-info h2 {
            margin: 0;
            font-size: 24px;
            color: #b8860b;
        }
        .profile-info p {
            margin: 5px 0;
            color: #666;
        }
        .footer2 {
            font-size: 12px;
            color: #666;
            text-align: center;
            padding: 10px 20px;
            border-top: 1px solid #ddd;
            background-color: #f9f9f9;
            position: relative;
        }
        .footer2 a {
            color: #666;
        }
    
    </style>
</head>
<body>
    <%@ include file="../include/hospital_nav.jsp"%>
    <div class="container3">
        <div class="sidebar3">
            <div>
                <a href="hospital_mypage_change1.jsp" class="nav-link active">비밀번호 변경</a>
                <hr>
                <a href="hospital_mypage_comment.jsp" class="nav-link">답글 내역</a>
                <hr>
            </div>
            <a href="hospital_membershipwithdrawal.jsp" class="nav-link last">회원탈퇴 ></a>
        </div>
        <div class="main-content3">
            <h2>마이페이지</h2>
            <hr>
            <h3>회원정보</h3>
            <div class="profile" style="margin-top: 50px;">
                <img src="../세미 프로젝트/img/404.png" alt="프로필 이미지">
                <div class="profile-info">
                    <h2>아이디: <%= m.getMember_id() %></h2>
                    <p>이메일: <%= m.getMember_email() %></p>
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
</body>
</html>
