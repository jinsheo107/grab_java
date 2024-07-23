<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>병원 회원탈퇴</title>
    
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
    <link rel="stylesheet" href="../../resources/css/common/style.css" type="text/css">
    <style>
        .withdrawal-container {
            margin-top: 20px;
        }
        .withdrawal-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .withdrawal-content {
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 5px;
        }
        .withdrawal-content p {
            margin-bottom: 15px;
        }
        .form-group4 {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        .form-group4 label {
            width: 100px;
            margin-right: 10px;
        }
        .form-group4 input[type="password"] {
            flex: 1;
        }
        .btn-withdraw {
            background-color: #f0e68c;
            border: 1px solid #b8860b;
            color: #000;
            padding: 5px 10px;
            cursor: pointer;
            display: block;
            margin: 20px auto 0; /* 가운데 정렬 */
        }
        .checkbox-group {
            display: flex;
            align-items: center;
        }
        .checkbox-group input[type="checkbox"] {
            margin-right: 10px;
        }
        .user-login p {
            text-align: center;
        }
    </style>
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
                <a href="hospital_mypage.jsp">마이페이지</a>
            </div>
        </div>
        <div class="login-title">회원 탈퇴</div>
        <div class="login-title-underline"></div>
        <div class="withdrawal-container">
            <div class="withdrawal-title">회원 탈퇴</div>
            <div class="withdrawal-content">
                <p>회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</p>
                <p>사용하고 계신 아이디(OO병원)는(은) 탈퇴할 경우 재사용 및 복구가 불가능합니다. 탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.</p>
                <form>
                    <div class="form-group4">
                        <label for="withdraw-password">비밀번호</label>
                        <input type="password" class="form-control" id="withdraw-password">
                    </div>
                    <div class="form-group4 checkbox-group">
                        <input type="checkbox" id="confirm-checkbox">
                        <label for="confirm-checkbox">안내사항을 모두 확인하였으며, 이에 동의합니다.</label>
                    </div>
                    <button type="button" class="btn-withdraw" onclick="handdleWithdraw()">확인</button>
                </form>
            </div>
        </div>
        <div class="footer">
            서비스 이용약관 | 개인정보 처리방침 | 
            <a href="#">관리자 로그인</a> <br>
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
    function handleWithdraw() {
        const password = document.getElementById('withdraw-password').value;
        const checkbox = document.getElementById('confirm-checkbox').checked;
        if (!password) {
            alert('비밀번호를 입력해 주세요.');
            return;
        }
        if (!checkbox) {
            alert('안내사항에 동의 하시기 바랍니다.');
            return;
        }
     
        const passwordMatches = true;
        if (passwordMatches) {
            alert('회원탈퇴가 완료 되었습니다.');
            window.location.href = 'nextPage.html'; 
        } else {
            alert('비밀번호가 일치하지 않습니다.');
        }
    }
</script>
    </script>
</body>
</html>