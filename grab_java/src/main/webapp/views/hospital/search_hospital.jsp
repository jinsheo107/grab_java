<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Google Font -->
 <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

 <!-- Css Styles -->
  <link rel="stylesheet" href="../../resources/css/common/폰트.css">
  <link rel="stylesheet" href="../../resources/css/common/bootstrap.min.css" type="text/css">
  <link rel="stylesheet" href="../../resources/css/common/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="../../resources/css/common/elegant-icons.css" type="text/css">
  <link rel="stylesheet" href="../../resources/css/common/flaticon.css" type="text/css">
  <link rel="stylesheet" href="../../resources/css/common/owl.carousel.min.css" type="text/css">
  <link rel="stylesheet" href="../../resources/css/common/slicknav.min.css" type="text/css">
  <link rel="stylesheet" href="../../resources/css/common/style.css" type="text/css">
</head>
<body>
	<%@ include file="../include/hospital_nav.jsp" %>

	<section class="register-domain spad">
    	<div class="container">
      		<div class="row d-flex justify-content-center">
        		<div class="col-lg-8">
          			<div class="register__text">
            			<div class="searchComment">
              				<h3 class="notoSansBold">찾으시는 병원을 검색해 보세요!</h3>
			            </div>
            			<div class="register__form">
              				<form action="#">
                				<input type="text" placeholder="병원 검색하기">
                				<button type="submit" class="notoSansMedium site-btn">검색</button>
			            	</form>
            			</div>
          			</div>
	       	 </div>
    	  </div>
	  </div>
  </section>
  
  <%@ include file="../include/footer.jsp" %>
	
	<script src="../../resources/js/common/jquery-3.7.1.js"></script>
  <script src="../../resources/js/common/bootstrap.min.js"></script>
  <script src="../../resources/js/common/jquery.slicknav.js"></script>
  <script src="../../resources/js/common/owl.carousel.min.js"></script>
  <script src="../../resources/js/common/main.js"></script>
  
</body>
</html>