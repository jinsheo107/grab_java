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
    <link rel="stylesheet" href="../../resources/css/hospital_membership2.css" type="text/css">
</head>
<body>
    <div class="container">
        <div class="logo">
            <div style="flex-grow: 1; display: flex; align-items: center;">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" width="33" height="33"
                                fill="currentColor">
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
            <p><strong>설명으로 입력해 주시기 바랍니다.</strong></p>
            <p>‘여기아파’는 아이디를 닉네임으로 사용합니다.</p>
        </div>
       <form action='hospital_membership3.jsp' id='myForm' >
        <div class="signup-content">
            <div class="form-group">
                <label for="user-id">아이디</label>
                <input type="text" class="form-control" id="user-id">
                <button type="button" class="btn btn-outline-secondary" onclick="checkMemberId()">중복 확인</button>
            </div>
            <div class="form-group">
                <label for="user-password">비밀번호</label>
                <input type="password" class="form-control" id="user-password">
            </div>
            <div class="form-group">
                <label for="user-password-confirm">비밀번호 확인</label>
                <input type="password" class="form-control" id="user-password-confirm">
                <div id="member_pw_error" class="error"></div>
            </div>
            <div class="description">
                아이디, 비밀번호는 최소 8자리, 최대 16자리로 지정 해주시기 바랍니다.
            </div>
            <div class="form-group">
                <label for="user-email">이메일</label>
                <input type="email" class="form-control" id="user-email">
                <button type="button" class="btn btn-outline-secondary" onclick='sendAuthCode()'>인증번호 받기</button>
            </div>
            <div class="form-group">
                <label for="user-auth-code">인증번호 6자리 숫자 입력</label>
                <input type="text" class="form-control" id="user-auth-code">
                <button type="button" class="btn btn-outline-secondary" onclick='checkCode()'>인증번호 확인</button>
            </div>
            <div class="description">
                인증번호가 오지 않았나요?
            </div>
            <div class="form-group">
                <label for="clinic-hours">진료 시간</label>
                <input type="text" class="form-control" id="clinic-hours">
            </div>
            <div class="form-group">
                <label for="number-of-doctors">의사 수</label>
                <input type="text" class="form-control" id="number-of-doctors">
            </div>
            <div class="form-group">
                <label for="price">가격표</label>
                <input type="text" class="form-control" id="price">
            </div>
            <div class="form-group">
                <label for="homepage">홈페이지(URL)</label>
                <input type="text" class="form-control" id="homepage">
            </div>
            <button type="button" class="signup-button" onclick="checkAgreement()">다음</button>
        </div>
       </form>
        <div class="footer">
            서비스 이용약관 | 개인정보 처리방침 | 고객문의 <br>
            전화: 123-456-789 <br>
            이메일: mailto:support@example.com <br>
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
    function checkMemberId() {
        const memberId = document.getElementById('user-id').value;
        fetch(`/checkMemberId?member_id=${memberId}`)
            .then(response => response.json())
            .then(data => {
                const feedback = document.getElementById('usernameFeedback');
                if (data.isTaken) {
                    feedback.textContent = '이미 사용 중인 아이디입니다.';
                    feedback.style.color = 'red';
                } else {
                    feedback.textContent = '사용 가능한 아이디입니다.';
                    feedback.style.color = 'green';
                }
            })
            .catch(error => {
                console.error('Error:', error);
            });
    }
    function validatePassword() {
        const password = document.getElementById('user-password').value;
        const confirmPassword = document.getElementById('user-password-confirm').value;
        const passwordError = document.getElementById('member_pw_error');
        if (password.length < 8 || password.length > 16) {
            passwordError.textContent = '비밀번호는 8자리 이상, 16자리 이하로 설정해야 합니다.';
        } else {
            passwordError.textContent = '';
        }
        if (password !== confirmPassword) {
            passwordError.textContent = '비밀번호가 일치하지 않습니다.';
        } else {
            passwordError.textContent = '';
        }
    }
    function validateForm() {
        const passwordError = document.getElementById('member_pw_error').textContent;
        const idCheckResult = document.getElementById('id_check_result').textContent;
        if (passwordError || idCheckResult === '이미 사용 중인 아이디입니다.') {
            alert('양식을 올바르게 작성해 주세요.');
            return false;
        }
    }
    
    function sendAuthCode(){
    	
    }
    /* function sendAuthCode() {
        const email = document.getElementById('user-email').value;
        fetch('/sendEmail', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ email: email })
        })
        .then(response => response.json())
        .then(data => {
            const emailResult = document.getElementById('email-result');
            if (data.success) {
                emailResult.textContent = '인증번호가 이메일로 전송되었습니다.';
                emailResult.style.color = 'green';
            } else {
                emailResult.textContent = '인증번호 전송에 실패했습니다. 이메일을 확인해 주세요.';
                emailResult.style.color = 'red';
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
    }
    function validateForm() {
        const passwordError = document.getElementById('member_pw_error').textContent;
        const idCheckResult = document.getElementById('id_check_result').textContent;
        const authCode = document.getElementById('user-auth-code').value;
        fetch('/verifyCode', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ code: authCode })
        })
        .then(response => response.json())
        .then(data => {
            const authCodeError = document.getElementById('auth_code_error');
            if (!data.valid) {
                authCodeError.textContent = '인증번호가 유효하지 않습니다.';
                return false;
            } else {
                authCodeError.textContent = '';
                if (passwordError || idCheckResult === '이미 사용 중인 아이디입니다.') {
                    alert('양식을 올바르게 작성해 주세요.');
                    return false;
                }
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
    } */
    function checkAgreement(){
        document.getElementById('myForm').submit();
    }
    </script>
</body>
</html>