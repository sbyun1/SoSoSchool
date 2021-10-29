package com.soso.login.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.soso.login.Dto.UserDto;

import common.JDBCTemplate;

public class UserDao extends JDBCTemplate{
	
	//로그인
	public UserDto login(String id,String pw) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		UserDto dto = new UserDto();
		
		String sql = "SELECT * FROM SOSO_USER WHERE USER_ID=? AND USER_PW=?";
		
		try {
			pstm=con.prepareStatement(sql);
			pstm.setString(1, id);
			pstm.setString(2, pw);
			System.out.println("03.query 준비:" + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04.query 실행 및 리턴");
			while(rs.next()) {
				dto.setUser_no(rs.getInt(1));
				dto.setUser_pr(rs.getString(2));
				dto.setUser_name(rs.getString(3));
				dto.setUser_id(rs.getString(4));
				dto.setUser_pw(rs.getString(5));
				dto.setUser_nn(rs.getString(6));
				dto.setGrade(rs.getInt(7));
				dto.setAddr(rs.getString(8));
				dto.setPhone(rs.getInt(9));
				dto.setEmail(rs.getString(10));
				dto.setUser_point(rs.getInt(11));
				dto.setUser_star(rs.getInt(12));
				dto.setSub_yn(rs.getString(13));
				dto.setEnabled_yn(rs.getString(14));
				dto.setUser_type(rs.getString(15));
				dto.setRegion(rs.getString(16));
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 오류");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05.db종료\n");
		}
		return dto;
	}
	
	//아이디 중복 체크
	public String idChk(String user_id) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String res = null;
		
		String sql = "SELECT * FROM SOSO_USER WHERE USER_ID=?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, user_id);
			System.out.println("03.query 준비" + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행");
			while(rs.next()) {
				res = rs.getString(2);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05.db 종료");
		}
		return res;
	}
	
	//회원가입
	public int insertUser(UserDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = "INSERT INTO SOSO_USER VALUES(USER_NO_SQ.NEXTVAL,?,?,?,?,?,?,?,?,?,DEFAULT,DEFAULT,DEFAULT,DEFAULT,DEFAULT,?)";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getUser_pr());
			pstm.setString(2, dto.getUser_name());
			pstm.setString(3, dto.getUser_id());
			pstm.setString(4, dto.getUser_pw());
			pstm.setString(5, dto.getUser_nn());
			pstm.setInt(6, dto.getGrade());
			pstm.setString(7, dto.getAddr());
			pstm.setInt(8, dto.getPhone());
			pstm.setString(9, dto.getEmail());
			pstm.setString(10, dto.getRegion());

			System.out.println("03.query준비"+ sql);
			
			res = pstm.executeUpdate();
			System.out.println("04.query 실행");
			
