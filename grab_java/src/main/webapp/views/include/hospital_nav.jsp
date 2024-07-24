<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<%@ page import="com.grab.member_detail.vo.Member"%>

<header class="header-section navTop">
	<div class="container ">
		<div class="row">
			<div class="col-lg-3 col-md-3 navBox">
				<div class="header__logo">
					<a href="/index" class="logo notoSansBold"> <svg
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"
							width="33" height="33" fill="currentColor">
                <path
								d="M64 32C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H384c35.3 0 64-28.7 64-64V96c0-35.3-28.7-64-64-64H64zM336 152V256 360c0 13.3-10.7 24-24 24s-24-10.7-24-24V280H160l0 80c0 13.3-10.7 24-24 24s-24-10.7-24-24l0-208c0-13.3 10.7-24 24-24s24 10.7 24 24v80H288V152c0-13.3 10.7-24 24-24s24 10.7 24 24z" />
              </svg>
					</a> <a href="/" class="notoSansBold title">여기아파</a>
				</div>
			</div>
			<div>
				<nav class="header__menu notoSansMedium">
					<ul>

						<%
							Member m = (Member)session.getAttribute("member");

							/* 비로그인 */
							if(m == null) {
						%>
						<!-- <li><a href="/community_board/list">커뮤니티</a></li> -->
						<!-- <li><a href="/member/login">로그인</a></li> -->
						<li><a href="/views/member/memberLogin/login.jsp">로그인</a></li>
						
						<!-- 일반회원 로그인 -->
						<%} else if(m.getMember_type() == 2) {%>
						<li><a href="/community_board/list">커뮤니티</a></li>
						<li><a href="/views/member/memberPage/mypage_main.jsp">마이페이지</a></li>
						<li><a href="/member/logout">로그아웃</a></li>
						<!-- 병원회원 로그인 -->
						<%} else if(m.getMember_type() == 3) {%>
						<li><a href="/community_board/list">커뮤니티</a></li>
						<li><a href="/hospital/hospital_detail?hospital_no=<%= m.getMember_no() %>">병원상세정보</a></li>
						<li><a href="/hospital/hospital_detail_modify?hospital_no=<%= m.getMember_no() %>">병원정보수정</a></li>
						<li><a href="/views/mypage/hospital_mypage.jsp">마이페이지</a></li>
						<li><a href="/member/logout">로그아웃</a></li>
						<!-- 관리자 로그인 -->
						<%} else {%>
						<li><a href="/community_board/list">커뮤니티</a></li>
						<li></li>
						<%} %>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</header>
