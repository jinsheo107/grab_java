<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Deerhost Template">
    <meta name="keywords" content="Deerhost, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>여기아파</title>
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,600,700,800,900&display=swap" rel="stylesheet">
    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            background-color: #F5F5F5;
        }
        .header-section {
            width: 100%;
        }
        .main-content { /* 추가: 전체 콘텐츠를 감싸는 컨테이너 */
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
        }
        .container2 {
            width: 80%;
            max-width: 1200px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            display: flex;
            overflow: hidden;
            margin: 20px auto;
            margin-top: 10%;
        }
        .section-title {
            display: inline-block;
            position: relative;
            text-align: left;
            left: 10%;
            margin-bottom: 20px;
        }
        .section-title::after {
            content: '';
            display: block;
            width: 800%;
            height: 3px;
            background-color: rgb(173, 152, 80);
            position: absolute;
            bottom: -5px;
            left: 400%;
            transform: translateX(-50%);
        }
        .sidebar {
            width: 250px;
            border-right: 1px solid #ddd;
            background-color: #F8F8F8;
            padding: 20px;
        }
        .sidebar h3 {
            margin-top: 0;
            font-size: 24px;
            font-weight: 700;
            margin-bottom: 20px;
        }
        .sidebar ul {
            list-style-type: none;
            padding: 0;
        }
        .sidebar ul li {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        .sidebar ul li a {
            text-decoration: none;
            color: #000;
            display: block;
        }
        .sidebar ul li a.active {
            color: blue;
            font-weight: 600;
        }
        .content {
            flex: 1;
            padding: 20px;
        }
        .content-section {
            display: none;
        }
        .content-section.active {
            display: block;
        }
        .content h2 {
            font-size: 24px;
            margin-bottom: 20px;
        }
        .content p {
            margin: 10px 0;
        }
        .footer {
            background-color: #F1F1F1;
            text-align: center;
            padding: 20px 0;
            font-size: 14px;
            color: #666;
            width: 100%;
            margin-top: auto;
        }
        .footer a {
            color: #666;
            text-decoration: none;
            margin: 0 10px;
        }
        .footer a:hover {
            text-decoration: underline;
        }
        .footer_text {
            margin: 5px 0;
            text-align: left;
            padding-left: 2%;
        }
    </style>
</head>
<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
    <!-- Header Section Begin -->
    <header class="header-section navTop">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3 navBox">
                    <div class="header__logo">
                        <a href="#" class="logo notoSansBold">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" width="33" height="33" fill="currentColor">
                                <path d="M64 32C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H384c35.3 0 64-28.7 64-64V96c0-35.3-28.7-64-64-64H64zM336 152V256 360c0 13.3-10.7 24-24 24s-24-10.7-24-24V280H160l0 80c0 13.3-10.7 24-24 24s-24-10.7-24-24l0-208c0-13.3 10.7-24 24-24s24 10.7 24 24v80H288V152c0-13.3 10.7-24 24-24s24 10.7 24 24z"/>
                            </svg>
                        </a>
                        <a href="#" class="notoSansBold title">
                            여기아파
                        </a>
                    </div>
                </div>
                <div class="">
                    <nav class="header__menu notoSansMedium">
                        <ul>
                            <li class=""><a href="./index.html">커뮤니티</a></li>
                            <li><a href="./hosting.html">마이페이지</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="canvas__open">
                <span class="fa fa-bars"></span>
            </div>
        </div>
    </header>
    <div class="main-content"> <!-- 추가: 전체 콘텐츠를 감싸는 컨테이너 -->
        <div class="container2">
            <div class="sidebar">
                <h3>마이페이지</h3>
                <ul>
                    <li><a href="#userinfo" onclick="showContent('userinfo')">회원정보</a></li>
                    <li><a href="#password" onclick="showContent('password')">비밀번호 변경</a></li>
                    <li><a href="#reviews" onclick="showContent('reviews')">리뷰 내역</a></li>
                    <li><a href="#posts" onclick="showContent('posts')">게시판 내역</a></li>
                    <li><a href="#alerts" onclick="showContent('alerts')">알람 내역</a></li>
                </ul>
                <p><a href="#">회원탈퇴 &gt;</a></p>
            </div>
            <div class="content">
                <div id="userinfo" class="content-section active">
                    <h2>회원정보</h2>
                    <p>코딩하는 막시무스</p>
                    <p>리뷰 6 로그아웃</p>
                    <p><strong>아이디:</strong> heo33swim</p>
                    <p><strong>이메일:</strong> swimming@gmail.com</p>
                </div>
                <div id="password" class="content-section">
                    <h2>비밀번호 변경</h2>
                    <p>비밀번호 변경 이용 시 본인 확인을 위해 비밀번호를 입력해 주세요.</p>
                    <label for="current-password">비밀번호</label>
                    <input type="password" id="current-password" name="current-password">
                    <button>다음</button>
                </div>
                <div id="reviews" class="content-section">
                    <h2>리뷰 내역</h2>
                    <p>리뷰 내역 내용이 여기에 표시됩니다.</p>
                </div>
                <div id="posts" class="content-section">
                    <h2>게시판 내역</h2>
                    <p>게시판 내역 내용이 여기에 표시됩니다.</p>
                </div>
                <div id="alerts" class="content-section">
                    <h2>알람 내역</h2>
                    <p>알람 내역 내용이 여기에 표시됩니다.</p>
                </div>
            </div>
        </div>
    </div>
    <!-- 하단!! -->
    <div class="footer">
<div class="footer_text">
        <p><a href="#">서비스 이용약관</a> | <a href="#">개인정보처리방침</a> | <a href="#">관리자 로그인</a></p>
<p style="">고객센터 123-456-789<br>
        이메일 abcd@efgh.com<br>
        Copyright &copy; GDacademy</p>
    </div>
    </div>
    <!-- Js Plugins -->
    <script src="js/jquery-3.7.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
    <script>
        function showContent(section) {
            var contentSections = document.getElementsByClassName('content-section');
            for (var i = 0; i < contentSections.length; i++) {
                contentSections[i].classList.remove('active');
            }
            document.getElementById(section).classList.add('active');
            var sidebarLinks = document.querySelectorAll('.sidebar ul li a');
            sidebarLinks.forEach(function (link) {
                link.classList.remove('active');
            });
            document.querySelector('.sidebar ul li a[href="#' + section + '"]').classList.add('active');
        }
    </script>
</body>
</html>