package com.grab.common;

public class Paging {
	
	private int totalContent;
	private int totalPage;
	private int pagingBar = 5;
	private int	pagingBarStart = 1;
	private int pagingBarEnd;
	private int nowPage = 1;
	private int boardList = 10;
	private int limitPage;
	
	private boolean prev = true;
	private boolean next = true;
	
	
	public int getTotalContent() {
		return totalContent;
	}
	public void setTotalContent(int totalContent) {
		this.totalContent = totalContent;
		setPaging();
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getPagingBar() {
		return pagingBar;
	}
	public void setPagingBar(int pagingBar) {
		this.pagingBar = pagingBar;
	}
	public int getPagingBarStart() {
		return pagingBarStart;
	}
	public void setPagingBarStart(int pagingBarStart) {
		this.pagingBarStart = pagingBarStart;
	}
	public int getPagingBarEnd() {
		return pagingBarEnd;
	}
	public void setPagingBarEnd(int pagingBarEnd) {
		this.pagingBarEnd = pagingBarEnd;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getBoardList() {
		return boardList;
	}
	public void setBoardList(int boardList) {
		this.boardList = boardList;
	}
	public int getLimitPage() {
		return limitPage;
	}
	public void setLimitPage(int limitPage) {
		this.limitPage = limitPage;
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
	
	
	private void setPaging(){
		
		limitPage = (nowPage-1)*boardList;
		totalPage = (int)Math.ceil((double)totalContent/boardList);
		pagingBarStart = ((nowPage-1)/pagingBar)*pagingBar+1;
		pagingBarEnd = pagingBarStart+pagingBar-1;
		if(pagingBarEnd > totalPage) {
			pagingBarEnd = totalPage;
		}
		if(pagingBarStart == 1) {
			prev = false;
		}
		if(pagingBarEnd >= totalPage) {
			next = false;
		}
		
	}

}
