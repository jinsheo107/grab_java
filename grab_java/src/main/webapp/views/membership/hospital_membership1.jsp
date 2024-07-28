<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 페이지</title>
    
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
    <link rel="stylesheet" href="../../resources/css/hospital_membership1.css" type="text/css">
</head>
<body>
    <div class="container">
        <div class="logo">
            <div style="flex-grow: 1; display: flex; align-items: center;">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" width="33" height="33"
                                fill="currentColor"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                                <path
                                    d="M64 32C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H384c35.3 0 64-28.7 64-64V96c0-35.3-28.7-64-64-64H64zM336 152V256 360c0 13.3-10.7 24-24 24s-24-10.7-24-24V280H160l0 80c0 13.3-10.7 24-24 24s-24-10.7-24-24l0-208c0-13.3 10.7-24 24-24s24 10.7 24 24v80H288V152c0-13.3 10.7-24 24-24s24 10.7 24 24z" />
                            </svg>
                <a href="#">여기아파</a>
            </div>
            <div class="nav-links">
                <a href="#">병원상세</a>
                <a href="#">병원수정</a>
                <a href="#">마이페이지</a>
            </div>
        </div>
        <div class="signup-title">회원가입</div>
        <div class="signup-title-underline"></div>
        <div>
            <p><strong>‘여기아파’ 이용 약관 페이지 입니다.</strong></p>
            <p>내용 확인 후 동의 해주시기 바랍니다.</p>
        </div>
        <form action='hospital_membership2.jsp' id='myForm'>
        <div class="signup-content">
            <div class="radio-group">
                <input type="checkbox" id="agree-all" name="agreement-all" value="all" onclick="toggleCheckboxes(this)">
                <label for="agree-all">전체동의하기</label>
            </div>
            <div class="description">
                이용약관, 개인정보 수집, 위치기반 서비스 모두 동의를 포함합니다.
            </div>
            <div class="radio-group">
                <input type="checkbox" id="agree-terms" name="agreement" value="terms">
                <label for="agree-terms">여기아파 이용약관</label>
            </div>
            <div class="description">
                여기아파 서비스 및 제품(이하 서비스)를 이용해주셔서 감사합니다.
            </div>
            <div class="radio-group">
                <input type="checkbox" id="agree-privacy" name="agreement" value="privacy">
                <label for="agree-privacy">개인정보 수집 이용</label>
            </div>
            <div class="description">
                개인정보보호법에 따라 여기어때에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및목적, 개인 정보의 보유 및 이용기간, 동의 거부권..
            </div>
            <div class="radio-group">
                <input type="checkbox" id="agree-location" name="agreement" value="location">
                <label for="agree-location">위치 기반 서비스 이용</label>
            </div>
            <div class="description">
                위치기반 서비스 이용약관에 동의하시면, 위치를 활용한 광고 정보 수신 등을 포함하는 여기어때 위치기반 서비스를 이용할 수 있습니다.
            </div>
            <button type="button" class="signup-button" onclick="checkAgreement()">다음</button>
        </div>
       </form>
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
        function toggleCheckboxes(source) {
            checkboxes = document.getElementsByName('agreement');
            for(var i = 0; i < checkboxes.length; i++) {
                checkboxes[i].checked = source.checked;
            }
        }
        
        function checkAgreement() {
            const agreeTerms = document.getElementById('agree-terms').checked;
            const agreePrivacy = document.getElementById('agree-privacy').checked;
            const form = document.getElementById('myForm');
            
            if (!agreeTerms || !agreePrivacy) {
                alert('여기아파 이용약관과 개인정보 수집 이용에 동의하셔야 합니다.');
                return false;
            } else {
            	form.submit();
        }
       }
    </script>
</body>
</html>
