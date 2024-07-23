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
    <title>여기아파</title>
    <!-- Google Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <!-- Css Styles -->
    <link rel="stylesheet" href="../../resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/css/common/hospital_login.css" type="text/css">
</head>
<body>
    <div class="container">
        
        <div class="login-title">병원 로그인</div>
        <div class="login-title-underline"></div>
        <div class="tab-content">
            <div id="user-login" class="container tab-pane active"><br>
                <form action="/hospital/loginEnd" name="hospital_login_form" method="post">
                    <div class="form-group">
                        <label for="user-id">아이디</label>
                        <input type="text" name="member_id" class="form-control" id="user-id">
                    </div>
                    <div class="form-group">
                        <label for="user-password">비밀번호</label>
                        <input type="password" name="member_pw" class="form-control" id="user-password">
                    </div>
                    <input type="button" class="login-button" onclick="loginForm()" value="로그인">
                </form>
            </div>
        </div>
        <div class="login-links">
            <a href="/views/idSearch/hospital_id_search1.jsp">아이디 찾기</a> |
            <a href="/views/pwSearch/hospital_pw_search1.jsp">비밀번호 찾기</a> |
            <a href="/views/membership/hospital_membership1.jsp">회원가입</a>
        </div>
        <div class="footer">
            서비스 이용약관 | 개인정보 처리방침 |
            <a href="/views/adminLogin.jsp">관리자 로그인</a> <br>
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
		let form = document.hospital_login_form;
		if (form.member_id.value == '') {
			alert('아이디를 입력하세요.');
			form.member_id.focus();	
		} else if (form.member_pw.value == '') {
			alert('비밀번호를 입력하세요.');
			form.member_pw.focus();
		} else {
			form.submit();
		}
	}
    
    </script>
</body>
</html>