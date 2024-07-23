<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 로그인 페이지</title>
    <link rel="icon" href="http://www.w3.org/2000/svg" type="image/svg">
    <meta charset="UTF-8">
    <meta name="description" content="Deerhost Template">
    <meta name="keywords" content="Deerhost, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
   
    <!-- Google Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    
    <style>
    	.container {
		max-width: 500px;
		margin: 50px auto;
		padding: 50px;
		border: 1px solid #ddd;
		border-radius: 5px;
		box-shadow: 0 0 10px rgba(0,0,0,0.1);
	}
	.logo {
		display: flex;
		align-items: center;
		margin-bottom: 20px;
		justify-content: space-between;
	}
	.logo img {
		width: 50px;
		height: 50px;
		margin-right: 10px;
	}
	.logo a {
		font-size: 24px;
		font-weight: bold;
		color: #000;
		text-decoration: none;
	}
	.nav-links_login {
		display: flex;
		gap: 20px;
	}
	.nav-links_login a {
		color: #000;
		font-family: Arial, sans-serif;
		font-size: 14px;
		text-decoration: none;
	}
	.nav-links .nav-links_login a:hover {
		text-decoration: underline;
	}
	.nav-tabs .nav-link {
		color: #000;
	}
	.nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
		border-color: #F0E68C #F0E68C #fff;
		background-color: #F0E68C;
		font-weight: bold;
		color: #000;
	}
	.form-group label {
		font-weight: bold;
	}
	.login-button {
		background-color: #F0E68C;
		border: none;
		padding: 10px;
		cursor: pointer;
		width: 100%;
		font-size: 16px;
		margin-top : 20px;
	}
	.footer {
		margin-top: 20px;
		font-size: 12px;
		color: #666;
		text-align: left;
	}
	.footer a {
		color: #666;
		text-decoration: none;
	}
	.login-title {
		font-size: 24px;
		font-weight: bold;
		margin-top: 20px;
	}
	.login-title-underline {
		width: 100%;
		height: 2px;
		background-color: #B8860B;
		margin: 5px 0 20px;
	}
	.login-links {
		display: flex;
		justify-content: center;
		gap: 10px;
		margin-top: 15px;
	}
	.login-links a {
		color: #000;
		text-decoration: none;
	}
	.login-links a:hover {
		text-decoration: underline;
	}
	/* membership1 css */
	.signup-button {
		background-color: #F0E68C;
		border: none;
		padding: 10px 20px;
		cursor: pointer;
		font-size: 16px;
		border-radius: 5px;
		display: block;
		margin: 20px auto 0;
	}
	.signup-title {
		font-size: 18px;
		font-weight: bold;
		margin-top: 20px;
	}
	.signup-title-underline {
		width: 100%;
		height: 2px;
		background-color: #B8860B;
		margin: 5px 0 20px;
	}
	.signup-content {
		border: 1px solid #B8860B;
		border-radius: 10px;
		padding: 20px;
	}
	.signup-content p {
		margin: 0;
		padding: 0;
		font-size: 12px;
		line-height: 1.5;
	}
	.signup-content label {
		font-size: 12px;
		font-weight: bold;
		display: flex;
		align-items: center;
	}
	.signup-content .radio-group {
		display: flex;
		align-items: center;
		margin-bottom: 10px;
	}
	.signup-content .radio-group input {
		margin-right: 10px;
	}
	.signup-content .description {
		font-size: 10px;
		color: #888;
		margin-bottom: 10px;
	}
    </style>
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
                <a href="#">&nbsp;여기아파</a>
            </div>
        </div>
        <div class="login-title">관리자 로그인</div>
        <div class="login-title-underline"></div>
        <div class="tab-content">
            <div id="admin-login" class="container tab-pane fade"><br>
                <form action="<%=request.getContextPath()%>/member/loginEnd" name="login_form" method="post">
                    <div class="form-group">
                    	<table>
                    		<tr>
                    			<td><label for="admin_id">아이디</label></td>
                    			<td></td>
                    			<td><input type="text" class="form-control" name="admin_id" placeholder="아이디를 입력해 주세요."></td>
                    		</tr>
                    		<tr>
                    			<td><label for="admin_pw">비밀번호</label></td>
                    			<td></td>
                    			<td><input type="password" class="form-control" name="admin_pw"  placeholder="비밀번호를 입력해 주세요."></td>
                    		</tr>
                    	</table>
                    </div>
                    <button type="button" class="login-button" onclick="loginForm();"><b>로그인</b></button>
                <br>
                </form>
            </div>
        </div>
        <div class="footer">
            서비스 이용약관 | 개인정보 처리방침<br>
            전화: 123-456-789 <br>
            이메일: support@example.com <br>
            Copyright © GDacademy
        </div>
    </div>
    <!-- Js Plugins -->
    <script src="resources/js/core/jquery-3.7.1.min.js"></script>
    <script src="resources/js/core/bootstrap.min.js"></script>
    <script src="resources/js/plugin/owl-carousel/owl.carousel.min.js"></script>

    <!-- login.html -->
    <script>
    function loginForm(){
    	let form = document.login_form;
    	
    	if(form.admin_id.value == ''){
    		alert('아이디를 입력하세요.');
    		form.admin_id.focus();
    	}else if(form.admin_pw.value == ''){
    		alert('비밀번호를 입력하세요.');
    		form.admin_pw.focus();
    	}else if(form.admin_id.value == 'admin24' && form.admin_pw.value == '1234'){
    		form.submit();
    	}else if(form.admin_id.value != 'admin24' || form.admin_pw.value != '1234'){
    		alert('아이디 또는 비밀번호가 잘못 되었습니다. 아이디와 비밀번호를 정확히 입력해 주세요.');
    	}
    }
  
/*     function showForm(formId) {
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
     } */
    </script>
</body>
</html>