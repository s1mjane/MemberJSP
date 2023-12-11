package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.example.bean.MemberVO;
import com.example.util.JDBCUtil;

public class MemberDAO {

	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;

	private final String M_INSERT = "insert into member (userid, password, username, email, detail) values (?,?,?,?,?)";
	private final String M_UPDATE = "update member set username=?, email=?, detail=? where sid=?";
	private final String M_DELETE = "delete from member  where sid=?";
	private final String M_SELECT = "select * from member where sid=?";
	private final String M_LIST = "select * from member order by regdate desc";

	public int insertMember(MemberVO vo) {
		System.out.println("===> JDBC로 insertMember() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(M_INSERT);
			stmt.setString(1, vo.getUserid());
			stmt.setString(2, vo.getPassword());
			stmt.setString(3, vo.getUsername());
			stmt.setString(4, vo.getEmail());
			stmt.setString(5, vo.getDetail());
			stmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public void deleteMember(MemberVO vo) {
		System.out.println("===> JDBC로 deleteMember() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(M_DELETE);
			stmt.setInt(1, vo.getSid());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int updateMember(MemberVO vo) {
		System.out.println("===> JDBC로 updateMember() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(M_UPDATE);
			stmt.setString(1, vo.getUsername());
			stmt.setString(2, vo.getEmail());
			stmt.setString(3, vo.getDetail());
			stmt.setInt(4, vo.getSid());

			System.out.println(vo.getUsername() + "-" + vo.getEmail() + "-" + vo.getDetail() + "-" + vo.getSid());
			stmt.executeUpdate();
			return 1;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public MemberVO getMember(int sid) {
		MemberVO one = new MemberVO();
		System.out.println("===> JDBC로 getMember() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(M_SELECT);
			stmt.setInt(1, sid);
			rs = stmt.executeQuery();
			if(rs.next()) {
				one.setSid(rs.getInt("sid"));
				one.setUserid(rs.getString("userid"));
				one.setPassword(rs.getString("password"));
				one.setUsername(rs.getString("username"));
				one.setEmail(rs.getString("email"));
				one.setDetail(rs.getString("detail"));
				one.setRegdate(rs.getDate("regdate"));
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return one;
	}

	public List<MemberVO> getMemberList(){
		List<MemberVO> list = new ArrayList<MemberVO>();
		System.out.println("===> JDBC로 getMemberList() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(M_LIST);
			rs = stmt.executeQuery();
			while(rs.next()) {
				MemberVO one = new MemberVO();
				one.setSid(rs.getInt("sid"));
				one.setUserid(rs.getString("userid"));
				one.setPassword(rs.getString("password"));
				one.setUsername(rs.getString("username"));
				one.setEmail(rs.getString("email"));
				one.setDetail(rs.getString("detail"));
				one.setRegdate(rs.getDate("regdate"));
				list.add(one);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
