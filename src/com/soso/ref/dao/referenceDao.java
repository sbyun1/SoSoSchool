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
	
	
	
	public List<referenceDto> select(int grade,String subject){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<referenceDto> res = new ArrayList<referenceDto>();
		
		String sql = " SELECT * FROM REF_BOARD WHERE RBOARD_GRADE=? AND RBOARD_SUBJECT=? ";
	
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
}
