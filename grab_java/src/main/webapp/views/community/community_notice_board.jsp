<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>병원 정보 공유 상세 페이지</title>

  <!-- 폰트 -->
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

  <!-- CSS -->
  <link rel="stylesheet" href="../../resources/css/community/폰트.css" type="text/css">
  <link rel="stylesheet" href="../../resources/css/community/bootstrap.min.css" type="text/css" >
  <link rel="stylesheet" href="../../resources/css/community/게시글 상세.css" type="text/css">

</head>
<body>
  <!-- 네비게이션 바 -->
  <%@ include file="../include/hospital_nav.jsp"%>
  <!-- 게시판 상세 -->
  <section class="board_align">
    <div class="board_select">
      <ul class="notoSansMedium">
        <li class="bar"><a href="/community_board/list">공지사항</a></li>
        <li><a href="/Q&A_board/list">병원에게 질문</a></li>
        <li><a href="/information_share/list">병원 정보 공유</a></li>
      </ul>
    </div>
    <!-- 게시글 제목 -->
    <%@page import="com.grab.community.vo.Board,com.grab.community.vo.BoardComment, java.util.*" %>
    <% Board boardContent = (Board)request.getAttribute("boardContent"); %>
    <div class="board_title">
    <!-- 게시글 제목 -->
      <p class="notoSansMedium">
        <%=boardContent.getBoard_title()%>
      </p>
    </div>
    <div class="board boardNo<%=boardContent.getBoard_no()%>">
      <div class="board_header">
        <div class="board_writer notoSansMedium">
        <!-- 작성자명 -->
          <%-- <%=boardContent.getMember_name()%> --%>
          관리자
        </div>
        <p class="board_reg_date notoSansRegular">
        <!-- 수정 날짜 -->
        <%=boardContent.getBoard_no()%>
        <% int boardNo = boardContent.getBoard_no();%>
          <%=boardContent.getBoard_mod_date()%>
        </p>
        <ul>
          <li>
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#79747E" class="bi bi-eye" viewBox="0 0 16 16">
              <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
              <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
            </svg>
            <!-- 조회수 -->
            &nbsp;<%=boardContent.getHits()%>
          </li>
        </ul>
      </div>
      <!-- 게시글 내용 -->
      <div class="board_content notoSansRegular">
        <p style="white-space: pre-line;">
          <%=boardContent.getBoard_content()%>
        </p>
        <% if(boardContent.getBoard_img()!=null){ %>
        <img alt="" src="../../resources/img<%=boardContent.getBoard_img()%>">
        <% } %>
        <div class="update">
          <!-- 토글 -->
          <% if(m.getMember_id().equals(boardContent.getMember_name())) {%>
          <button type="button" class="modify" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-custom-class="custom-tooltip" data-bs-title="게시글 수정">
          	<a href="/send/create/board?boardType=1">
	            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" class="bi bi-pencil-square " viewBox="0 0 16 16">
	              <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
	              <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
	            </svg>
            </a>
          </button>
            <!-- 모달 -->
            <div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1" >
            </div>
            <button type="button" class="modify" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-custom-class="custom-tooltip" data-bs-title="게시글 삭제" onclick="deleteBoard();">
              <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" class="bi bi-trash delete" viewBox="0 0 16 16">
                <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z"/>
                <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z"/>
              </svg>
            </button>
          <% } %>
          </div>
        </div>
      </div>
  </section>
  <script type="text/javascript">
  	const modifyBoard=()=>{
  		const boardNo = document.getElementsByClassName("board")[0].className.substring(13,15)
   		console.log(document.getElementsByClassName("board")[0].className);	
   		 console.log(boardNo);		
   				const xhr = new XMLHttpRequest();
   				console.log(boardNo);
   				xhr.open("post","/send/modify/board?boardType=1",true);
   				console.log(boardNo);
   				xhr.onreadystatechange = function() {
   					if(xhr.readyState == 4 && xhr.status == 200){ // 200: 정상적으로 작동한다는 뜻
   						console.log('정상작동');
   					}
   				}
   				xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");
   				xhr.send();
   				console.log(boardNo);
   		 console.log('test');
  	}
  	const deleteBoard=()=>{
  		if(confirm('게시글을 삭제하시겠습니까?')){
   		 const boardNo = document.getElementsByClassName("board")[0].className.substring(13,15)
   		console.log(document.getElementsByClassName("board")[0].className);	
   		 console.log(boardNo);		
   				const xhr = new XMLHttpRequest();
   				console.log(boardNo);
   				xhr.open("post","/board/delete?boardNo="+boardNo,true);
   				console.log(boardNo);
   				xhr.onreadystatechange = function() {
   					if(xhr.readyState == 4 && xhr.status == 200){ // 200: 정상적으로 작동한다는 뜻
   						console.log('정상작동');
   						alert('게시글이 삭제되었습니다.');
   						location.reload(true);
   					}
   				}
   				xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");
   				xhr.send();
   				console.log(boardNo);
   		 console.log('test');
       }
  	}
  </script>
  
 
  <!-- 이전, 다음 페이징 -->
  <section class="paging_align">
    <div class="paging">
      <!-- 이전글 -->
      <div class="board_prev">
        <a href="/board/content?boardNo=<%=(boardContent.getBoard_no()-1)%>" class="notoSansMedium">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#333" class="bi bi-chevron-left" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0"/>
          </svg>
          이전 글
        </a>
      </div>
      <!-- 다음글 -->
      <div class="board_next">
        <a href="/board/content?boardNo=<%=(boardContent.getBoard_no()+1)%>" class="notoSansMedium">
          다음 글
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#333" class="bi bi-chevron-right" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708"/>
          </svg>
        </a>
      </div>
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
  <script type="text/javascript" src="../../resources/js/공지사항 상세.js"></script>

</body>
</html>