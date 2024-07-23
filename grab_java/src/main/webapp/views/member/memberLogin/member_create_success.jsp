<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 성공</title>
<link href="../../resources/css/member/memberLogin/create_result.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%@ include file="../../include/hospital_nav.jsp" %>
	<%@ include file="../../include/footer.jsp" %>
	<section>
		 <div id="section_wrap">
        <div class="word">
            <h3>회원가입 성공! 로그인해주세요.</h3>
        </div>
        <div class="others">
            <a href="/login.jsp">로그인</a>
        </div>
    </div>
    	</section>
	  <script>
        // JavaScript를 사용하여 페이지 로드 시 alert 창을 띄웁니다.
        window.onload = function() {
            // h3 요소의 텍스트를 가져옵니다.
            var message = document.querySelector('.word h3').innerText;
            // alert 창에 메시지를 표시합니다.
            alert(message);
        }
    </script>
</body>
</html>