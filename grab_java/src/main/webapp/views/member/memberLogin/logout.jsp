<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
<link href='../../resources/css/member/memberLogin/login_fail.css' rel="stylesheet" type="text/css">
</head>
<body>
	<%@ include file="../../include/hospital_nav.jsp" %>
	<%@ include file="../../include/footer.jsp" %>
	<section>
		<div id="section_wrap">
			<div class="others">
				<button onclick="LoginOutServlet();">로그아웃</button> 
			</div>
		</div>
	</section>	
	<%@ include file="../../include/footer.jsp" %>
	<script>
function LoginOutServlet(){
}
</script>
</body>
</html>