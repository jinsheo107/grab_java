<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기</title>
    
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
    <link rel="stylesheet" href="../../resources/css/bootstrap.min.css" type="text/css">
    <!-- <link rel="stylesheet" href="../../resourcescss/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../../resourcescss/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../../resourcescss/flaticon.css" type="text/css">
    <link rel="stylesheet" href="../../resourcescss/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../../resourcescss/slicknav.min.css" type="text/css">  -->
    <link rel="stylesheet" href="../../resources/css/common/hospital_id_search2.css" type="text/css">
</head>
<body>
    <div class="container">
        <div class="logo">
            <div style="flex-grow: 1; display: flex; align-items: center;">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" width="33" height="33" fill="currentColor"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M64 32C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H384c35.3 0 64-28.7 64-64V96c0-35.3-28.7-64-64-64H64zM336 152V256 360c0 13.3-10.7 24-24 24s-24-10.7-24-24V280H160l0 80c0 13.3-10.7 24-24 24s-24-10.7-24-24l0-208c0-13.3 10.7-24 24-24s24 10.7 24 24v80H288V152c0-13.3 10.7-24 24-24s24 10.7 24 24z"/></svg>
                <a href="#">여기아파</a>
            </div>
            <div class="nav-links">
                <a href="#">병원상세</a>
                <a href="#">병원수정</a>
                <a href="/views/mypage/hospital_mypage.jsp">마이페이지</a>
            </div>
        </div>
        <div class="signup-title">아이디 찾기</div>
        <div class="signup-title-underline"></div>
        <div>
            <p><strong>고객님의 정보와 일치하는 아이디 목록입니다.</strong></p>
        </div>
        <div class="signup-content">
            <div class="info-box">
                <span><%= request.getAttribute("member_id") %>></span>
            </div>
            <div class="form-buttons">
                <button type="button" class="signup-button">로그인하기</button>
                <button type="button" class="signup-button">비밀번호 찾기</button>
            </div>
        </div>
        <div class="footer">
            서비스 이용약관 | 개인정보 처리방침 | 고객문의 <br>
            전화: 123-456-789 <br>
            이메일: support@example.com <br>
            Copyright © GDacademy
        </div>
    </div>
    <!-- Js Plugins -->
   <script src="../../resources/js/jquery-3.7.1.js"></script>
    <script src="../../resources/js/bootstrap.min.js"></script>
    <script src="../../resources/js/jquery.slicknav.js"></script>
    <script src="../../resources/js/owl.carousel.min.js"></script>
    <script src="../../resources/js/main.js"></script>
    <script>
    
    </script>
</body>
</html>