package mypageDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCTemplate;
import mypageDto.changeStarDto;

public class changeStarDao extends JDBCTemplate {
    //상품 리스트 전체 조회
    public List<changeStarDto> selectall(){
        Connection con = getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        List<changeStarDto> list = new ArrayList<changeStarDto>();

        String sql = "SELECT * FROM GIFT_BOARD";

        try {
            pstm = con.prepareStatement(sql);
            System.out.println("03. query 준비 " + sql);

            rs = pstm.executeQuery();
            System.out.println("04. query 실행 및 리턴");

            while(rs.next()){
                changeStarDto dto = new changeStarDto();

                dto.setGi_no(rs.getInt(1));
                dto.setGi_title(rs.getString(2));
                dto.setGi_prize(rs.getInt(3));
                dto.setGi_stock(rs.getInt(4));
                dto.setGi_img(rs.getString(5));

                list.add(dto);
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
        return list;
    }
    //상품 하나 조회
    public changeStarDto selectone(int gi_no){
        Connection con = getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        changeStarDto dto = new changeStarDto();

        String sql = "SELECT * FROM GIFT_BOARD WHERE GI_NO = ?";

        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, gi_no);
            System.out.println("03. query 준비 " + sql);

            rs = pstm.executeQuery();
            System.out.println("04. query 실행 및 리턴");

            if(rs.next()){
                dto.setGi_no(rs.getInt(1));
                dto.setGi_title(rs.getString(2));
                dto.setGi_prize(rs.getInt(3));
                dto.setGi_stock(rs.getInt(4));
                dto.setGi_img(rs.getString(5));
            }
        } catch (SQLException e) {
            System.out.println("3/4 단계 오류");
            e.printStackTrace();
        }finally {
            close(con);
            close(rs);
            close(pstm);
            System.out.println("05.db 종료 \n");
        }
        return dto;
    }

    //상품 교환
    public int buygift(int gi_no){
        Connection con = getConnection();
        PreparedStatement pstm = null;
        int res = 0;

        String sql = "UPDATE GIFT_BOARD SET GI_STOCK = GI_STOCK - 1 WHERE GI_NO = ?";

        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, gi_no);
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
            System.out.println("05. db 종료 \n");
        }
        return res;
    }

    ///////////////////////////////////////
    //관리자 페이지
    //상품 추가
    public int insertgift(changeStarDto dto){
        Connection con = getConnection();
        PreparedStatement pstm = null;
        int res = 0;

        String sql = "INSERT INTO GIFT_BOARD VALUES (GIFT_TABLE_SQ.nextval, ?,?,?,?)";

        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, dto.getGi_title());
            pstm.setInt(2, dto.getGi_prize());
            pstm.setInt(3, dto.getGi_stock());
            pstm.setString(4, dto.getGi_img());
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
            System.out.println("05. db 종료 \n");
        }
        return res;
    }
    //상품 수량 추가
    public int updatestock(int gi_no, int gi_stock){
        Connection con = getConnection();
        PreparedStatement pstm = null;
        int res = 0;

        String sql = "UPDATE GIFT_BOARD SET GI_STOCK = ? WHERE GI_NO = ?";

        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, gi_stock);
            pstm.setInt(2, gi_no);
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
            System.out.println("05. db 종료 \n");
        }
        return res;
    }
    //상품 삭제
    public int deletegift(int gi_no){
        Connection con = getConnection();
        PreparedStatement pstm = null;
        int res = 0;

        String sql = "DELETE FROM GIFT_BOARD WHERE GI_NO = ?";

        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, gi_no);
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
