package com.soso.ref.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.soso.ref.dto.referenceDto;

import common.JDBCTemplate;
import mypageDto.NoticeDto;

public class referenceDao extends JDBCTemplate{
	public List<referenceDto> selectall(){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<referenceDto> res = new ArrayList<referenceDto>();

		String sql = "SELECT * FROM REF_BOARD ORDER BY RBOARD_GRADE ASC ";

		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03. query 준비 " + sql);

			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");

			while(rs.next()){
				referenceDto dto = new referenceDto();

				dto.setRboard_no(rs.getInt(1));
				dto.setRboard_title(rs.getString(2));
				dto.setRboard_content(rs.getString(3));
				dto.setRboard_regdate(rs.getDate(4));
				dto.setRboard_grade(rs.getInt(5));
				dto.setRboard_subject(rs.getString(6));
				dto.setRboard_type(rs.getString(7));

				res.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		}finally {
			close(con);
			close(pstm);
			close(rs);
		}
		return res;
	}
	
	public List<referenceDto> select(int grade,String subject){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<referenceDto> res = new ArrayList<referenceDto>();
		
		String sql = " SELECT * FROM REF_BOARD WHERE RBOARD_GRADE=? AND RBOARD_SUBJECT=? ORDER BY RBOARD_NO DESC";
	
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, grade);
			pstm.setString(2,subject);
			System.out.println("03. query 준비: ");
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			while(rs.next()) {
				referenceDto dto = new referenceDto();
				dto.setRboard_no(rs.getInt(1));
				dto.setRboard_title(rs.getString(2));
				dto.setRboard_content(rs.getString(3));
				dto.setRboard_regdate(rs.getDate(4));
				dto.setRboard_grade(rs.getInt(5));
				dto.setRboard_subject(rs.getString(6));
				dto.setRboard_type(rs.getString(7));
				
				res.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		return res;
		
	}
	
	// 학년별 메인페이지 보이기
	
	public List<referenceDto> selectGrade(int grade){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		//referenceDto res = null;
		List<referenceDto> res = new ArrayList<referenceDto>();
		
		String sql = "SELECT * FROM REF_BOARD WHERE RBOARD_GRADE=? ORDER BY RBOARD_REGDATE DESC ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, grade);
			System.out.println("03. query 준비: " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				referenceDto dto = new referenceDto();
				dto.setRboard_no(rs.getInt(1));
				dto.setRboard_title(rs.getString(2));
				dto.setRboard_content(rs.getString(3));
				dto.setRboard_regdate(rs.getDate(4));
				dto.setRboard_grade(rs.getInt(5));
				dto.setRboard_subject(rs.getString(6));
				dto.setRboard_type(rs.getString(7));
				
				res.add(dto);
				
			}
			
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		
		return res;
	
	}
	
	public referenceDto selectOne(int rboard_no) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		referenceDto res = new referenceDto();
		
		String sql = " SELECT * FROM REF_BOARD WHERE RBOARD_NO=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, rboard_no);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				res.setRboard_no(rs.getInt(1));
				res.setRboard_title(rs.getString(2));
				res.setRboard_content(rs.getString(3));
				res.setRboard_regdate(rs.getDate(4));
				res.setRboard_grade(rs.getInt(5));
				res.setRboard_subject(rs.getString(6));
				res.setRboard_type(rs.getString(7));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
		}
		return res;
	}

	//글 작성
	public int insert(referenceDto dto){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;

		String sql = "INSERT INTO REF_BOARD VALUES (RBOARD_NO_SQ.nextval, ?,?,SYSDATE,?,?,?)";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getRboard_title());
			pstm.setString(2, dto.getRboard_content());
			pstm.setInt(3, dto.getRboard_grade());
			pstm.setString(4, dto.getRboard_subject());
			pstm.setString(5, dto.getRboard_type());
			System.out.println("03. query 준비 " + sql);

			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");

			if(res > 0){
				commit(con);
			}else{
				rollback(con);
			}
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		}finally {
			close(con);
			close(pstm);
		}
		return res;
	}
	//글 수정
	public int update(referenceDto dto){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;

		String sql = "UPDATE REF_BOARD SET RBOARD_TITLE = ?, RBOARD_CONTENT = ?, RBOARD_GRADE = ?, RBOARD_SUBJECT = ?, RBOARD_TYPE = ? WHERE RBOARD_NO = ?";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getRboard_title());
			pstm.setString(2, dto.getRboard_content());
			pstm.setInt(3, dto.getRboard_grade());
			pstm.setString(4, dto.getRboard_subject());
			pstm.setString(5, dto.getRboard_type());
			pstm.setInt(6, dto.getRboard_no());
			System.out.println("03. query 준비 " + sql);

			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");

			if(res > 0){
				commit(con);
			}else{
				rollback(con);
			}
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		}finally {
			close(con);
			close(pstm);
		}
		return res;
	}
	//글 삭제
	public int delete(int no){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;

		String sql = "DELETE REF_BOARD WHERE RBOARD_NO = ?";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, no);
			System.out.println("03. query 준비 " + sql);

			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");

			if(res > 0){
				commit(con);
			}else{
				rollback(con);
			}
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		}finally {
			close(con);
			close(pstm);
		}
		return res;
	}
}