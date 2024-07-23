<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 페이지</title>

<meta charset="UTF-8">
<meta name="description" content="Deerhost Template">
<meta name="keywords" content="Deerhost, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>여기아파</title>


<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="폰트.css">
<link rel="stylesheet" href="../../resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="../../resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="../../resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="../../resources/css/flaticon.css"
	type="text/css">
<link rel="stylesheet" href="../../resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="../../resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet"
	href="../../resources/css/common/hospital_membership1.css" type="text/css">

</head>

<body>
	<div class="centered-content">
		<div class="header">
			<div class="header-logo">
				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"
					width="33" height="33" fill="currentColor">
                    <path
						d="M64 32C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H384c35.3 0 64-28.7 64-64V96c0-35.3-28.7-64-64-64H64zM336 152V256 360c0 13.3-10.7 24-24 24s-24-10.7-24-24V280H160l0 80c0 13.3-10.7 24-24 24s-24-10.7-24-24l0-208c0-13.3 10.7-24 24-24s24 10.7 24 24v80H288V152c0-13.3 10.7-24 24-24s24 10.7 24 24z" />
                </svg>
				<a href="#">여기아파</a>
			</div>
			<div class="navigation">
				<a href="#">병원상세</a> <a href="#">병원수정</a> <a
					href="#">마이페이지</a>
			</div>
		</div>
	</div>
	<div class="form-container">
		<!-- <form name="create_user_account" action="/../index.jsp" method="post"> -->
		<form name="create_user_account" action="/hospital/createEnd" method="post">
			<div class="centered-content">
				<h1 class="form-title">회원가입</h1>
				<div>
					<p>
						<strong>‘여기아파’ 이용 약관 페이지 입니다.</strong>
					</p>
					<p>내용 확인 후 동의 해주시기 바랍니다.</p>
				</div>
				<div class="signup-section">
					<div class="checkbox-group">
						<input type="checkbox" id="agree-all" name="agreement-all"
							value="all" onclick="toggleCheckboxes1(this)"> <label
							for="agree-all">전체동의하기</label>
					</div>
					<div class="description-text">이용약관, 개인정보 수집, 위치기반 서비스 모두 동의를
						포함합니다.</div>
					<div class="checkbox-group">
						<input type="checkbox" id="agree-terms" name="agreement"
							value="terms"> <label for="agree-terms">여기아파 이용약관</label>
					</div>
					<div class="description-text">여기아파 서비스 및 제품(이하 서비스)를 이용해주셔서
						감사합니다.</div>
					<div class="checkbox-group">
						<input type="checkbox" id="agree-privacy" name="agreement"
							value="privacy"> <label for="agree-privacy">개인정보
							수집 이용</label>
					</div>
					<div class="description-text">개인정보보호법에 따라 여기어때에 회원가입 신청하시는 분께
						수집하는 개인정보의 항목, 개인정보의 수집 및목적, 개인 정보의 보유 및 이용기간, 동의 거부권..</div>
					<div class="checkbox-group">
						<input type="checkbox" id="agree-location" name="agreement">
						<label for="agree-location">위치 기반 서비스 이용</label>
					</div>
					<div class="description-text">위치기반 서비스 이용약관에 동의하시면, 위치를 활용한
						광고 정보 수신 등을 포함하는 여기어때 위치기반 서비스를 이용할 수 있습니다.</div>
				</div>
				<div class="form-group">
					<label for="create_id">아이디(필수)</label>
					<div id="idCheckMessage"></div>
					<input type="text" name="create_id" class="form-control"
						placeholder="아이디를 입력하세요" minlength="8" maxlength="16"> <input
						type="button" class="form-control" onclick="checkDuplicateId()"
						value="아이디 중복확인">
				</div>
				<div class="form-group" id='passwordError'>
					<label for="create_pw">비밀번호(필수)</label> <input type="password"
						name="create_pw" class="form-control" placeholder="비밀번호를 입력하세요">
					<label for="create_pw_check">비밀번호 확인(필수)</label> <input
						type="password" name="create_pw_check" class="form-control"
						placeholder="비밀번호를 확인해주세요">
				</div>
				<div class="description-text">아이디, 비밀번호는 최소 8자리, 최대 16자리로 지정
					해주시기 바랍니다.</div>
				<div class="form-group">
					<label for="create_email">이메일을 입력해주세요(필수)</label> <input
						type="email" name="create_email" class="form-control"
						placeholder="이메일을 입력해주세요">
				</div>
				<!-- <div class="form-group">
                    <label for="user-auth-code">인증번호 6자리 숫자 입력</label>
                    <input type="text" class="form-control" id="user-auth-code">
                    <button type="button" class="btn btn-outline-secondary" onclick='checkCode()'>인증번호 확인</button>
                </div>
                <div class="description-text">
                    인증번호가 오지 않았나요?
                </div> -->
				<div class="form-group">
					<label for="clinic-hours">진료 시간</label> <input type="text"
						class="form-control" id="clinic-hours-start"
						placeholder="진료시간(예시: 09:00 ~ 18:00)"> <input type="text"
						class="form-control" id="clinic-hours-lunch"
						placeholder="점심시간(예시: 11:00 ~ 12:00)">
				</div>
				<div class="form-group">
					<label for="number-of-doctors">의사 수</label> <input type="text" 
					class="form-control" id="number-of-doctors">
				</div>
				<div class="form-group">
					<label for="homepage">홈페이지(URL)</label> <input type="text"
						class="form-control" name="homepage">
				</div>
				<div class="form-group5"
					style="text-align: center; margin-bottom: 15px;">
					<div class="specialty-group" id="checkSpecialty" style="display: flex; flex-wrap: wrap; justify-content: center; gap: 15px;">
					    <input type="checkbox" id="specialty1" name="specialty" value="1" style="display: none;">
					    <label for="specialty1" style="display: inline-block; vertical-align: middle; margin-right: 10px; cursor: pointer; border: 1px solid #b8860b; border-radius: 5px;">안과</label>
					    <input type="checkbox" id="specialty2" name="specialty" value="2" style="display: none;">
					    <label for="specialty2" style="display: inline-block; vertical-align: middle; margin-right: 10px; cursor: pointer; border: 1px solid #b8860b; border-radius: 5px;">치과</label>
					    <input type="checkbox" id="specialty3" name="specialty" value="3" style="display: none;">
					    <label for="specialty3" style="display: inline-block; vertical-align: middle; margin-right: 10px; cursor: pointer; border: 1px solid #b8860b; border-radius: 5px;">성형외과</label>
					    <input type="checkbox" id="specialty4" name="specialty" value="4" style="display: none;">
					    <label for="specialty4" style="display: inline-block; vertical-align: middle; margin-right: 10px; cursor: pointer; border: 1px solid #b8860b; border-radius: 5px;">피부과</label>
					    <input type="checkbox" id="specialty5" name="specialty" value="5" style="display: none;">
					    <label for="specialty5" style="display: inline-block; vertical-align: middle; margin-right: 10px; cursor: pointer; border: 1px solid #b8860b; border-radius: 5px;">한의원</label>
					    <input type="checkbox" id="specialty6" name="specialty" value="6" style="display: none;">
					    <label for="specialty6" style="display: inline-block; vertical-align: middle; margin-right: 10px; cursor: pointer; border: 1px solid #b8860b; border-radius: 5px;">비뇨기과</label>
					    <input type="checkbox" id="specialty7" name="specialty" value="7" style="display: none;">
					    <label for="specialty7" style="display: inline-block; vertical-align: middle; margin-right: 10px; cursor: pointer; border: 1px solid #b8860b; border-radius: 5px;">산부인과</label>
					    <input type="checkbox" id="specialty8" name="specialty" value="8" style="display: none;">
					    <label for="specialty8" style="display: inline-block; vertical-align: middle; margin-right: 10px; cursor: pointer; border: 1px solid #b8860b; border-radius: 5px;">내과</label>
					    <input type="checkbox" id="specialty9" name="specialty" value="9" style="display: none;">
					    <label for="specialty9" style="display: inline-block; vertical-align: middle; margin-right: 10px; cursor: pointer; border: 1px solid #b8860b; border-radius: 5px;">정신건강의학과</label>
					    <input type="checkbox" id="specialty10" name="specialty" value="10" style="display: none;">
					    <label for="specialty10" style="display: inline-block; vertical-align: middle; margin-right: 10px; cursor: pointer; border: 1px solid #b8860b; border-radius: 5px;">이비인후과</label>
					    <input type="checkbox" id="specialty11" name="specialty" value="11" style="display: none;">
					    <label for="specialty11" style="display: inline-block; vertical-align: middle; margin-right: 10px; cursor: pointer; border: 1px solid #b8860b; border-radius: 5px;">가정의학과</label>
					    <input type="checkbox" id="specialty12" name="specialty" value="12" style="display: none;">
					    <label for="specialty12" style="display: inline-block; vertical-align: middle; margin-right: 10px; cursor: pointer; border: 1px solid #b8860b; border-radius: 5px;">정형외과</label>
					    <input type="checkbox" id="specialty13" name="specialty" value="13" style="display: none;">
					    <label for="specialty13" style="display: inline-block; vertical-align: middle; margin-right: 10px; cursor: pointer; border: 1px solid #b8860b; border-radius: 5px;">재활의학과</label>
					    <input type="checkbox" id="specialty14" name="specialty" value="14" style="display: none;">
					    <label for="specialty14" style="display: inline-block; vertical-align: middle; margin-right: 10px; cursor: pointer; border: 1px solid #b8860b; border-radius: 5px;">신경외과</label>
					    <input type="checkbox" id="specialty15" name="specialty" value="15" style="display: none;">
					    <label for="specialty15" style="display: inline-block; vertical-align: middle; margin-right: 10px; cursor: pointer; border: 1px solid #b8860b; border-radius: 5px;">마취통증의학과</label>
					    <input type="checkbox" id="specialty16" name="specialty" value="16" style="display: none;">
					    <label for="specialty16" style="display: inline-block; vertical-align: middle; margin-right: 10px; cursor: pointer; border: 1px solid #b8860b; border-radius: 5px;">외과</label>
					    <input type="checkbox" id="specialty17" name="specialty" value="17" style="display: none;">
					    <label for="specialty17" style="display: inline-block; vertical-align: middle; margin-right: 10px; cursor: pointer; border: 1px solid #b8860b; border-radius: 5px;">신경과</label>
					    <input type="checkbox" id="specialty18" name="specialty" value="18" style="display: none;">
					    <label for="specialty18" style="display: inline-block; vertical-align: middle; margin-right: 10px; cursor: pointer; border: 1px solid #b8860b; border-radius: 5px;">영상의학과</label>
					    <input type="checkbox" id="specialty19" name="specialty" value="19" style="display: none;">
					    <label for="specialty19" style="display: inline-block; vertical-align: middle; margin-right: 10px; cursor: pointer; border: 1px solid #b8860b; border-radius: 5px;">소아과</label>
					</div>
				</div>
				<div class="form-group">
					<label for="license">의사 면허증</label>
					<div class="form-buttons">
						<button type="button" class="btn btn-outline-secondary"
							onclick="attachFile('license-file')">등록</button>
						<button type="button" class="btn btn-outline-secondary"
							onclick="removeFile('license-file')">삭제</button>
					</div>
				</div>
				<div class="form-group">
					<input type="file" class="form-control" id="license-file"
						accept="image/*">
				</div>
				<div class="form-group">
					<label for="business-license">사업자 등록증</label>
					<div class="form-buttons">
						<button type="button" class="btn btn-outline-secondary"
							onclick="attachFile('business-license-file')">등록</button>
						<button type="button" class="btn btn-outline-secondary"
							onclick="removeFile('business-license-file')">삭제</button>
					</div>
				</div>
				<div class="form-group">
					<input type="file" class="form-control" id="business-license-file"
						accept="image/*">
				</div>
				<div class="form-check">
					<input type="checkbox" class="form-check-input" id="agree">
					<label class="form-check-label" for="agree">개인정보 수집에 동의합니다.</label>
				</div>
				<div class="form-group">
					<label for="hospital-name">병원명</label> <input type="text"
						class="form-control" id="hospital-name">
				</div>
				<div class="form-group">
					<label for="contact">연락처</label> <input type="text"
						class="form-control" id="phone">
				</div>
				<div class="form-group">
					<label for="address">주소</label> <input type="text"
						class="form-control" id="address1">
				</div>
				<input type="button" class="signup-button"
					onclick="createUserForm();" value="회원가입">
				<p class="already-user">
					이미 회원이신가요? <a class="re-login" href="../hospital_login/hospital_login.jsp">로그인</a>
				</p>
			</div>
		</form>
	</div>
	<div class="footer">
		서비스 이용약관 | 개인정보 처리방침 | 고객문의 <br> 전화: 123-456-789 <br> 이메일:
		support@example.com <br> Copyright © GDacademy
	</div>
	<script src="../../resources/js/jquery-3.7.1.js"></script>
	<script src="../../resources/js/bootstrap.min.js"></script>
	<script src="../../resources/js/jquery.slicknav.js"></script>
	<script src="../../resources/js/owl.carousel.min.js"></script>
	<script src="../../resources/js/main.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
        function toggleCheckboxes1(source) {
        	const checkboxes = document.getElementsByName('agreement');
            for (let i = 0; i < checkboxes.length; i++) {
                checkboxes[i].checked = source.checked;
            }
        }

        check_flag = 'N'
        function createUserForm() {
            const form = document.create_user_account;
            if (!form["agree-terms"].checked) {
                alert("이용약관에 동의 바랍니다");
                form["agree-terms"].focus();
            } else if (!form["agree-privacy"].checked) {
                alert("개인수집에 동의 바랍니다");
            } else if (!form["create_id"].value) {
                alert("아이디를 입력하세요.");
            } else if (check_flag !== 'Y') {
                alert("아이디 중복확인을 해주세요.");
            } else if (!validatePassword()) {
                // validatePassword 함수가 false를 반환할 경우, 함수 중단
                alert("비밀번호는 8자리 이상 16자리 미만으로 해주세요.");
                return;  
            } else if (!form["create_pw"].value) {
                alert("비밀번호를 입력하세요.");
                form["create_pw"].focus();
            } else if (!form["create_pw_check"].value) {
                alert("비밀번호 확인을 입력하세요.");
                form["create_pw_check"].focus();
            } else if (form["create_pw"].value !== form["create_pw_check"].value) {
                alert("비밀번호가 일치하는지 확인하세요.");
                form["create_pw_check"].focus();x
            } else if (!form["create_email"].value) {
                alert("이메일을 입력하세요.");
                form["create_email"].focus();
            /* } else if (!form["user-auth-code"].value) {
                alert("인증번호를 입력하세요.");
                form["user-auth-code"].focus(); */
            /* } else if (!form["clinic-hours-start"].value) {
                alert("진료시간을 입력하세요.");
                form["clinic-hours-start"].focus();
            } else if (!form["clinic-hours-lunch"].value) {
                alert("점심시간을 입력하세요.");
                form["clinic-hours-lunch"].focus();
            } else if (!form["number-of-doctors"].value) { */
                alert("의사 수를 입력하세요.");
                form["number-of-doctors"].focus();
            /* } else if (!form["homepage"].value) {
                alert("홈페이지를 입력하세요.");
                form["homepage"].focus(); */
            } else if (!form["license-file"].value) {
                alert("의사면허증을 입력하세요.");
                form["license-file"].focus();
            } else if (!form["business-license-file"].value) {
                alert("사업자등록증을 입력하세요.");
                form["business-license-file"].focus();
            } else if (!form["agree"].checked) {
                alert("정보 동의를 해주세요.");
                form["agree"].focus();
            } else if (!form["hospital-name"].value) {
                alert("병원명을 입력하세요.");
                form["hospital-name"].focus();
            } else if (!form["phone"].value) {
                alert("핸드폰 번호를 입력하세요.");
                form["phone"].focus();
            } else if (!form["address1"].value) {
                alert("주소를 입력하세요.");
                form["address1"].focus();
           /*  } else if (!form["address2"].value) {
                alert("상세주소를 입력하세요.");
                form["address2"].focus(); */
            } else {
                form.submit();
            }
        }

        // 아이디 중복 확인
       function checkDuplicateId() {
    	   var create_id = document.getElementById('create_id').value;
   	    var xhr = new XMLHttpRequest();
   	    xhr.open('POST', '/checkId', true);
   	    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
   	    xhr.onreadystatechange = function () {
   	        if (xhr.readyState === 4 && xhr.status === 200) {
   	            var response = xhr.responseText;
   	            if (response.trim() === 'available') {
   	                alert("아이디 사용 가능");
   	                check_flag = 'Y';
   	            } else if (response.trim() === 'unavailable') {
   	                alert("아이디 중복");
   	                check_flag = 'N';
   	            } else {
   	                alert("오류 발생");
   	                check_flag = 'N';
   	            }
   	        }
   	    };
        

        // 비밀번호 8자리 이상 16자리 미만
        function validatePassword() {
   			 const password = document.getElementsByName('create_pw')[0].value;
   			 const confirmPassword = document.getElementsByName('create_pw_check')[0].value;
   			 const passwordError = document.getElementById('passwordError');
    
   			 if (password.length < 8 || password.length > 16) {
     		   passwordError.textContent = '비밀번호는 8자리 이상, 16자리 이하로 설정해야 합니다.';
     		   return false;
   		 } else if (password !== confirmPassword) {
     		   passwordError.textContent = '비밀번호가 일치하지 않습니다.';
     		   return false;
  		  } else {
     		   passwordError.textContent = '';
      		  return true;
   		 }
	}


        // 진료과 항목 선택
        function checkAgreement() {
        	const checkedCount = document.querySelectorAll('input[type="checkbox"]:checked').length;
        	if (checkedCount < 1) {
           	 alert('최소 1개를 선택해야 합니다.');
       	 } else if (checkedCount > 3) {
         	   alert('최대 3개까지 선택할 수 있습니다.');
      	 } else {
            document.getElementById('myForm').submit();
        	}
   	    }

        // 파일 등록 및 삭제
        function attachFile(id) {
            const fileInput = document.getElementById(id);
            fileInput.click();
        }

        function removeFile(id) {
            const fileInput = document.getElementById(id);
            fileInput.value = '';
        }

        // 지도 
        window.onload = function () {
            document.getElementById("address1").addEventListener("click", function () {
                new daum.Postcode({
                    oncomplete: function (data) {
                        document.getElementById("address1").value = data.address;
                        document.querySelector("input[name=address_detail]").focus();
                    }
                }).open();
            });
        }
    </script>
</body>

</html>
