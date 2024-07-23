<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link href='../../resources/css/memberLoginPage/login_fail.css' rel="stylesheet" type="text/css">
</head>
<body>
	<%@ include file="../../include/hospital_nav.jsp" %>
	<%@ include file="../../include/footer.jsp" %>
	<section>
		<div id="section_wrap">
			<div class="others">
				<a  href="<%=request.getContextPath()%>/views/member/memberPage/editPwd.jsp">비밀번호 변경</a>
				<input type="text" >
			</div>
		</div>
	</section>	
	<%@ include file="../../include/footer.jsp" %>
	<script>
// JavaScript 코드 시작
window.onload = function() {
    // 페이지가 로드되면 실행될 함수
    var errorMessage = document.querySelector('#section_wrap .word h3').innerText.trim();
    // #section_wrap 아래 .word 아래 h3 요소의 텍스트를 가져와서 errorMessage 변수에 저장합니다.
    
    alert(errorMessage);
    // errorMessage를 alert 창으로 표시합니다.
}
// JavaScript 코드 끝
</script>
</body>
</html>