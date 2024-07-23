<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>병원에게 질문</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="../../resources/css/community/폰트.css" type="text/css">
    <link rel="stylesheet" href="../../resources/css/community/bootstrap.min.css" type="text/css" >
    <link rel="stylesheet" href="../../resources/css/community/게시글 리스트.css" type="text/css">


</head>
<body>
    <!-- 네비게이션 바 -->
    <%@ include file="../include/hospital_nav.jsp"%>
    <!-- 공지사항 리스트 -->
    <div class="community">
        <div class="board_select">
            <ul class="notoSansMedium">
                <li><a href="/community_board/list">공지사항</a></li>
                <li class="bar"><a href="/Q&A_board/list">병원에게 질문</a></li>
                <li><a href="/information_share/list">병원 정보 공유</a></li>
            </ul>
        </div>
        <div class="communityBody width_size">
            <p class="notoSansMedium">병원에게 질문</p>
            <select name="" id="list_align" size="1" class="notoSansRegular list_align" onchange="align();">
                <option value="1" >최신순</option>
                <option value="2">오래된 순</option>
                <option value="3">조회수 높은 순</option>
                <option value="4">조회수 낮은 순</option>
            </select>
            <script type="text/javascript">
            const align=()=>{
            	const aaa = document.getElementsByClassName('list_align')[0].value;
                alert(aaa);
				const xhr = new XMLHttpRequest();
				xhr.open("post","/align/board?align="+aaa,true);
				console.log(aaa);
				xhr.onreadystatechange = function() {
					if(xhr.readyState == 4 && xhr.status == 200){ // 200: 정상적으로 작동한다는 뜻
						console.log('정상작동');
					}
				}
				xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");
				xhr.send();
				console.log(aaa);
            }
            </script>
            <div class="communityHeader notoSansMedium">
                <ul>
                    <li class="number1">번호</li>
                    <li class="title1">제목</li>
                    <li class="date1">작성 시간</li>
                    <li class="viewCount1">조회수</li>
                </ul>
            </div>
            <div class="communityList notoSansRegular list-group">
            <%@page import="com.grab.community.vo.Board, java.util.*" %>
            <% List<Board> list = (List<Board>)request.getAttribute("boardList");%>
            <%for(int i = 0; i<list.size(); i++){%>
                <a href="/board/content?boardNo=<%=list.get(i).getBoard_no()%>" class="list-group-item-action active tab">
                    <ul>
                        <li class="number2"><%=list.get(i).getBoard_no()%></li>
                        <li class="title2">
                            <%=list.get(i).getBoard_title()%>
                            <p class="content notoSansRegular" onchange="contentSub();">
							<%=list.get(i).getBoard_content()%>
							</p>
							<script type="text/javascript">
								window.onload=()=>{
									const ttt = document.getElementsByClassName("content");
									console.log(ttt);
									for(let i = 0; i<<%=list.size()%>; i++){
									    document.getElementsByClassName("content")[i].innerHTML = document.getElementsByClassName("content")[i].innerHTML.substring(0,85)+'...';
									}
								}
							</script>
                        </li>
                        <li class="date2"><%=list.get(i).getBoard_reg_date()%></li>
                        <li class="viewCount2">
                        	<%=list.get(i).getHits()%>
                        </li>
                    </ul>
                </a>
            <%}%>
                
            </div>
            
            <%if(m.getMember_type() == 2) {%>
            <button type="button" class="btn btn-light board_create">
                <a href="/send/create/board?boardType=2" class="notoSansMedium">
                    글 작성 
                    <svg xmlns="http://www.w3.org/2000/svg" fill="#616161" width="14" height="14" viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M362.7 19.3L314.3 67.7 444.3 197.7l48.4-48.4c25-25 25-65.5 0-90.5L453.3 19.3c-25-25-65.5-25-90.5 0zm-71 71L58.6 323.5c-10.4 10.4-18 23.3-22.2 37.4L1 481.2C-1.5 489.7 .8 498.8 7 505s15.3 8.5 23.7 6.1l120.3-35.4c14.1-4.2 27-11.8 37.4-22.2L421.7 220.3 291.7 90.3z"/></svg>
                </a>
            </button>
            <%} %>
            
            <!-- 페이징 -->
            <% Board paging = (Board)request.getAttribute("paging"); %>
			<% if(paging !=null){ %>
            <div class="paging_align">
            <div class="paging width_size">
                <div class="pagingBox">
                <% if(paging.isPrev()){ %>
                    <a href="/community_board/list?nowPage=<%=(paging.getPagingBarStart()-1)%>">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#4c4c4c" class="bi bi-chevron-left prev" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0"/>
                        </svg>
                    </a>
                <%} %>
                    <ul class="notoSansBold">
                		<% for(int i = paging.getPagingBarStart(); i <= paging.getPagingBarEnd(); i++){ %>
                        <li>
	                        <a href="/community_board/list?nowPage=<%=i%>"<%=paging.getNowPage() == i ? "class='nowPage active'" : "" %>>
	                        <%=i %>
	                        </a>
                        </li>
                        <%} %>
                    </ul>
                    <%if(paging.isNext()){ %>
                    <a href="/board/list?nowPage=<%=(paging.getPagingBarEnd()+1)%>">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#79747E" class="bi bi-chevron-right next" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708"/>
                        </svg>
                    </a>
                    <%} %>
                </div>
            </div>
            </div>
           <%} %>
        </div>
    </div>
    <!-- footer -->
    <footer>
        <div class="footer_align">
        <div class="footer_content width_size">
            <ul class="notoSansRegular width_size">
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


    <!-- <script type="text/javascript" src="../../resources/js/게시글 리스트.js"></script> -->
    <script type="text/javascript" src="../../resources/js/jquery-3.7.1.js"></script>
    <script type="text/javascript" src="../../resources/js/popper.min.js"></script>
    <script type="text/javascript" src="../../resources/js/bootstrap.min.js"></script>
    
</body>
</html>