package com.grab.common;

public class Paging_admin {
	// 전체 게시글 개수
		private int totalData;
		
		// 전체 페이지 개수
		private int totalPage;
		
		// 페이징바 크기
		private int pageBarSize = 5;
		
		// 페이징바 페이지 시작과 끝
		private int pageBarStart;
		private int pageBarEnd;
		
		// 현재 페이지
		private int nowPage = 1;
		
		// 목록에 보여질 게시글 개수
		private int numPerPage = 10;
		
		// 쿼리에 사용할 limit 값
		private int limitPageNo;
		
		// 이전, 다음 여부(있으면 true)
		private boolean prev = true;
		private boolean next = true;
		
		
		// getter와 setter
		public int getTotalData() {
			return totalData;
		}
		public void setTotalData(int totalData) {
			this.totalData = totalData;
			calcPaging();
		}
		public int getTotalPage() {
			return totalPage;
		}
		public void setTotalPage(int totalPage) {
			this.totalPage = totalPage;
		}
		public int getPageBarSize() {
			return pageBarSize;
		}
		public void setPageBarSize(int pageBarSize) {
			this.pageBarSize = pageBarSize;
		}
		public int getPageBarStart() {
			return pageBarStart;
		}
		public void setPageBarStart(int pageBarStart) {
			this.pageBarStart = pageBarStart;
		}
		public int getPageBarEnd() {
			return pageBarEnd;
		}
		public void setPageBarEnd(int pageBarEnd) {
			this.pageBarEnd = pageBarEnd;
		}
		public int getNowPage() {
			return nowPage;
		}
		public void setNowPage(int nowPage) {
			this.nowPage = nowPage;
		}
		public int getNumPerPage() {
			return numPerPage;
		}
		public void setNumPerPage(int numPerPage) {
			this.numPerPage = numPerPage;
		}
		public int getLimitPageNo() {
			return limitPageNo;
		}
		public void setLimitPageNo(int limitPageNo) {
			this.limitPageNo = limitPageNo;
		}
		public boolean isPrev() {
			return prev;
		}
		public void setPrev(boolean prev) {
			this.prev = prev;
		}
		public boolean isNext() {
			return next;
		}
		public void setNext(boolean next) {
			this.next = next;
		}
		
		// 메소드
		private void calcPaging() {
			limitPageNo = (nowPage-1)*numPerPage;
			
			totalPage = (int)Math.ceil((double)totalData/numPerPage);
			
			pageBarStart = ((nowPage-1)/pageBarSize)*pageBarSize+1;
			pageBarEnd = pageBarStart + pageBarSize -1;
			
			if(pageBarEnd > totalPage) pageBarEnd = totalPage;
			
			if(pageBarStart == 1) prev = false;
			if(pageBarStart >= totalPage) next = false;
			
		}
}
