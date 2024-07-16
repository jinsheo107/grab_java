package com.grab.hospital.service;

import static com.grab.common.sql.JDBCTemplate.close;
import static com.grab.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.grab.hospital.dao.HospitalSettingDepartmentDao;
import com.grab.hospital.vo.Department;
import com.grab.member.dao.MemberDao;

public class HospitalSettingDepartmentService {

	public List<Department> settingDepartment(int no) {
		Connection conn = getConnection();

		List<Department> result = new HospitalSettingDepartmentDao().settingDepartment(no, conn);
		close(conn);

		return result;
	}
}
