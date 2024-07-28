<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 페이지</title>
    <meta charset="UTF-8">
    <meta name="description" content="Deerhost Template">
    <meta name="keywords" content="Deerhost, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Google Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <!-- Css Styles -->
    <link rel="stylesheet" href="../../../resources/css/common/bootstrap.min.css" type="text/css">
    <!--  <link rel="stylesheet" href="../../resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../../resources/css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="../../resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/css/slicknav.min.css" type="text/css"> -->
    <link rel="stylesheet" href="../../../resources/member/memberLogin/member_create.css"
        type="text/css">
        <body>
    <div class="container">
        <div class="logo">
            <div style="flex-grow: 1; display: flex; align-items: center;">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" width="33" height="33"
                    fill="currentColor">
                    <path
                        d="M64 32C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H384c35.3 0 64-28.7 64-64V96c0-35.3-28.7-64-64-64H64zM336 152V256 360c0 13.3-10.7 24-24 24s-24-10.7-24-24V280H160l0 80c0 13.3-10.7 24-24 24s-24-10.7-24-24l0-208c0-13.3 10.7-24 24-24s24 10.7 24 24v80H288V152c0-13.3 10.7-24 24-24s24 10.7 24 24z" />
                </svg>
                <a href="<%=request.getContextPath()%>/index.jsp">여기아파</a>
            </div>
            <div class="nav-links">
                <a href="#">병원상세</a>
                <a href="#">병원수정</a>
               <a href="<%=request.getContextPath()%>/views/member/memberPage/mypage_main.jsp">마이페이지</a>
            </div>
        </div>
        <!---------------------------------------------------------------------->
        <div class="form-container">
            <form name="create_user_account" action="/member/createEnd" method="post">
                <div class="centered-content">
                    <h1 class="form-title">회원가입</h1>
                    <div>
                        <p><strong>‘여기아파’ 이용 약관 페이지 입니다.</strong></p>
                        <p>내용 확인 후 동의 해주시기 바랍니다.</p>
                    </div>
                    <div class="signup-section">
                        <div class="checkbox-group">
                            <input type="checkbox" id="agree-all" name="agreement-all" value="all" onclick="toggleCheckboxes1(this)">
                            <label for="agree-all">전체동의하기</label>
                        </div>
                        <div class="description-text">
                            이용약관, 개인정보 수집, 위치기반 서비스 모두 동의를 포함합니다.
                        </div>
                        <div class="checkbox-group">
                            <input type="checkbox" id="agree-terms" name="agreement" value="terms">
                            <label for="agree-terms">여기아파 이용약관</label>
                        </div>
                        <div class="description-text">
                            여기아파 서비스 및 제품(이하 서비스)를 이용해주셔서 감사합니다.
                        </div>
                        <div class="checkbox-group">
                            <input type="checkbox" id="agree-privacy" name="agreement" value="privacy">
                            <label for="agree-privacy">개인정보 수집 이용</label>
                        </div>
                        <div class="description-text">
                            개인정보보호법에 따라 여기어때에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및목적, 개인 정보의 보유 및 이용기간, 동의 거부권..
                        </div>
                        <div class="checkbox-group">
                            <input type="checkbox" id="agree-location" name="agreement">
                            <label for="agree-location">(선택) 위치 기반 서비스 이용</label>
                        </div>
                        <div class="description-text">
                            위치기반 서비스 이용약관에 동의하시면, 위치를 활용한 광고 정보 수신 등을 포함하는 여기어때 위치기반 서비스를 이용할 수 있습니다.
                        </div>
                    </div>
                    <div class="form-group">
    <label for="create_id">아이디(필수)</label>
    <div id="idCheckMessage"></div>
    <input type="text" id="create_id" name="member_id" class="form-control" placeholder="아이디를 입력하세요">
    <input type="button" class="form-control" onclick="checkIdServlet()" value="아이디 중복확인" style="width: 30%; font-size: 12px;">
</div>
<div class="form-group">
    <label for="user-password">비밀번호(필수)</label>
    <input type="password" id="user-password" name="member_pw" class="form-control" placeholder="비밀번호를 입력하세요" oninput="validatePassword()">
