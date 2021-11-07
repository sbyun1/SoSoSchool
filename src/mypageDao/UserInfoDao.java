package mypageDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.soso.login.Dto.UserDto;

import common.JDBCTemplate;

public class UserInfoDao extends JDBCTemplate {

	public static int userUpdate(UserDto userdto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		
		int res = 0;
		
		String sql = "UPDATE SOSO_USER SET USER_PR = ?, USER_ID = ?, USER_NAME = ?, "
				+ "PHONE = ?, GRADE = ?,EMAIL = ?, POSTCODE = ?, ROADADDR = ?, "
				+ "DETAILADDR = ?, REGION = ? "
				+ "WHERE USER_NO = ?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, userdto.getUser_pr());
			pstm.setString(2, userdto.getUser_id());
			pstm.setString(3, userdto.getUser_name());
			pstm.setString(4, userdto.getPhone());
			pstm.setInt(5, userdto.getGrade());
			pstm.setString(6, userdto.getEmail());
			pstm.setString(7, userdto.getPostcode());
			pstm.setString(8, userdto.getRoadAddr());
			pstm.setString(9, userdto.getDetailAddr());
			pstm.setString(10, userdto.getRegion());
			pstm.setInt(11, userdto.getUser_no());
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

	public static int userDisable(UserDto userInfo) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		
		int res = 0;
		
		String sql = "UPDATE SOSO_USER SET ENABLED_YN = 'N' WHERE USER_NO = ?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1,userInfo.getUser_no());
			System.out.println("03. query 준비 " + sql);
			
			res = pstm.executeUpdate();
			System.out.println(("04. query 실행 및 리턴"));
			
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

	public static int sub_yn(UserDto userInfo) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		
		int res = 0;
		
		String sql = "UPDATE SOSO_USER SET SUB_YN = 'Y' WHERE USER_NO = ?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1,userInfo.getUser_no());
			System.out.println("03. query 준비 " + sql);
			
			res = pstm.executeUpdate();
			System.out.println(("04. query 실행 및 리턴"));
			
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

	public static int userPwChange(UserDto userInfo,String user_new_pw) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		
		int res = 0;
		
		String sql = "UPDATE SOSO_USER SET USER_PW = ? WHERE USER_NO = ?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1,user_new_pw);
			pstm.setInt(2,userInfo.getUser_no());
			System.out.println("03. query 준비 " + sql);
			
			res = pstm.executeUpdate();
			System.out.println(("04. query 실행 및 리턴"));
			
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

	

}
