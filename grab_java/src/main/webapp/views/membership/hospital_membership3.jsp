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
    <link rel="stylesheet" href="../../resources/css/style.css" type="text/css">
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
        <div class="signup-title">회원가입</div>
        <div class="signup-title-underline"></div>
        <div>
            <p><strong>병원 상세 정보 및 선택 정보 입력 페이지 입니다.</strong></p>
        </div>
        <form id="myForm" action="membership4.jsp">
        <div class="signup-content2">
            <div class="specialty-group">
                <input type="checkbox" id="specialty1" name="specialty" value="안과">
                <label for="specialty1">안과</label>

                <input type="checkbox" id="specialty2" name="specialty" value="치과">
                <label for="specialty2">치과</label>

                <input type="checkbox" id="specialty3" name="specialty" value="성형외과">
                <label for="specialty3">성형외과</label>

                <input type="checkbox" id="specialty4" name="specialty" value="피부과">
                <label for="specialty4">피부과</label>

                <input type="checkbox" id="specialty5" name="specialty" value="한의원">
                <label for="specialty5">한의원</label>

                <input type="checkbox" id="specialty6" name="specialty" value="비뇨기과">
                <label for="specialty6">비뇨기과</label>

                <input type="checkbox" id="specialty7" name="specialty" value="산부인과">
                <label for="specialty7">산부인과</label>

                <input type="checkbox" id="specialty8" name="specialty" value="내과">
                <label for="specialty8">내과</label>

                <input type="checkbox" id="specialty9" name="specialty" value="정신건강의학과">
                <label for="specialty9">정신건강의학과</label>

                <input type="checkbox" id="specialty10" name="specialty" value="이비인후과">
                <label for="specialty10">이비인후과</label>

                <input type="checkbox" id="specialty11" name="specialty" value="가정의학과">
                <label for="specialty11">가정의학과</label>

                <input type="checkbox" id="specialty12" name="specialty" value="정형외과">
                <label for="specialty12">정형외과</label>

                <input type="checkbox" id="specialty13" name="specialty" value="재활의학과">
                <label for="specialty13">재활의학과</label>

                <input type="checkbox" id="specialty14" name="specialty" value="신경외과">
                <label for="specialty14">신경외과</label>

                <input type="checkbox" id="specialty15" name="specialty" value="외과">
                <label for="specialty15">마취통증의학과</label>

                <input type="checkbox" id="specialty16" name="specialty" value="외과">
                <label for="specialty16">외과</label>

                <input type="checkbox" id="specialty17" name="specialty" value="신경과">
                <label for="specialty17">신경과</label>

                <input type="checkbox" id="specialty18" name="specialty" value="영상의학과">
                <label for="specialty18">영상의학과</label>

                <input type="checkbox" id="specialty19" name="specialty" value="소아과">
                <label for="specialty19">소아과</label>
            </div>
            <button type="button" class="signup-button" onclick='checkAgreement()'>다음</button>
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
        document.addEventListener('DOMContentLoaded', function () {
            const checkboxes = document.querySelectorAll('input[type="checkbox"]');
            checkboxes.forEach(checkbox => {
                checkbox.addEventListener('change', function () {
                    const checkedCount = document.querySelectorAll('input[type="checkbox"]:checked').length;
                    if (checkedCount > 3) {
                        this.checked = false;
                        alert('최대 3개까지 선택할 수 있습니다.');
                    }
                });
            });
        });
        
        function checkAgreement() {
            const checkedCount = document.querySelectorAll('input[type="checkbox"]:checked').length;
            if (checkedCount < 3) {
                alert('최소 3개를 선택해야 합니다.');
            } else {
                document.getElementById('myForm').submit();
            }
        }
    </script>
</body>
</html>