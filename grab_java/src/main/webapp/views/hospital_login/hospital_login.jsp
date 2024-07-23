<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>병원 로그인 페이지</title>
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
   <!--  <link rel="stylesheet" href="../../resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../../resources/css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="../../resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/css/slicknav.min.css" type="text/css"> -->
    <link rel="stylesheet" href="../../resources/css/common/hospital_login.css" type="text/css">
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
        <div class="login-title">로그인</div>
        <div class="login-title-underline"></div>
        <div class="tab-content">
            <div id="user-login" class="container tab-pane active"><br>
                <form action="/views/hospital_login/index.jsp">
                    <div class="form-group">
                        <label for="user-id">아이디</label>
                        <input type="text" class="form-control" id="user-id">
                    </div>
                    <div class="form-group">
                        <label for="user-password">비밀번호</label>
                        <input type="password" class="form-control" id="user-password">
                    </div>
                    <button type="submit" class="login-button" onclick="loginForm()">로그인</button>
                </form>
            </div>
            <div>
                <form action="/views/hospital_login/hospital_login_page.jsp">
                    <button type="submit" class="login-button2" style="display: inline-block;">병원 로그인</button>
                </form>
            </div>
        </div>
        <div class="login-links">
            <a href="http://localhost:8087/views/idSearch/hospital_id_search1.jsp">아이디 찾기</a> |
            <a href="http://localhost:8087/views/pwSearch/hospital_pw_search1.jsp">비밀번호 찾기</a> |
            <a href="http://localhost:8087/views/membership/hospital_membership1.jsp">회원가입</a>
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
    <!-- login.html -->
    <script>
    function showForm(formId) {
        var forms = document.querySelectorAll('.login-form');
        var tabs = document.querySelectorAll('.login-tab');
        forms.forEach(function(form) {
          form.classList.remove('active');
         });
         tabs.forEach(function(tab) {
            tab.classList.remove('active');
        });
        	document.getElementById(formId).classList.add('active');
    	    document.querySelector('.login-tab[onclick="showForm(\'' + formId + '\')"]').classList.add('active');
     }
    function loginForm() {
		let form = document.login_form;
		if (form.user_id.value == '') {
			alert('아이디를 입력하세요.');
			form.user_id.focus();	
		} else if (form.user_pw.value == '') {
			alert('비밀번호를 입력하세요.');
			form.user_pw.focus();
		} else {
			form.submit();
		}
	}
    
    </script>
</body>
</html>