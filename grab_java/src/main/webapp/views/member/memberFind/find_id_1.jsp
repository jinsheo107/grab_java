<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
	<link rel="stylesheet" href="../../../resources/css/common/bootstrap.min.css" type="text/css" type="text/css">
	<!--  <link rel="stylesheet" href="../../resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../../resources/css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="../../resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/css/slicknav.min.css" type="text/css"> -->
	<link rel="stylesheet" href="../../../resources/member/memberFind/find_id_1.css" type="text/css">
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
				<a href="../memberPage/mypage_main.jsp">마이페이지</a>
			</div>
		</div>

		<div class="login-title">아이디 찾기</div>
		<div class="login-title-underline"></div>
<!---------------------------------------------------------------------->
<div class="content-id">
	<p>회원정보에 등록한 본인확인 이메일 주소와 입력한 이메일 주소가 같아야, 인증번호를 받을 수 있습니다.</p>
</div>

 <div class="form-box">
        <div class="form-group">
            <label for="email" class="pwpw">이메일</label>
            <input type="email" class="form-control" id="email" name="Email">
        </div>
    </div>

    <div class="button">
        <button id="button-next" onclick="searchId(this)">다음</button>
    </div>

<!---------------------------------------------------------------------->
		<div class="footer">
			서비스 이용약관 | 개인정보 처리방침 |
			<a href="admin-login">관리자 로그인</a> <br>
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
	function searchId() {
       var frm = document.searchIdScreen;
       
       if(frm.email.value.length < 1){
    	   alert("이메일을 입력해주세요");
       }
       else {
    	   frm.method = "post";
    	   frm.action="seachIdDB";
    	   frm.submit();
       }
    }
	</script>
</body>

</html>