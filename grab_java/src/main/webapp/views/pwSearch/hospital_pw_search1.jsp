<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기</title>
    
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
    <link rel="stylesheet" href="../../resources/css/hospital_pw_search1.css" type="text/css">
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
                <a href="#">마이페이지</a>
            </div>
        </div>
       <form id="myForm" action="hospital_pw_search2.jsp">
        <div class="signup-title">비밀번호 찾기</div>
        <div class="signup-title-underline"></div>
        <div>
            <p><strong>회원정보에 등록한 본인확인 이메일 주소와 입력한 이메일 주소가 같아야, 인증번호를 받을 수 있습니다.</strong></p>
        </div>
        <div class="signup-content">
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" class="form-control" id="name">
            </div>
            <div class="form-group">
                <label for="email">이메일</label>
                <input type="email" class="form-control" id="email">
                <button type="button" class="btn btn-outline-secondary" id="send-code-button">인증번호 받기</button>
            </div>
            <div class="form-group">
                <label for="auth-code">인증번호</label>
                <input type="text" class="form-control" id="auth-code" placeholder="인증번호 6자리 숫자 입력">
            </div>
            <div class="description">
                <a href="#" id="show-description">인증번호가 오지 않았나요? [?]</a>
            </div>
            <div class="description-box" id="description-box">
                <p>‘여기아파’가 발송한 메일이 스팸 메일로 분류된 것은 아닌지 확인해 주세요. 스팸 메일함에서 메일이 없다면, 다시 한 번 ‘인증번호 받기’를 눌러주세요.</p>
            </div>
            <button type="button" class="signup-button" onclick="checkAgreement">다음</button>
        </div>
        <div class="footer">
            서비스 이용약관 | 개인정보 처리방침 | 고객문의 <br>
            전화: 123-456-789 <br>
            이메일: support@example.com <br>
            Copyright © GDacademy
        </div>
    </div>
    </form>
     <!-- Js Plugins -->
   <script src="../../resources/js/jquery-3.7.1.js"></script>
    <script src="../../resources/js/bootstrap.min.js"></script>
    <script src="../../resources/js/jquery.slicknav.js"></script>
    <script src="../../resources/js/owl.carousel.min.js"></script>
    <script src="../../resources/js/main.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            document.getElementById('show-description').addEventListener('click', function (e) {
                e.preventDefault();
                document.getElementById('description-box').style.display = 'block';
            });

            document.getElementById('send-code-button').addEventListener('click', function () {
                alert('인증번호가 발송되었습니다.');
                // 실제로는 서버와 통신하여 인증번호를 발송하는 코드를 작성해야 합니다.
            });
        });
        
        function checkAgreement(){
        	document.getElementById('myForm').submit();
        }
    </script>
</body>
</html>