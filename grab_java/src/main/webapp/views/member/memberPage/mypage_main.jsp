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
    <link rel="stylesheet" href="../../../resources/member/memberPage/mypage_main.css"
        type="text/css">
    </head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
    <%@ include file="../../include/hospital_nav.jsp" %>
    
    <!-- mypage_header-->
    <section class="mypage">
        <div class="mypage_title">
            <p style="font-size: 30px;">마이페이지</p>
        </div>
    </section>

    <!-- mypage_menu -->
    <section class="mypage_main">

        <div class="mypage_menu">
            <div class="menu_box">
                <ul>
                    <li><a href="#userinfo" onclick="showContent(event, 'userinfo');">회원정보</a></li>
                    <li><a href="#password" onclick="showContent(event, 'password');">비밀번호 변경</a></li>
                    <li><a href="#reviews" onclick="showContent(event, 'reviews');">리뷰 내역</a></li>
                    <li><a href="#posts" onclick="showContent(event, 'posts');">게시판 내역</a></li>
                </ul>
                <p><a href="#">회원탈퇴 &gt;</a></p>
            </div>
        </div>

        <div class="line"></div> <!-- div1 과 div2의 경계-->

        <!-- mypage_profile -->
        <div class="mypage_profile">
            <div class="content">
                <div id="userinfo" class="content-section active">
                    <div class="user-profile">
                        <div class="user-info">
                            <img src="../세미 프로젝트/img/about-us.png" alt="Profile" class="profile-picture"><br><br>
                            <h3>코딩하는 막시무스</h3>
                            <p>리뷰 6
                                <a href="#" id="logout-link" onclick="loginoutServlet()">로그아웃</a>
                            </p>
                        </div>
                        <div class="user-details">
                            <ul>
                                <li><span class="label">아이디</span> heo33swim</li>
                                <li><span class="label">이메일</span> swimming@gmail.com</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- password change -->
                <div id="password" class="content-section">
                    <p id="header_pwd">비밀번호 변경</p>
                    <h6>비밀번호 변경 이용 시 본인 확인을 위해 비밀번호를 입력해 주세요.</h6>
                    <form action="/change-password" method="post">
                        <label for="password">비밀번호</label><br>
                        <input type="password" id="password" name="password" required><br>
                        <button type="submit">다음</button>
                    </form>
                </div>
                <!-- reviews list -->
                <div id="reviews" class="content-section">
                    <h2>리뷰 내역</h2>
                </div>

                <!-- posts list -->
                <div id="posts" class="content-section">
                    <h2>게시판 내역</h2>
                </div>
            </div>
        </div>

    </section>
            
     
    <!-- Footer Section End -->
    <footer>
        <div class="footer_align">
          <div class="footer_content">
            <ul class="notoSansRegular">
              <li>사이트맵</li>
              <li>&nbsp;|&nbsp;</li>
              <li>서비스이용약관</li>
              <li>&nbsp;|&nbsp;</li>
              <li>개인정보처리방침</li>
              <li>&nbsp;|&nbsp;</li>
              <li>사업자정보</li>
              <li>&nbsp;|&nbsp;</li>
              <li>채용공고</li>
              <li>&nbsp;|&nbsp;</li>
              <li>커뮤니티이용약관</li>
            </ul>
            <p class="notoSansLight">
              전화번호 : 010-0000-0000 <br>
              이메일 : abcdefg@hijklmnop.com <br>
              주소 : 서울특별시 금천구 가산디지털2로 95 (가산동, km타워) 3층 305호 <br>
              본 사이트는 저작권법의 보호를 받아 무단 전제 및 복제, 게시를 금합니다.
            </p>
          </div>
          <div class="copyright notoSansLight">
            <p>Copyright &copy; 2024 GDacademy.All Rights Reserved.</p>
          </div>
        </div>
      </footer>
        <!-- Js Plugins -->
   <script src="../../../resources/js/common/jquery-3.7.1.js"></script>
    <script src="../../../resources/js/common/bootstrap.min.js"></script>
    <script src="../../../resources/js/common/jquery.slicknav.js"></script>
    <script src="../../../resources/js/common/owl.carousel.min.js"></script>
    <script src="../../../resources/js/common/main.js"></script>
    <script>
        function showContent(event, section) {
            event.preventDefault();

            var contentSections = document.getElementsByClassName('content-section');
            for (var i = 0; i < contentSections.length; i++) {
                contentSections[i].style.display = 'none';
                contentSections[i].classList.remove('active');
            }

            document.getElementById(section).style.display = 'block';
            document.getElementById(section).classList.add('active');

            var sidebarLinks = document.querySelectorAll('.menu_box ul li a');
            sidebarLinks.forEach(function (link) {
                link.classList.remove('active');
            });

            event.target.classList.add('active');
        }

        function changeColor(event) {
            event.preventDefault();
            event.target.classList.add('clicked');
        }

        document.addEventListener('DOMContentLoaded', function () {
            showContent(new Event('load'), 'userinfo');
        });
        
        function loginoutServlet(){
        	
        }
    </script>
</body>

</html>