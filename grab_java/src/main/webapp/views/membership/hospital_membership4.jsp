<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 정보</title>
    
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
    <link rel="stylesheet" href="폰트.css">
    <link rel="stylesheet" href="../../resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../../resources/css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="../../resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/css/hospital_membership4.css" type="text/css">
    
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
    <div class="container">
        <div class="logo">
            <div style="flex-grow: 1; display: flex; align-items: center;">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" width="33" height="33" fill="currentColor"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M64 32C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H384c35.3 0 64-28.7 64-64V96c0-35.3-28.7-64-64-64H64zM336 152V256 360c0 13.3-10.7 24-24 24s-24-10.7-24-24V280H160l0 80c0 13.3-10.7 24-24 24s-24-10.7-24-24l0-208c0-13.3 10.7-24 24-24s24 10.7 24 24v80H288V152c0-13.3 10.7-24 24-24s24 10.7 24 24z"/></svg>
                <a href="#">여기아파</a>
            </div>
            <div class="nav-links">
                <a href="#">병원상세</a>
                <a href="#">병원수정</a>
                <a href="#">마이페이지</a>
            </div>
        </div>
        <div class="signup-title">회원가입 정보</div>
        <div class="signup-title-underline"></div>
        <div>
            <p><strong>병원 정보 및 선택 정보 입력 페이지 입니다.</strong></p>
        </div>
        <form id="myForm" action="../../index.jsp">
        <div class="signup-content">
            <div class="form-group">
                <label for="license">의사 면허증</label>
                <div class="form-buttons">
                    <button type="button" class="btn btn-outline-secondary" onclick="attachFile('license-file')">등록</button>
                    <button type="button" class="btn btn-outline-secondary" onclick="removeFile('license-file')">삭제</button>
                </div>
            </div>
            <div class="form-group">
                <input type="file" class="form-control" id="license-file" accept="image/*">
            </div>
            <div class="form-group">
                <label for="business-license">사업자 등록증</label>
                <div class="form-buttons">
                    <button type="button" class="btn btn-outline-secondary" onclick="attachFile('business-license-file')">등록</button>
                    <button type="button" class="btn btn-outline-secondary" onclick="removeFile('business-license-file')">삭제</button>
                </div>
            </div>
            <div class="form-group">
                <input type="file" class="form-control" id="business-license-file" accept="image/*">
            </div>
            <div class="form-check">
                <input type="checkbox" class="form-check-input" id="agree">
                <label class="form-check-label" for="agree">개인정보 수집에 동의합니다.</label>
            </div>
            <div class="form-group">
                <label for="hospital-name">병원명</label>
                <input type="text" class="form-control" id="hospital-name">
            </div>
            <div class="form-group">
                <label for="contact">연락처</label>
                <input type="text" class="form-control" id="contact">
            </div>
            <div class="form-group">
                <label for="address">주소</label>
                <input type="text" class="form-control" id="address">
                <button onclick="searchAddress()">검색</button>
                <div id="addresss-container"></div>
            </div>
            
            <button type="button" class="signup-button" onclick="checkAgreement()">회원가입</button>
        </div>
        </form>
        <div class="footer">
            서비스 이용약관 | 개인정보 처리방침 | 고객문의 <br>
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
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script>
   function attachFile(id) {
   	const fileInput = document.getElementById(id);
   		fileInput.click();
	}

	function removeFile(id) {
   		const fileInput = document.getElementById(id);
   		fileInput.value = '';
	}
   
   	function createHospitalMemberForm(){
   		const agree= document.getElementById('agree').checked;
   		
        if (!agree || !agreePrivacy) {
            alert('개인정보 수집 이용에 동의하셔야 합니다.');
            return false;
        }
   	}
   	
   	window.onload = function(){
   	    document.getElementById("address").addEventListener("click", function(){ //주소입력칸을 클릭하면
   	        //카카오 지도 발생
   	        new daum.Postcode({
   	            oncomplete: function(data) { //선택시 입력값 세팅
   	                document.getElementById("address").value = data.address; // 주소 넣기
   	                document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
   	            }
   	        }).open();
   	    });
   	}
   	
   	function checkAgreement(){
        const licenseFile = document.getElementById('license-file').value;
        const businessLicenseFile = document.getElementById('business-license-file').value;
        const hospitalName = document.getElementById('hospital-name').value;
        const contact = document.getElementById('contact').value;
        const address = document.getElementById('address').value;
        const agree = document.getElementById('agree').checked;

        if (!licenseFile || !businessLicenseFile || !hospitalName || !contact || !address || !agree) {
            alert('내용이 입력되지 않았습니다.');
            return false;
        }

        document.getElementById('myForm').submit();
    }
   	
   	function attachFile(id) {
        const fileInput = document.getElementById(id);
        fileInput.click();
    }

    function removeFile(id) {
        const fileInput = document.getElementById(id);
        fileInput.value = '';
    }
   </script>
</body>
</html>