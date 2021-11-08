package mypageDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCTemplate;
import mypageDto.NoticeDto;

public class NoticeDao extends JDBCTemplate{

	public List<NoticeDto> selectAll(){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<NoticeDto> res = new ArrayList<NoticeDto>();
		
		String sql = " SELECT * FROM NOTICE ORDER BY NOTI_GNO DESC, NOTI_GSQ ";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03. query 준비: " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				NoticeDto dto = new NoticeDto();
				dto.setNoti_no(rs.getInt(1));
				dto.setNoti_gno(rs.getInt(2));
				dto.setNoti_gsq(rs.getInt(3));
				dto.setNoti_tab(rs.getInt(4));
				dto.setNoti_title(rs.getString(5));
				dto.setNoti_writer(rs.getString(6));
				dto.setNoti_content(rs.getString(7));
				dto.setNoti_regdate(rs.getDate(8));
				
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

	public NoticeDto selectOne(int notice_no) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		NoticeDto res = new NoticeDto();
		
		String sql = "SELECT * FROM NOTICE WHERE NOTI_NO = ? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, notice_no);
			System.out.println("03. query 준비: " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				res.setNoti_no(rs.getInt(1));
				res.setNoti_title(rs.getString(5));
				res.setNoti_regdate(rs.getDate(8));
				res.setNoti_writer(rs.getString(6));
				res.setNoti_content(rs.getString(7));
			}
			
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
			System.out.println("05.  db 종료\n");
		}
	
		return res;
		
	}

	public int insert(NoticeDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		
		int res = 0;
		
		
		String sql = " INSERT INTO NOTICE VALUES (NOTI_NO_SQ.NEXTVAL, NOTI_GNO_SQ.NEXTVAL,"
				+ "1, 0, ?, DEFAULT, ?, DEFAULT)";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getNoti_title());
			pstm.setString(2, dto.getNoti_content());
			System.out.println("03. query 준비: " + sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 준비");
			
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

	public int update(NoticeDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " UPDATE NOTICE SET NOTI_TITLE = ?, NOTI_CONTENT = ? WHERE NOTI_NO = ? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1,dto.getNoti_title());
			pstm.setString(2, dto.getNoti_content());
			pstm.setInt(3, dto.getNoti_no());
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

	public int delete(int noti_no) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " DELETE FROM NOTICE WHERE NOTI_NO = ? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, noti_no);
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
	
	

	
	
	
}
