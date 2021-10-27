package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;

import com.soso.login.Dao.UserDao;
import com.soso.login.Dto.UserDto;
import group.groupDao;
import group.groupDto;
import result.result_dao.result_dao;
import result.result_dto.result_dto;

@WebServlet("/group_controller.do")
public class group_controller extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        groupDao groupdao = new groupDao();
//        groupDto groupdto = new groupDto();
        UserDao userdao = new UserDao();
//        UserDto userdto = new UserDto();

        String command = request.getParameter("command");
        System.out.println("command: " + command);

        if(command.equals("group_border")){
            response.sendRedirect("group/group_border_seoul_A.jsp");
        }else if(command.equals("group_chat")){
            response.sendRedirect("group/group_chat_seoul.jsp");
        }else if(command.equals("group_map")){
            int user_no = Integer.parseInt(request.getParameter("user_no"));
            UserDto dto = userdao.selectuser(user_no);

            if(dto.getRegion().equals("SEOUL")){
                response.sendRedirect("group/map_seoul.jsp");
            }else{
                String s = "<script type='text/javascript'>"+"alert('세상에나..');"+"</script>";
                PrintWriter out = response.getWriter();
                out.print(s);
            }
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