</div>
<div class="form-group">
    <label for="user-password-confirm">비밀번호 확인(필수)</label>
    <input type="password" id="user-password-confirm" name="member_pw_confirm" class="form-control" placeholder="비밀번호를 확인해주세요" oninput="validatePassword()">
</div>
<div id="member_pw_error" style="color:red;"></div>

                    <div class="description-text">
                        아이디, 비밀번호는 최소 8자리, 최대 16자리로 지정 해주시기 바랍니다.
                    </div>
                    <div class="form-group">
                        <label for="create_email">이메일을 입력해주세요(필수)</label>
                        <input type="email" name="member_email" class="form-control" placeholder="이메일을 입력해주세요">
                    </div>
                
                    
<div>
                    <input type="button" class="signup-button" onclick="createUserForm();" value="회원가입">
                    <p class="already-user">이미 회원이신가요? <a class="re-login" href="login.jsp">로그인</a></p>
                </div> 

        <!---------------------------------------------------------------------->
        <div class="footer">
            서비스 이용약관 | 개인정보 처리방침
            <a href="admin-login"></a> <br>
            전화: 123-456-789 <br>
            이메일: support@example.com <br>
            Copyright © GDacademy
        </div>
    <!-- Js Plugins -->
    <script src="../../../resources/js/common/jquery-3.7.1.js"></script>
    <script src="../../../resources/js/common/bootstrap.min.js"></script>
    <script src="../../../resources/js/common/jquery.slicknav.js"></script>
    <script src="../../../resources/js/common/owl.carousel.min.js"></script>
    <script src="../../../resources/js/common/main.js"></script>
    <!-- login.html -->

    <script>
        function toggleCheckboxes1(source) {
            checkboxes = document.getElementsByName('agreement');
            for (var i = 0; i < checkboxes.length; i++) {
                checkboxes[i].checked = source.checked;
            }
        }

        check_flag = 'N'
        function createUserForm() {
            const form = document.create_user_account;
            if (!form["agree-terms"].checked) {
                alert("이용약관에 동의 바랍니다");
                form["agree-terms"].focus();
            } else if (!form["agree-privacy"].checked) {
                alert("개인수집에 동의 바랍니다");
                form["agree-privacy"].focus();
            } else if (!form["member_id"].value) {
                alert("아이디를 입력하세요.");
                form["member_id"].focus();
            } else if (check_flag !== 'Y') {
                alert("아이디 중복확인을 해주세요.");
                form["Y"].focus();
            } else if (!form["member_pw"].value) {
                alert("비밀번호를 입력하세요.");
                form["member_pw"].focus();
            } else if (!form["member_pw_confirm"].value) {
                alert("비밀번호 확인을 입력하세요.");
                form["member_pw_confirm"].focus();
            } else if (form["member_pw"].value !== form["member_pw_confirm"].value) {
                alert("비밀번호가 일치하는지 확인하세요.");
                form["member_pw_confirm"].focus();
            } else if (!form["member_email"].value) {
                alert("이메일을 입력하세요.");
                form["member_email"].focus();
            } else {
                form.submit();
            }
        }

        // 아이디 중복 확인
function checkIdServlet() {
    var create_id = document.getElementById('create_id').value;
    var xhr = new XMLHttpRequest();
    xhr.open('POST', '/checkId', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var response = xhr.responseText;
            if (response.trim() === 'available') {
                alert("아이디를 사용 가능합니다.");
                check_flag = 'Y';
            } else if (response.trim() === 'unavailable') {
                alert("아이디가 중복됩니다.");
                check_flag = 'N';
            } else {
                alert("오류 발생");
                check_flag = 'N';
            }
        }
    };

    xhr.send('member_Id=' + encodeURIComponent(create_id));
}

        // 비밀번호 8자리 이상 16자리 미만
       function validatePassword() {
    const password = document.getElementById('member_pw').value;
    const confirmPassword = document.getElementById('member_pw-confirm').value;
    const passwordError = document.getElementById('member_pw_error');
    let errorMessage = '';

    if (password.length > 8 || password.length < 16) {
        errorMessage = '비밀번호는 8자리 이상, 16자리 이하로 설정해야 합니다.';
    } else if (password !== confirmPassword) {
        errorMessage = '비밀번호가 일치하지 않습니다.';
    }

    passwordError.textContent = errorMessage;
}

    </script>

</body>

</html>