<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

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
    <link rel="stylesheet" href="../../../resources/css/member/memberFind/find_pw_2.css"
        type="text/css">
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
                <a href="<%=request.getContextPath()%>/index.jsp">여기아파</a>
            </div>
            <div class="nav-links">
                <a href="#">병원상세</a>
                <a href="#">병원수정</a>
                <a href="<%=request.getContextPath()%>/views/member/memberPage/mypage_main">마이페이지</a>
            </div>
        </div>

        <div class="login-title">비밀번호 찾기</div>
        <div class="login-title-underline"></div>
        <!---------------------------------------------------------------------->
        <div class="content-id">
            <p>비밀번호를 변경해 주세요.</p>
            <p> 이전에 썼던 비밀번호를 제외하고 입력해 주세요.</p>
        </div>

        <div class="form-box">
            <div class="form-group">
                <label for="member-id">아이디: </label>
                <div class="id-show" name="id-show">
                    supernova
                </div>
            </div>
            
            <div class="form-group">
                <input type="password" class="form-control" id="new-password" 
                name="new-pwd" placeholder="새 비밀번호">
            </div>
        
        <div class="form-group">
            <input type="password" class="form-control" id="rep-password" 
            name="rep-pwd" placeholder="새 비밀번호 확인">
        </div>
        </div>

    <div class="button">
        <button id="button-next"  name="btnbtn">확인</button>
    </div>

    <div class="pwd-underline"></div>

    <div class="explain">
        <p>* 영문 대/소문자, 숫자, 특수문자가 꼭 포함되어야 합니다.</p>
            <p>*  비밀번호는 최소 8자리, 최대 16자리로 지정 해주시기 바랍니다.</p>
            <p>* 다른 사이트와 다른 ‘여기아파’ 아이디만의 비밀번호를 만들어 주세요.</p>
    </div>

    <!---------------------------------------------------------------------->
    <div class="footer">
        서비스 이용약관 | 개인정보 처리방침
        <a href="admin-login"></a> <br>
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

    </script>

</body>

</html>     