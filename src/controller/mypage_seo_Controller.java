package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;

import result.result_dao.result_dao;
import result.result_dto.result_dto;

@WebServlet("/mypage_seo_Controller.do")
public class mypage_seo_Controller extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        result_dao dao = new result_dao();

        String command = request.getParameter("command");
        System.out.println("command: " + command);

        if(command.equals("mypage_changestar")){
            response.sendRedirect("mypage/mypage_changestar.jsp");
        }else if(command.equals("mypage_checkscore")) {
            result_dto month_1 = dao.select_month();
            result_dto month_2 = dao.select_month_1();
            result_dto month_3 = dao.select_month_2();

            LocalDate now = LocalDate.now();

            int month = now.getMonthValue();

            if(month_1.getMonth() ==  month){
                request.setAttribute("month_1", month_1);
            }
            if(month_2.getMonth() == (month-1)){
                request.setAttribute("month_2", month_2);
            }
            if(month_3.getMonth() == (month-2)){
                request.setAttribute("month_3", month_3);
            }

            dispatch("mypage/mypage_checkscore.jsp", request, response);
        }else if(command.equals("group_border")){
            response.sendRedirect("group/group_border.jsp");
        }else if(command.equals("group_chat")){
            response.sendRedirect("group/group_chat.jsp");
        }else if(command.equals("main_page")){
            response.sendRedirect("/mainpage.jsp");
        }else if(command.equals("mypage_notice")) {
            response.sendRedirect("mypage/test2.jsp");
        }else if(command.equals("mypage_myinfo")){
        	response.sendRedirect("mypage/test.jsp");
        }
    }
    
    private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatch = request.getRequestDispatcher(url);
        dispatch.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
