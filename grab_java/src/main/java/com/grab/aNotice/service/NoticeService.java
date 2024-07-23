package com.grab.aNotice.service;

import static com.grab.common.JDBCTemplate.close;
import static com.grab.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.grab.aNotice.dao.NoticeDao;
import com.grab.aNotice.vo.Notice;

public class NoticeService {
	
	public Notice getNoticeByNo(int notice_no) {
		Connection conn = getConnection();
		Notice result = new NoticeDao().getNoticeByNo(notice_no, conn);
		close(conn);
		return result;
	}
	
	public int createNotice(Notice n) {
		Connection conn = getConnection();
		int result = new NoticeDao().createNotice(n, conn);
		close(conn);
		return result;
	}
	
	public int selectNoticeCount(Notice option) {
		Connection conn = getConnection();
		int result = new NoticeDao().selectNoticeCount(option, conn);
		close(conn);
		return result;
	}
	
	public Notice viewNotice(int notice_no){
		Connection conn = getConnection();
		Notice n = new NoticeDao().viewNotice(notice_no, conn);
		close(conn);
		return n;
	}
	
	public List<Notice> selectNoticeList(Notice option){
		Connection conn = getConnection();
		List<Notice> list = new NoticeDao().selectNoticeList(option, conn);
		close(conn);
		return list;
	}
	
	public int updateNotice(int notice_no, String notice_title, String notice_content) {
		Connection conn = getConnection();
		int result = new NoticeDao().updateNotice(notice_no, notice_title, notice_content, conn);
		close(conn);
		return result;
	}
	
	public int deleteNotice(int notice_no) {
		Connection conn = getConnection();
		int result = new NoticeDao().deleteNotice(notice_no, conn);
		close(conn);
		return result;
	}
}
