package com.grab.member.dao;

import com.grab.member.vo.Member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class MemberDao {
    // 회원 생성 메서드
    public int createMember(Member m) {
        // 회원 정보를 데이터베이스에 삽입
        String sql = "INSERT INTO `member` (member_id, member_pw, member_email, member_type) VALUES (?, ?, ?, ?)";
        int result = 0;
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, m.getMember_id());
            pstmt.setString(2, m.getMember_pw());
            pstmt.setString(3, m.getMember_email());
            pstmt.setInt(4, m.getMember_type());
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    // (아이디) 이메일로 회원 찾기 메서드
    public List<Member> findMembersByEmail(String email) {
    	
        List<Member> members = new ArrayList<>();
        String sql = "SELECT * FROM `member` WHERE member_email = ?";
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Member member = new Member(
                    rs.getInt("member_no"),
                    rs.getString("member_id"),
                    rs.getString("member_pw"),
                    rs.getString("member_email"),
                    rs.getInt("member_type"),
                    rs.getTimestamp("member_login_time").toLocalDateTime()
                );
                members.add(member);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return members;
    }
    // (비밀번호) 아이디로 회원 찾기 메서드
    public Member findMemberById(String memberId) {
    	
        Member member = null;
        String sql = "SELECT * FROM `member` WHERE member_id = ?";
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, memberId);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                member = new Member(
                    rs.getInt("member_no"),
                    rs.getString("member_id"),
                    rs.getString("member_pw"),
                    rs.getString("member_email"),
                    rs.getInt("member_type"),
                    rs.getTimestamp("member_login_time").toLocalDateTime()
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return member;
    }
    // 비밀번호 업데이트 메서드
    public boolean updatePassword(String memberId, String newPassword) {
    	
        String sql = "UPDATE `member` SET member_pw = ? WHERE member_id = ?";
        int result = 0; // 실행 결과를 저장할 변수
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, newPassword);
            pstmt.setString(2, memberId);
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result > 0;
    }
    // DB 연결
    private Connection getConnection() {
        // 실제로는 적절한 데이터베이스 연결 로직을 작성
        return null;
    }
	
}
