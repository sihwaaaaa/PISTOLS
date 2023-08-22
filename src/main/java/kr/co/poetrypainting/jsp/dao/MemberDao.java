package kr.co.poetrypainting.jsp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.poetrypainting.jsp.domain.Board;
import kr.co.poetrypainting.jsp.domain.Member;
import kr.co.poetrypainting.jsp.util.DBConn;

public class MemberDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public void insert(Member member) {
		conn = DBConn.getConnection();
		// 처리할 sql구문
		String sql = "insert into tbl_member(id, pw, name) values (?, ?, ?)";

		try {
			// 문장 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getName());
			// 문장 처리
			pstmt.executeUpdate();
	
			close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Member selectOne(String id) {
		conn = DBConn.getConnection();
		// 반환 예정 객체
		Member member = null;
		// 처리할 sql구문
		String sql = "select * from tbl_member where id = '" + id + "'";
		try {
			// 문장생성
			pstmt = conn.prepareStatement(sql);

			// 결과집합 반환
			rs = pstmt.executeQuery( );

			// 결과집합 >> 자바 객체
			if (rs.next()) {
				int idx = 1;

				// 객체생성 후 값 바인딩
				member = new Member(rs.getString(idx++), rs.getString(idx++), rs.getString(idx++), rs.getDate(idx++));
			}
			close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// 결과 반환
		return member;

	}
	
	
	public void update(Member member) {
		conn = DBConn.getConnection();
		// 처리할 sql구문
		String sql = "update tbl_member set\r\n"
				+ "	pw = ?,\r\n"
				+ "	name = ?\r\n"
				+ "where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getPw());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getId());
			// 문장 생성

			// 문장 처리
			pstmt.executeUpdate();
			close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void delete(String id) {
		conn = DBConn.getConnection();
		
		// 처리할 sql구문
		String sql = "delete from tbl_member where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			// 문장 생성

			// 문장 처리
			pstmt.executeUpdate();
			close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	

	// 자원 반환
	public void close() {
		conn = DBConn.getConnection();
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
			}

		}
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
			}

		}

	}

	public static void main(String[] args) {
		MemberDao dao = new MemberDao();
//		dao.insert(new MemberVo("id1", "1234", "홍길동", null));
	}
}
