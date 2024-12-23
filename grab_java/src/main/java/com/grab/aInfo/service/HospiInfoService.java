package com.grab.aInfo.service;

import static com.grab.common.sql.JDBCTemplate.close;
import static com.grab.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.grab.aInfo.dao.HospiInfoDao;
import com.grab.aInfo.vo.HospiInfo;


public class HospiInfoService {

//	public HospiInfo viewHospiInfo(int notice_no){
//		Connection conn = getConnection();
//		HospiInfo hi = new HospiInfoDao().viewHospiInfo(notice_no, conn);
//		close(conn);
//		return hi;
//	}
	
	public int selectHospiInfoCount(HospiInfo option) {
		Connection conn = getConnection();
		int result = new HospiInfoDao().selectHospiInfoCount(option, conn);
		close(conn);
		return result;
	}
	
	public List<HospiInfo> selectHospiInfoList(HospiInfo option){
		Connection conn = getConnection();
		List<HospiInfo> list = new HospiInfoDao().selectHospiInfoList(option, conn);
		close(conn);
		return list;
	}
	
	public HospiInfo viewHospiInfo(int hospital_no) {
		Connection conn = getConnection();
		HospiInfo hi = new HospiInfoDao().viewHospiInfo(hospital_no, conn);
		close(conn);
		return hi;
	}
	
	public int permit(int hospital_no) {
		Connection conn = getConnection();
		int result = new HospiInfoDao().permit(hospital_no, conn);
		close(conn);
		return result;
	}
}
