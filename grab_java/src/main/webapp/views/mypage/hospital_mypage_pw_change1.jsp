<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="../../resources/css/common/common/hospital_pw_change1.css" type="text/css">
    
</head>
<body>
    <div class="header">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" width="33" height="33" fill="currentColor"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M64 32C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H384c35.3 0 64-28.7 64-64V96c0-35.3-28.7-64-64-64H64zM336 152V256 360c0 13.3-10.7 24-24 24s-24-10.7-24-24V280H160l0 80c0 13.3-10.7 24-24 24s-24-10.7-24-24l0-208c0-13.3 10.7-24 24-24s24 10.7 24 24v80H288V152c0-13.3 10.7-24 24-24s24 10.7 24 24z"/></svg>
        <a href="#">여기아파</a>
        <div class="nav-links">
            <a href="#">병원상세</a>
            <a href="#">병원수정</a>
            <a href="hospital_mypage">마이페이지</a>
        </div>
    </div>
    <form id="myForm" action="hospital_mypage_pw_change2.jsp">
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
            <h3>비밀번호 변경</h3>
            <br><br>
            <br>
            <div class="tab-content"> 
                <div class="user-login">
                    <p>이전에 사용했던 비밀번호가 아닌 새 비밀번호를 입력해 주세요.</p>
                    <div class="form-group2">
                        
                        <div>
                            <label for="confirm-password">비밀번호</label>
                            <input type="password" class="form-control-pass" id="confirm-password">
                        </div>
                        <button type="button" class="btn-pass" onclick="checkAgreement">다음</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
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
    <script>
    function checkAgreement(){
    	document.getElementById('myForm').submit();
    }
    </script>
</body>
</html>