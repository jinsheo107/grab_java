<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>게시글 작성</title>

  <!-- 폰트 -->
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

  <!-- CSS -->
  <link rel="stylesheet" href="../../resources/css/community/폰트.css" type="text/css">
  <link rel="stylesheet" href="../../resources/css/community/bootstrap.min.css" type="text/css" >
  <link rel="stylesheet" href="../../resources/css/community/게시글 상세.css" type="text/css">

</head>
<body>
  <!-- 네비게이션 바 -->
  <header class="header-section navTop">
    <div class="container ">
        <div class="row">
            <div class="col-lg-3 col-md-3 navBox">
                <div class="header__logo">
                    <a href="#" class="logo">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" width="33" height="33" fill="#f8dd11"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M64 32C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H384c35.3 0 64-28.7 64-64V96c0-35.3-28.7-64-64-64H64zM336 152V256 360c0 13.3-10.7 24-24 24s-24-10.7-24-24V280H160l0 80c0 13.3-10.7 24-24 24s-24-10.7-24-24l0-208c0-13.3 10.7-24 24-24s24 10.7 24 24v80H288V152c0-13.3 10.7-24 24-24s24 10.7 24 24z"/></svg>
                    </a>
                    <a href="#" class="notoSansBold title">
                        여기아파
                    </a>
                </div>
            </div>
            <div class="">
                <nav class="header__menu notoSansMedium">
                    <ul>
                        <li><a href="../../index.jsp">메인</a></li>
                        <li><a href="/community_board/list">커뮤니티</a></li>
                        <li><a href="#">마이페이지</a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="canvas__open">
            <span class="fa fa-bars"></span>
        </div>
    </div>
</header>
<form action="/create/board?boardType=<%=request.getParameter("boardType")%>" method="post" enctype="multipart/form-data">
  <section class="board_align">
    <!-- 게시판 네비 -->
    <div class="board_select">
      <ul class="notoSansMedium">
        <li><a href="/community_board/list">공지사항</a></li>
        <li><a href="/Q&A_board/list">병원에게 질문</a></li>
        <li><a href="/information_share/list">병원 정보 공유</a></li>
        <script type="text/javascript">
			if(<%=request.getParameter("boardType")%>==1){
				document.getElementsByTagName("li")[3].classList.add('bar');
			} else if(<%=request.getParameter("boardType")%>==2){
				document.getElementsByTagName("li")[4].classList.add('bar');
			} else {
				document.getElementsByTagName("li")[5].classList.add('bar');
			}
		</script>
      </ul>
    </div>
    <div class="create_board_title">
      <p>
        <input type="text" name="boardTitle" id="" class="notoSansMedium" placeholder="제목을 입력해주세요">
      </p>
    </div>
  </section>
<!-- 게시글 작성 -->
<section class="create_board_align">
    <!-- 게시글 제목 -->
    <div class="create_board">
      <textarea name="boardContent" id="" class="notoSansRegular" placeholder="글 내용을 입력해 주세요.
비방 글이나 욕설 사용시 게시글이 삭제될 수 있습니다."></textarea>
      <div class="create_board_file">
        <input type="file" name="img" id="" class="board_file_upload">
        <input type="submit" name="" id="" class="board_upload notoSansMedium" value="게시글 등록">
      </div>
    
    </div>
  </section>
  </form>
  <!-- 이전, 다음 페이징 -->
  <section class="paging_align">
    <div class="paging">
      <!-- 이전글 -->
      
    </div>
  </section>
  <!-- footer -->
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

  <!-- 자바 스크립트 & 부트스트랩 -->
  <script type="text/javascript" src="../../resources/js/jquery-3.7.1.js"></script>
  <script type="text/javascript" src="../../resources/js/popper.min.js"></script>
  <script type="text/javascript" src="../../resources/js/bootstrap.min.js"></script>

</body>
</html>