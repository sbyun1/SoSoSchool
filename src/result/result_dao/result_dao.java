package result.result_dao;

import result.result_dto.result_dto;
import common.JDBCTemplate;

import java.sql.*;
import java.util.*;

public class result_dao extends JDBCTemplate {
    //성적 가져오기

    //현재
    public result_dto select_month(){
        Connection con = getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        result_dto res = new result_dto();

        String sql = "SELECT * FROM RESULT WHERE USER_ID='weed'";    //user_id로 where 작성 예정

        try {
            pstm = con.prepareStatement(sql);
            System.out.println("03. query 준비 " + sql);

            rs = pstm.executeQuery();
            System.out.println("04. query 실행 및 리턴");

            if(rs.next()){
                res.setUser_id(rs.getString(1));
                res.setMonth(rs.getInt(2));
                res.setKor(rs.getInt(3));
                res.setMath(rs.getInt(4));
                res.setEng(rs.getInt(5));
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
        return res;
    }
    //한달전
    public result_dto select_month_1(){
        Connection con = getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        result_dto res = new result_dto();

        String sql = "SELECT * FROM RESULT WHERE USER_ID='weed' AND MONTH = EXTRACT(MONTH FROM SYSDATE)-1";    //user_id로 where 작성 예정

        try {
            pstm = con.prepareStatement(sql);
            System.out.println("03. query 준비 " + sql);

            rs = pstm.executeQuery();
            System.out.println("04. query 실행 및 리턴");

            if(rs.next()){
                res.setUser_id(rs.getString(1));
                res.setMonth(rs.getInt(2));
                res.setKor(rs.getInt(3));
                res.setMath(rs.getInt(4));
                res.setEng(rs.getInt(5));
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
        return res;
    }
    //두달전
    public result_dto select_month_2(){
        Connection con = getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        result_dto res = new result_dto();

        String sql = "SELECT * FROM RESULT WHERE USER_ID='weed' AND MONTH = EXTRACT(MONTH FROM SYSDATE)-2";    //user_id로 where 작성 예정

        try {
            pstm = con.prepareStatement(sql);
            System.out.println("03. query 준비 " + sql);

            rs = pstm.executeQuery();
            System.out.println("04. query 실행 및 리턴");

            if(rs.next()){
                res.setUser_id(rs.getString(1));
                res.setMonth(rs.getInt(2));
                res.setKor(rs.getInt(3));
                res.setMath(rs.getInt(4));
                res.setEng(rs.getInt(5));
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
        return res;
    }
    ///////////////////////////////////////////////////////////
}
