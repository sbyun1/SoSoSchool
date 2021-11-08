package group;

import common.JDBCTemplate;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class groupDao extends JDBCTemplate {
    //각 지역별 & 도서관별 게시글 전체 조회
    public List<groupDto> selectAll(String gboard_region, String gboard_library){
        Connection con = getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        List<groupDto> list = new ArrayList<groupDto>();

        String sql = "SELECT * FROM SMALL_GROUP WHERE GBOARD_REGION = ? AND GBOARD_LIBRARY = ?";

        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, gboard_region);
            pstm.setString(2, gboard_library);
            System.out.println("03. query 준비 " + sql);

            rs = pstm.executeQuery();
            System.out.println("04. query 실행 및 리턴");

            while (rs.next()){
                groupDto dto = new groupDto();

                dto.setGboard_no(rs.getInt(1));
                dto.setGboard_title(rs.getString(2));
                dto.setGboard_subtitle(rs.getString(3));
                dto.setGboard_content(rs.getString(4));
                dto.setGboard_img(rs.getString(5));
                dto.setRegdate(rs.getDate(6));
                dto.setGboard_region(rs.getString(7));
                dto.setGboard_library(rs.getString(8));

                list.add(dto);
            }
        } catch (SQLException e) {
            System.out.println("3/4 단계 오류");
            e.printStackTrace();
        }finally {
            close(con);
            close(rs);
            close(pstm);
            System.out.println("05. db 종료");
        }
        return list;
    }

    //게시글 한 개 보기
    public groupDto selectOne(int gboard_no, String gboard_region, String gboard_library){
        Connection con = getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        groupDto dto = new groupDto();

        String sql = "SELECT * FROM SMALL_GROUP WHERE GBOARD_NO = ? AND GBOARD_REGION = ? AND GBOARD_LIBRARY = ?";

        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, gboard_no);
            pstm.setString(2, gboard_region);
            pstm.setString(3, gboard_library);
            System.out.println("03. query 준비 " + sql);

            rs = pstm.executeQuery();
            System.out.println("04. query 실행 및 리턴");

            if(rs.next()){
                dto.setGboard_no(rs.getInt(1));
                dto.setGboard_title(rs.getString(2));
                dto.setGboard_subtitle(rs.getString(3));
                dto.setGboard_content(rs.getString(4));
                dto.setGboard_img(rs.getString(5));
                dto.setRegdate(rs.getDate(6));
                dto.setGboard_region(rs.getString(7));
                dto.setGboard_library(rs.getString(8));
            }
        } catch (SQLException e) {
            System.out.println("3/4 단계 오류");
            e.printStackTrace();
        }finally {
            close(con);
            close(rs);
            close(pstm);
            System.out.println("05. db 종료");
        }
        return dto;
    }

    //관리자 페이지용

    //전체 지역 조회
    public List<groupDto> admin_selectAll(){
        Connection con = getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        List<groupDto> list = new ArrayList<groupDto>();

        String sql = "SELECT * FROM SMALL_GROUP ORDER BY GBOARD_REGION";

        try {
            pstm = con.prepareStatement(sql);
            System.out.println("03. query 준비 " + sql);

            rs = pstm.executeQuery();
            System.out.println("04. query 실행 및 리턴");

            while (rs.next()){
                groupDto dto = new groupDto();

                dto.setGboard_no(rs.getInt(1));
                dto.setGboard_title(rs.getString(2));
                dto.setGboard_subtitle(rs.getString(3));
                dto.setGboard_content(rs.getString(4));
                dto.setGboard_img(rs.getString(5));
                dto.setRegdate(rs.getDate(6));
                dto.setGboard_region(rs.getString(7));
                dto.setGboard_library(rs.getString(8));

                list.add(dto);
            }
        } catch (SQLException e) {
            System.out.println("3/4 단계 오류");
            e.printStackTrace();
        }finally {
            close(con);
            close(rs);
            close(pstm);
            System.out.println("05. db 종료");
        }
        return list;
    }

    //서울 지역 조회
    public List<groupDto> admin_selectAll_seoul(){
        Connection con = getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        List<groupDto> list = new ArrayList<groupDto>();

        String sql = "SELECT * FROM SMALL_GROUP WHERE GBOARD_REGION = 'SEOUL'";

        try {
            pstm = con.prepareStatement(sql);
            System.out.println("03. query 준비 " + sql);

            rs = pstm.executeQuery();
            System.out.println("04. query 실행 및 리턴");

            while (rs.next()){
                groupDto dto = new groupDto();

                dto.setGboard_no(rs.getInt(1));
                dto.setGboard_title(rs.getString(2));
                dto.setGboard_subtitle(rs.getString(3));
                dto.setGboard_content(rs.getString(4));
                dto.setGboard_img(rs.getString(5));
                dto.setRegdate(rs.getDate(6));
                dto.setGboard_region(rs.getString(7));
                dto.setGboard_library(rs.getString(8));

                list.add(dto);
            }
        } catch (SQLException e) {
            System.out.println("3/4 단계 오류");
            e.printStackTrace();
        }finally {
            close(con);
            close(rs);
            close(pstm);
            System.out.println("05. db 종료");
        }
        return list;
    }

    //경기 지역 조회
    public List<groupDto> admin_selectAll_gyeonggi(){
        Connection con = getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        List<groupDto> list = new ArrayList<groupDto>();

        String sql = "SELECT * FROM SMALL_GROUP WHERE GBOARD_REGION = 'GYEONGGI'";

        try {
            pstm = con.prepareStatement(sql);
            System.out.println("03. query 준비 " + sql);

            rs = pstm.executeQuery();
            System.out.println("04. query 실행 및 리턴");

            while (rs.next()){
                groupDto dto = new groupDto();

                dto.setGboard_no(rs.getInt(1));
                dto.setGboard_title(rs.getString(2));
                dto.setGboard_subtitle(rs.getString(3));
                dto.setGboard_content(rs.getString(4));
                dto.setGboard_img(rs.getString(5));
                dto.setRegdate(rs.getDate(6));
                dto.setGboard_region(rs.getString(7));
                dto.setGboard_library(rs.getString(8));

                list.add(dto);
            }
        } catch (SQLException e) {
            System.out.println("3/4 단계 오류");
            e.printStackTrace();
        }finally {
            close(con);
            close(rs);
            close(pstm);
            System.out.println("05. db 종료");
        }
        return list;
    }

    //인천 지역 조회
    public List<groupDto> admin_selectAll_incheon(){
        Connection con = getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        List<groupDto> list = new ArrayList<groupDto>();

        String sql = "SELECT * FROM SMALL_GROUP WHERE GBOARD_REGION = 'INCHEON'";

        try {
            pstm = con.prepareStatement(sql);
            System.out.println("03. query 준비 " + sql);

            rs = pstm.executeQuery();
            System.out.println("04. query 실행 및 리턴");

            while (rs.next()){
                groupDto dto = new groupDto();

                dto.setGboard_no(rs.getInt(1));
                dto.setGboard_title(rs.getString(2));
                dto.setGboard_subtitle(rs.getString(3));
                dto.setGboard_content(rs.getString(4));
                dto.setGboard_img(rs.getString(5));
                dto.setRegdate(rs.getDate(6));
                dto.setGboard_region(rs.getString(7));
                dto.setGboard_library(rs.getString(8));

                list.add(dto);
            }
        } catch (SQLException e) {
            System.out.println("3/4 단계 오류");
            e.printStackTrace();
        }finally {
            close(con);
            close(rs);
            close(pstm);
            System.out.println("05. db 종료");
        }
        return list;
    }

    //게시글 한 개 보기
    public groupDto admin_selectOne(int gboard_no){
        Connection con = getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        groupDto dto = new groupDto();

        String sql = "SELECT * FROM SMALL_GROUP WHERE GBOARD_NO = ?";

        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, gboard_no);
            System.out.println("03. query 준비 " + sql);

            rs = pstm.executeQuery();
            System.out.println("04. query 실행 및 리턴");

            if(rs.next()){
                dto.setGboard_no(rs.getInt(1));
                dto.setGboard_title(rs.getString(2));
                dto.setGboard_subtitle(rs.getString(3));
                dto.setGboard_content(rs.getString(4));
                dto.setGboard_img(rs.getString(5));
                dto.setRegdate(rs.getDate(6));
                dto.setGboard_region(rs.getString(7));
                dto.setGboard_library(rs.getString(8));
            }
        } catch (SQLException e) {
            System.out.println("3/4 단계 오류");
            e.printStackTrace();
        }finally {
            close(con);
            close(rs);
            close(pstm);
            System.out.println("05. db 종료");
        }
        return dto;
    }

    //게시글 입력
    public int insert(groupDto dto){
        Connection con = getConnection();
        PreparedStatement pstm = null;
        int res = 0;

        String sql = "INSERT INTO SMALL_GROUP VALUES (SMALL_GROUP_SQ.nextval, ?,?,?,?,SYSDATE,?,?)";

        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, dto.getGboard_title());
            pstm.setString(2, dto.getGboard_subtitle());
            pstm.setString(3, dto.getGboard_content());
            pstm.setString(4, dto.getGboard_img());
            pstm.setString(5, dto.getGboard_region());
            pstm.setString(6, dto.getGboard_library());
            System.out.println("03. query 준비 " + sql);

            res = pstm.executeUpdate();
            System.out.println("04. query 실행 및 리턴");

            if(res > 0){
                commit(con);
            }else{
                rollback(con);
            }
        } catch (SQLException e) {
            System.out.println("3/4단계 오류");
            e.printStackTrace();
        }finally {
            close(con);
            close(pstm);
            System.out.println("05. db 종료");
        }
        return res;
    }

    //게시글 수정
    public int update(groupDto dto){
        Connection con = getConnection();
        PreparedStatement pstm = null;
        int res = 0;

        String sql = "UPDATE SMALL_GROUP SET GBOARD_TITLE = ?, GBOARD_SUBTITLE = ?, GBOARD_CONTENT = ?, GBOARD_IMG = ? WHERE GBOARD_NO = ?";

        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, dto.getGboard_title());
            pstm.setString(2, dto.getGboard_subtitle());
            pstm.setString(3, dto.getGboard_content());
            pstm.setString(4, dto.getGboard_img());
            pstm.setInt(5, dto.getGboard_no());
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
            System.out.println("05. db 종료");
        }
        return res;
    }

    //게시글 삭제
    public int delete(int gboard_no){
        Connection con = getConnection();
        PreparedStatement pstm = null;
        int res = 0;

        String sql = "DELETE FROM SMALL_GROUP WHERE GBOARD_NO = ?";

        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, gboard_no);
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
            System.out.println("05. db 종료");
        }
        return res;
    }
}