			if(res>0) {
				commit(con);
			}else {
				rollback(con);
			}
		} catch (SQLException e) {
			System.out.println("3/4에러");
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
			System.out.println("05.db종료");
		}
		return res;
	}
	//ID 찾기
	public String searchId(String name,String email) {
		String id = null;

		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM SOSO_USER WHERE USER_NAME=? AND EMAIL=?";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, name);
			pstm.setString(2, email);
			System.out.println("03.query준비"+ sql);

			rs = pstm.executeQuery();
			System.out.println("04.query 실행");

			while(rs.next()) {
				id = rs.getString(4);
			}

		} catch (SQLException e) {
			System.out.println("3/4에러");
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
			System.out.println("05.db종료");
		}

		return id;
	}

	//PW 찾기
	public String searchPw(String name,String email,String id) {
		String pw = null;

		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM SOSO_USER WHERE USER_NAME=? AND EMAIL=? AND USER_ID=?";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, name);
			pstm.setString(2, email);
			pstm.setString(3, id);
			System.out.println("03.query준비"+ sql);

			rs = pstm.executeQuery();
			System.out.println("04.query 실행");

			while(rs.next()) {
				pw = rs.getString(5);
			}

		} catch (SQLException e) {
			System.out.println("3/4에러");
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
			System.out.println("05.db종료");
		}

		return pw;
	}
	
	// 전체 포인트 순위
	public List<UserDto> pointAll(){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<UserDto> res = new ArrayList<UserDto>();
		
		String sql = "SELECT * FROM SOSO_USER ORDER BY USER_POINT DESC";

		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03.query 준비:"+ sql);
			
			rs= pstm.executeQuery();
			System.out.println("04.query 실행");
			while(rs.next()) {
				UserDto dto = new UserDto();
				dto.setUser_no(rs.getInt(1));
				dto.setUser_pr(rs.getString(2));
				dto.setUser_name(rs.getString(3));
				dto.setUser_id(rs.getString(4));
				dto.setUser_pw(rs.getString(5));
				dto.setUser_nn(rs.getString(6));
				dto.setGrade(rs.getInt(7));
				dto.setAddr(rs.getString(8));
				dto.setPhone(rs.getInt(9));
				dto.setEmail(rs.getString(10));
				dto.setUser_point(rs.getInt(11));
				dto.setUser_star(rs.getInt(12));
				dto.setSub_yn(rs.getString(13));
				dto.setEnabled_yn(rs.getString(14));
				dto.setUser_type(rs.getString(15));
				dto.setRegion(rs.getString(16));
				
				res.add(dto);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05.db종료\n");
		}
		return res;
	}
	
	// 로그인 한 유저 순위
	public UserDto pointSelect(int no) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		UserDto res = null;
		
		String sql = "SELECT * FROM(SELECT ROWNUM R, A.USER_NO,"
				+ " A.USER_ID, A.USER_POINT FROM(SELECT"
				+ " USER_NO, USER_ID, USER_POINT FROM SOSO_USER"
				+ " ORDER BY USER_POINT DESC) A) B WHERE USER_NO = ? ";
		
		/*
		 * String sql ="SELECT * FROM" + " SOSO_USER WHERE USER_NO = ?"
		 */;

		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, no);
			System.out.println("03.query 준비:"  + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04.query 실행 및 리턴");
			
			while(rs.next()) {
				res = new UserDto();
				res.setUser_no(rs.getInt(1));
				res.setUser_name(rs.getString(2));
				res.setUser_id(rs.getString(3));
				
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
		}
		
		return res;
	}
	// 지역 전체 포인트 순위
	public List<UserDto> region_pointAll(String region){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<UserDto> res = new ArrayList<UserDto>();

		String sql = "SELECT * FROM SOSO_USER WHERE REGION = ? ORDER BY USER_POINT DESC";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, region);
			System.out.println("03.query 준비:"+ sql);

			rs= pstm.executeQuery();
			System.out.println("04.query 실행");
			while(rs.next()) {
				UserDto dto = new UserDto();
				dto.setUser_no(rs.getInt(1));
				dto.setUser_pr(rs.getString(2));
				dto.setUser_name(rs.getString(3));
				dto.setUser_id(rs.getString(4));
				dto.setUser_pw(rs.getString(5));
				dto.setUser_nn(rs.getString(6));
				dto.setGrade(rs.getInt(7));
				dto.setAddr(rs.getString(8));
				dto.setPhone(rs.getInt(9));
				dto.setEmail(rs.getString(10));
				dto.setUser_point(rs.getInt(11));
				dto.setUser_star(rs.getInt(12));
				dto.setSub_yn(rs.getString(13));
				dto.setEnabled_yn(rs.getString(14));
				dto.setUser_type(rs.getString(15));
				dto.setRegion(rs.getString(16));

				res.add(dto);
			}

		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05.db종료\n");
		}
		return res;
	}

	// 로그인 한 유저 지역 순위
	public UserDto region_point(int user_no, String region) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		UserDto res = null;

		String sql = "SELECT * FROM(SELECT ROWNUM R, A.USER_NO, A.USER_ID, A.USER_POINT FROM(SELECT USER_NO, USER_ID, USER_POINT, REGION FROM SOSO_USER WHERE REGION = ? ORDER BY USER_POINT DESC) A) WHERE USER_NO = ?";

		/*
		 * String sql ="SELECT * FROM" + " SOSO_USER WHERE USER_NO = ?"
		 */;


		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, region);
			pstm.setInt(2, user_no);
			System.out.println("03.query 준비:"  + sql);

			rs = pstm.executeQuery();
			System.out.println("04.query 실행 및 리턴");

			while(rs.next()) {
				res = new UserDto();
				res.setUser_no(rs.getInt(1));
				res.setUser_name(rs.getString(2));
				res.setUser_id(rs.getString(3));
				res.setRegion(rs.getString(4));
			}

		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
		}
		return res;
	}

	//유저 하나 정보 가져오기
	public UserDto selectuser(int user_no){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		UserDto dto = new UserDto();

		String sql = "SELECT * FROM SOSO_USER WHERE USER_NO = ?";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, user_no);
			System.out.println("03. query 준비 " + sql);

			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");

			if(rs.next()){
				dto.setUser_no(rs.getInt(1));
				dto.setUser_pr(rs.getString(2));
				dto.setUser_name(rs.getString(3));
				dto.setUser_id(rs.getString(4));
				dto.setUser_pw(rs.getString(5));
				dto.setUser_nn(rs.getString(6));
				dto.setGrade(rs.getInt(7));
				dto.setAddr(rs.getString(8));
				dto.setPhone(rs.getInt(9));
				dto.setEmail(rs.getString(10));
				dto.setUser_point(rs.getInt(11));
				dto.setUser_star(rs.getInt(12));
				dto.setSub_yn(rs.getString(13));
				dto.setEnabled_yn(rs.getString(14));
				dto.setUser_type(rs.getString(15));
				dto.setRegion(rs.getString(16));
			}
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		}finally {
			close(con);
			close(rs);
			close(pstm);
			System.out.println("05. db 종료 \n");
		}
		return dto;
	}

	//사용한 스타 수정하기
	public int update_star(int change_user_star, int user_no){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;

		String sql = "UPDATE SOSO_USER SET USER_STAR = ? WHERE USER_NO = ?";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, change_user_star);
			pstm.setInt(2, user_no);
			System.out.println("03. query 준비 " + sql);

			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");

			if(res > 0){
				commit(con);
			}else {
				rollback(con);
			}
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		}finally {
			close(con);
			close(pstm);
			System.out.println("05. db 종료 \n");
		}
		return res;
	}
}

	


