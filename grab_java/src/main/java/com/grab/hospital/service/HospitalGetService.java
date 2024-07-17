package com.grab.hospital.service;

import static com.grab.common.sql.JDBCTemplate.close;
import static com.grab.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.grab.hospital.dao.HospitalGetDao;
import com.grab.hospital.vo.Department;
import com.grab.member.dao.MemberDao;

public class HospitalGetService {

	public List<Department> settingDepartment(int no) {
		Connection conn = getConnection();

		List<Department> result = new HospitalGetDao().settingDepartment(no, conn);
		close(conn);

		return result;
	}
}
