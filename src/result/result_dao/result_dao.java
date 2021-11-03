package result.result_dao;

import result.result_dto.result_eng_dto;
import result.result_dto.result_kor_dto;
import common.JDBCTemplate;
import result.result_dto.result_math_dto;

import java.sql.*;

public class result_dao extends JDBCTemplate {
    //성적 존재 유무 확인

    //현재
    public int check_kor(String user_id){
        Connection con = getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        int res = 0;

        String sql = "SELECT COUNT(*) FROM RESULT_KOR WHERE EXISTS(SELECT * FROM RESULT_KOR WHERE USER_ID= ? AND MONTH = EXTRACT(MONTH FROM SYSDATE))";

        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, user_id);
            System.out.println("03. query 준비 " + sql);

            rs = pstm.executeQuery();
            System.out.println("04. quert 실행 및 리턴");

            if(rs.next()){
                res = rs.getInt(1);
            }

        } catch (SQLException e) {
            System.out.println("3/4 단계 오류");
            e.printStackTrace();
        }finally {
            close(con);
            close(pstm);
            close(rs);
            System.out.println("05. db 종료");
        }
        return res;
    }
    public int check_eng(String user_id){
        Connection con = getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        int res = 0;

        String sql = "SELECT COUNT(*) FROM RESULT_ENG WHERE EXISTS(SELECT * FROM RESULT_ENG WHERE USER_ID= ? AND MONTH = EXTRACT(MONTH FROM SYSDATE))";

        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, user_id);
            System.out.println("03. query 준비 " + sql);

            rs = pstm.executeQuery();
            System.out.println("04. quert 실행 및 리턴");

            if(rs.next()){
                res = rs.getInt(1);
            }

        } catch (SQLException e) {
            System.out.println("3/4 단계 오류");
            e.printStackTrace();
        }finally {
            close(con);
            close(pstm);
            close(rs);
            System.out.println("05. db 종료");
        }
        return res;
    }
    public int check_math(String user_id){
        Connection con = getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        int res = 0;

        String sql = "SELECT COUNT(*) FROM RESULT_MATH WHERE EXISTS(SELECT * FROM RESULT_MATH WHERE USER_ID= ? AND MONTH = EXTRACT(MONTH FROM SYSDATE))";

        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, user_id);
            System.out.println("03. query 준비 " + sql);

            rs = pstm.executeQuery();
            System.out.println("04. quert 실행 및 리턴");

            if(rs.next()){
                res = rs.getInt(1);
            }

        } catch (SQLException e) {
            System.out.println("3/4 단계 오류");
            e.printStackTrace();
        }finally {
            close(con);
            close(pstm);
            close(rs);
            System.out.println("05. db 종료");
        }
        return res;
    }

    //한달 전
    public int check_kor_1(String user_id){
        Connection con = getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        int res = 0;

        String sql = "SELECT COUNT(*) FROM RESULT_KOR WHERE EXISTS(SELECT * FROM RESULT_KOR WHERE USER_ID= ? AND MONTH = EXTRACT(MONTH FROM SYSDATE)-1)";

        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, user_id);
            System.out.println("03. query 준비 " + sql);

            rs = pstm.executeQuery();
            System.out.println("04. quert 실행 및 리턴");

            if(rs.next()){
                res = rs.getInt(1);
            }

        } catch (SQLException e) {
            System.out.println("3/4 단계 오류");
            e.printStackTrace();
        }finally {
            close(con);
            close(pstm);
            close(rs);
            System.out.println("05. db 종료");
        }
        return res;
    }
    public int check_eng_1(String user_id){
        Connection con = getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        int res = 0;

        String sql = "SELECT COUNT(*) FROM RESULT_ENG WHERE EXISTS(SELECT * FROM RESULT_ENG WHERE USER_ID= ? AND MONTH = EXTRACT(MONTH FROM SYSDATE)-1)";

        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, user_id);
            System.out.println("03. query 준비 " + sql);

            rs = pstm.executeQuery();
            System.out.println("04. quert 실행 및 리턴");

            if(rs.next()){
                res = rs.getInt(1);
            }

        } catch (SQLException e) {
            System.out.println("3/4 단계 오류");
            e.printStackTrace();
        }finally {
            close(con);
            close(pstm);
            close(rs);
            System.out.println("05. db 종료");
        }
        return res;
    }
    public int check_math_1(String user_id){
        Connection con = getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        int res = 0;

        String sql = "SELECT COUNT(*) FROM RESULT_MATH WHERE EXISTS(SELECT * FROM RESULT_MATH WHERE USER_ID= ? AND MONTH = EXTRACT(MONTH FROM SYSDATE)-1)";

        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, user_id);
            System.out.println("03. query 준비 " + sql);

            rs = pstm.executeQuery();
            System.out.println("04. quert 실행 및 리턴");

            if(rs.next()){
                res = rs.getInt(1);
            }

        } catch (SQLException e) {
            System.out.println("3/4 단계 오류");
            e.printStackTrace();
        }finally {
            close(con);
            close(pstm);
            close(rs);
            System.out.println("05. db 종료");
        }
        return res;
    }

    //두달 전
    public int check_kor_2(String user_id){
        Connection con = getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        int res = 0;

        String sql = "SELECT COUNT(*) FROM RESULT_KOR WHERE EXISTS(SELECT * FROM RESULT_KOR WHERE USER_ID= ? AND MONTH = EXTRACT(MONTH FROM SYSDATE)-2)";

        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, user_id);
            System.out.println("03. query 준비 " + sql);

            rs = pstm.executeQuery();
            System.out.println("04. quert 실행 및 리턴");

            if(rs.next()){
                res = rs.getInt(1);
            }

        } catch (SQLException e) {
            System.out.println("3/4 단계 오류");
            e.printStackTrace();
        }finally {
            close(con);
            close(pstm);
            close(rs);
            System.out.println("05. db 종료");
        }
        return res;
    }
    public int check_eng_2(String user_id){
        Connection con = getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        int res = 0;

        String sql = "SELECT COUNT(*) FROM RESULT_ENG WHERE EXISTS(SELECT * FROM RESULT_ENG WHERE USER_ID= ? AND MONTH = EXTRACT(MONTH FROM SYSDATE)-2)";

        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, user_id);
            System.out.println("03. query 준비 " + sql);

            rs = pstm.executeQuery();
            System.out.println("04. quert 실행 및 리턴");

            if(rs.next()){
                res = rs.getInt(1);
            }

        } catch (SQLException e) {
            System.out.println("3/4 단계 오류");
            e.printStackTrace();
        }finally {
            close(con);
            close(pstm);
            close(rs);
            System.out.println("05. db 종료");
        }
        return res;
    }
    public int check_math_2(String user_id){
        Connection con = getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        int res = 0;

        String sql = "SELECT COUNT(*) FROM RESULT_MATH WHERE EXISTS(SELECT * FROM RESULT_MATH WHERE USER_ID= ? AND MONTH = EXTRACT(MONTH FROM SYSDATE)-2)";

        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, user_id);
            System.out.println("03. query 준비 " + sql);

            rs = pstm.executeQuery();
            System.out.println("04. quert 실행 및 리턴");

            if(rs.next()){
                res = rs.getInt(1);
            }

        } catch (SQLException e) {
            System.out.println("3/4 단계 오류");
            e.printStackTrace();
        }finally {
            close(con);
            close(pstm);
            close(rs);
            System.out.println("05. db 종료");
        }
        return res;
    }


    //성적 가져오기

    //현재
    public result_kor_dto select_month_kor(String user_id){
        Connection con = getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        result_kor_dto res = new result_kor_dto();

        String sql = "SELECT * FROM RESULT_KOR WHERE USER_ID=? AND MONTH = EXTRACT(MONTH FROM SYSDATE)";    //user_id로 where 작성 예정

        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, user_id);
            System.out.println("03. query 준비 " + sql);

            rs = pstm.executeQuery();
            System.out.println("04. query 실행 및 리턴");

            if(rs.next()){
                res.setUser_id(rs.getString(1));
                res.setMonth(rs.getInt(2));
                res.setDay(rs.getInt(3));
                res.setKor(rs.getInt(4));
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
    public result_eng_dto select_month_eng(String user_id){
        Connection con = getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        result_eng_dto res = new result_eng_dto();

        String sql = "SELECT * FROM RESULT_ENG WHERE USER_ID=? AND MONTH = EXTRACT(MONTH FROM SYSDATE)";    //user_id로 where 작성 예정

        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, user_id);
            System.out.println("03. query 준비 " + sql);

            rs = pstm.executeQuery();
            System.out.println("04. query 실행 및 리턴");

            if(rs.next()){
                res.setUser_id(rs.getString(1));
                res.setMonth(rs.getInt(2));
                res.setDay(rs.getInt(3));
                res.setEng(rs.getInt(4));
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
    public result_math_dto select_month_math(String user_id){
        Connection con = getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        result_math_dto res = new result_math_dto();

        String sql = "SELECT * FROM RESULT_MATH WHERE USER_ID=? AND MONTH = EXTRACT(MONTH FROM SYSDATE)";    //user_id로 where 작성 예정

        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, user_id);
            System.out.println("03. query 준비 " + sql);

            rs = pstm.executeQuery();
            System.out.println("04. query 실행 및 리턴");

            if(rs.next()){
                res.setUser_id(rs.getString(1));
                res.setMonth(rs.getInt(2));
                res.setDay(rs.getInt(3));
                res.setMath(rs.getInt(4));
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
    public result_kor_dto select_month_kor_1(String user_id){
        Connection con = getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        result_kor_dto res = new result_kor_dto();

        String sql = "SELECT * FROM RESULT_KOR WHERE USER_ID= ? AND MONTH = EXTRACT(MONTH FROM SYSDATE)-1";    //user_id로 where 작성 예정

        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, user_id);
            System.out.println("03. query 준비 " + sql);

            rs = pstm.executeQuery();
            System.out.println("04. query 실행 및 리턴");

            if(rs.next()){
                res.setUser_id(rs.getString(1));
                res.setMonth(rs.getInt(2));
                res.setDay(rs.getInt(3));
                res.setKor(rs.getInt(4));
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
    public result_eng_dto select_month_eng_1(String user_id){
        Connection con = getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        result_eng_dto res = new result_eng_dto();

        String sql = "SELECT * FROM RESULT_ENG WHERE USER_ID= ? AND MONTH = EXTRACT(MONTH FROM SYSDATE)-1";    //user_id로 where 작성 예정

        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, user_id);
            System.out.println("03. query 준비 " + sql);

            rs = pstm.executeQuery();
            System.out.println("04. query 실행 및 리턴");

            if(rs.next()){
                res.setUser_id(rs.getString(1));
                res.setMonth(rs.getInt(2));
                res.setDay(rs.getInt(3));
                res.setEng(rs.getInt(4));
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
    public result_math_dto select_month_math_1(String user_id){
        Connection con = getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        result_math_dto res = new result_math_dto();

        String sql = "SELECT * FROM RESULT_MATH WHERE USER_ID= ? AND MONTH = EXTRACT(MONTH FROM SYSDATE)-1";    //user_id로 where 작성 예정

        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, user_id);
            System.out.println("03. query 준비 " + sql);

            rs = pstm.executeQuery();
            System.out.println("04. query 실행 및 리턴");

            if(rs.next()){
                res.setUser_id(rs.getString(1));
                res.setMonth(rs.getInt(2));
                res.setDay(rs.getInt(3));
                res.setMath(rs.getInt(4));
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
    public result_kor_dto select_month_kor_2(String user_id){
        Connection con = getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        result_kor_dto res = new result_kor_dto();

        String sql = "SELECT * FROM RESULT_KOR WHERE USER_ID= ? AND MONTH = EXTRACT(MONTH FROM SYSDATE)-2";    //user_id로 where 작성 예정

        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, user_id);
            System.out.println("03. query 준비 " + sql);

            rs = pstm.executeQuery();
            System.out.println("04. query 실행 및 리턴");

            if(rs.next()){
                res.setUser_id(rs.getString(1));
                res.setMonth(rs.getInt(2));
                res.setDay(rs.getInt(3));
                res.setKor(rs.getInt(4));
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
    public result_eng_dto select_month_eng_2(String user_id){
        Connection con = getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        result_eng_dto res = new result_eng_dto();

        String sql = "SELECT * FROM RESULT_ENG WHERE USER_ID= ? AND MONTH = EXTRACT(MONTH FROM SYSDATE)-2";    //user_id로 where 작성 예정

        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, user_id);
            System.out.println("03. query 준비 " + sql);

            rs = pstm.executeQuery();
            System.out.println("04. query 실행 및 리턴");

            if(rs.next()){
                res.setUser_id(rs.getString(1));
                res.setMonth(rs.getInt(2));
                res.setDay(rs.getInt(3));
                res.setEng(rs.getInt(4));
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
    public result_math_dto select_month_math_2(String user_id){
        Connection con = getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        result_math_dto res = new result_math_dto();

        String sql = "SELECT * FROM RESULT_MATH WHERE USER_ID= ? AND MONTH = EXTRACT(MONTH FROM SYSDATE)-2";    //user_id로 where 작성 예정

        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, user_id);
            System.out.println("03. query 준비 " + sql);

            rs = pstm.executeQuery();
            System.out.println("04. query 실행 및 리턴");

            if(rs.next()){
                res.setUser_id(rs.getString(1));
                res.setMonth(rs.getInt(2));
                res.setDay(rs.getInt(3));
                res.setMath(rs.getInt(4));
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
    //성적 넣기

    //국어 성적
    public int insert_kor(result_kor_dto kor_dto){
        Connection con = getConnection();
        PreparedStatement pstm = null;
        int res = 0;

        String sql = "INSERT INTO RESULT_KOR VALUES (?,?,?,?)";

        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, kor_dto.getUser_id());
            pstm.setInt(2, kor_dto.getMonth());
            pstm.setInt(3, kor_dto.getDay());
            pstm.setInt(4, kor_dto.getKor());
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
