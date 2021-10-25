package mypageDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCTemplate;
import mypageDto.QnaDto;

public class QnaDao extends JDBCTemplate{

	public List<QnaDto> selectAll() {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<QnaDto> res = new ArrayList<QnaDto>();
		
		String sql = "SELECT * FROM QNA ORDER BY QNA_GNO DESC, QNA_GSQ";
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03. query 준비: " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				QnaDto dto = new QnaDto();
				dto.setQna_no(rs.getInt(1));
				dto.setQna_gno(rs.getInt(2));
				dto.setQna_gsq(rs.getInt(3));
				dto.setQna_tab(rs.getInt(4));
				dto.setQna_title(rs.getString(5));
				dto.setQna_writer(rs.getString(6));
				dto.setQna_content(rs.getString(7));
				dto.setQna_regdate(rs.getDate(8));
				
				res.add(dto);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		return res;
	}
	public QnaDto selectOne(int qna_no) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		QnaDto res = new QnaDto();
		
		String sql = "SELECT * FROM QNA WHERE QNA_NO = ?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, qna_no);
			System.out.println("03. query 준비: " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				res.setQna_no(rs.getInt(1));
				res.setQna_title(rs.getString(5));
				res.setQna_writer(rs.getString(6));
				res.setQna_content(rs.getString(7));
				res.setQna_regdate(rs.getDate(8));
			}
			
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05.db 종료\n");
		}
		return res;
	}
	
	public int insert(QnaDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = "INSERT INTO QNA VALUES(QNA_NO_SQ.NEXTVAL, QNA_GNO_SQ.NEXTVAL,"
				+ "1, 0, ?, ?, ?, DEFAULT)";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getQna_title());
			pstm.setString(2, dto.getQna_writer());
			pstm.setString(3, dto.getQna_content());
			System.out.println("03. query 준비:  " + sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
			
			if(res > 0) {
				commit(con);
			}
			else {
				rollback(con);
			}
			
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		
		return res;
	}
	
	public int update(QnaDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = "UPDATE QNA SET QNA_TITLE = ?, QNA_CONTENT = ? WHERE "
				+ "QNA_NO = ?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getQna_title());
			pstm.setString(2, dto.getQna_content());
			pstm.setInt(3,dto.getQna_no());
			System.out.println("03. query 준비: " + sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
			
			if(res > 0) {
				commit(con);
			}else {
				rollback(con);
			}
			
			
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		
		
		return res;
	}

	public int delete(int qna_no){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = "DELETE FROM QNA WHERE QNA_NO = ?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1,qna_no);
			System.out.println("03.query준비: " + sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
			
			if(res > 0) {
				commit(con);
			}else {
				rollback(con);
			}
			
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
		}
		
		return res;
	}
	
	
	
	
}
