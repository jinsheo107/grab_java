<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 페이지</title>
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
    <link rel="stylesheet" href="../../../resources/css/common/bootstrap.min.css" type="text/css">
    <!--  <link rel="stylesheet" href="../../resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../../resources/css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="../../resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/css/slicknav.min.css" type="text/css"> -->
    <link rel="stylesheet" href="../../../resources/member/memberLogin/login.css" type="text/css">
    </head>

<body>
      <!--  <%@ include file="../../include/hospital_nav.jsp" %>-->
    <div class="container">

        <div class="login-title">로그인</div>


            <div class="login-title-underline"></div>

           
          <div class="tab-content">
    <form action="/member/loginEnd" name="login_form" method="post">
        <div id="user-login" class="container tab-pane active">
            <div class="login-idpw">
                <div class="form-group">
                    <label for="member-id">아이디</label>
                    <input type="text" name="member_id" class="form-control large-input" id="member-id">
                </div>
                <div class="form-group">
                    <label for="member-password">비밀번호</label>
                    <input type="password" name="member_pw" class="form-control large-input" id="member-password">
                </div>
            </div>
            <input type="button" name="login-button" class="login-button" value="로그인" onclick="loginForm(); LoginEndServlet();">
        </div>
    </form>
</div>
          <div class="login-links">
            <a href="<%=request.getContextPath()%>/views/member/memberFind/find_id_1.jsp">아이디 찾기</a> |
            <a href="<%=request.getContextPath()%>/views/member/memberFind/find_pw_1.jsp">비밀번호 찾기</a> |
            <a href="<%=request.getContextPath()%>/views/member/memberLogin/member_create.jsp">회원가입</a>
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
    <script src="../../../resources/js/common/jquery-3.7.1.js"></script>
    <script src="../../../resources/js/common/bootstrap.min.js"></script>
    <script src="../../../resources/js/common/jquery.slicknav.js"></script>
    <script src="../../../resources/js/common/owl.carousel.min.js"></script>
    <script src="../../../resources/js/common/main.js"></script>
    <!-- login.html -->
    <script>
    function loginForm() {
        let form = document.login_form;
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
    
    function LoginEndServlet() {
    	
    }
		
		function enterkey(){
			if (window.event.keyCode == 13) {
		    	loginForm();
		    }
		}
    </script>
</body>
</html>
    