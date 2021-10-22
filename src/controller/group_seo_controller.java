package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;

import result.result_dao.result_dao;
import result.result_dto.result_dto;

@WebServlet("/group_seo_controller.do")
public class group_seo_controller extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        result_dao dao = new result_dao();

        String command = request.getParameter("command");
        System.out.println("command: " + command);

        if(command.equals("group_border")){
            response.sendRedirect("group/group_border.jsp");
        }else if(command.equals("group_chat")){
            response.sendRedirect("group/group_chat.jsp");
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
