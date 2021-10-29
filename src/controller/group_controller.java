package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.List;

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
        UserDao userdao = new UserDao();

        String command = request.getParameter("command");
        System.out.println("command: " + command);

        HttpSession session = request.getSession();

        UserDto userDto = (UserDto) session.getAttribute("userdto");

        if(command.equals("group_border")){
            String gboard_region = request.getParameter("gboard_region");
            String gboard_library = request.getParameter("gboard_library");

            List<groupDto> list = groupdao.selectAll(gboard_region, gboard_library);

            System.out.println(gboard_region);
            System.out.println(gboard_library);

            request.setAttribute("list",list);

            if(gboard_region.equals("SEOUL")){
                if(gboard_library.equals("A도서관")){
                    dispatch("group/group_border_seoul_A.jsp", request, response);
//                    response.sendRedirect("group/group_border_seoul_A.jsp");
                }else if(gboard_library.equals("B도서관")){
                    dispatch("group/group_border_seoul_B.jsp", request, response);
//                    response.sendRedirect("group/group_border_seoul_B.jsp");
                }else if(gboard_library.equals("C도서관")){
                    dispatch("group/group_border_seoul_C.jsp", request, response);
//                    response.sendRedirect("group/group_border_seoul_C.jsp");
                }
            }else if(gboard_region.equals("GYEONGGI")){
                if(gboard_library.equals("A도서관")){
                    dispatch("group/group_border_gyeonggi_A.jsp", request, response);
                }else if(gboard_library.equals("B도서관")){
                    dispatch("group/group_border_gyeonggi_B.jsp", request, response);
                }else if(gboard_library.equals("C도서관")){
                    dispatch("group/group_border_gyeonggi_C.jsp", request, response);
                }
            }else if(gboard_region.equals("INCHEON")){
                if(gboard_library.equals("A도서관")){
                    dispatch("group/group_border_incheon_A.jsp", request, response);
//                    response.sendRedirect("group/group_border_incheon_A.jsp");
                }else if(gboard_library.equals("B도서관")){
                    dispatch("group/group_border_incheon_B.jsp", request, response);
//                    response.sendRedirect("group/group_border_incheon_B.jsp");
                }else if(gboard_library.equals("C도서관")){
                    dispatch("group/group_border_incheon_C.jsp", request, response);
//                    response.sendRedirect("group/group_border_incheon_C.jsp");
                }
            }
        }else if(command.equals("board_detail")){
            int gboard_no = Integer.parseInt(request.getParameter("gboard_no"));
            String gboard_region = request.getParameter("gboard_region");
            String gboard_library = request.getParameter("gboard_library");

            groupDto dto = groupdao.selectOne(gboard_no, gboard_region, gboard_library);

            request.setAttribute("dto", dto);
            dispatch("group/gboard_detail.jsp",request,response);
        }else if(command.equals("group_chat")){
            int user_no = Integer.parseInt(request.getParameter("user_no"));
            UserDto userdto = userdao.selectuser(user_no);

            if(userdto.getRegion().equals("SEOUL")){
                response.sendRedirect("group/group_chat_seoul.jsp");
            }else if(userdto.getRegion().equals("GYEONGGI")){
                response.sendRedirect("group/group_chat_gyeonggi.jsp");
            }else if(userdto.getRegion().equals("INCHEON")){
                response.sendRedirect("group/group_chat_incheon.jsp");
            }
        }else if(command.equals("group_map")){
            int user_no = Integer.parseInt(request.getParameter("user_no"));
            UserDto userdto = userdao.selectuser(user_no);

            if(userdto.getRegion().equals("SEOUL")){
                response.sendRedirect("group/map_seoul.jsp");
            }else if(userdto.getRegion().equals("GYEONGGI")){
                response.sendRedirect("group/map_gyeonggi.jsp");
            }else if(userdto.getRegion().equals("INCHEON")){
                response.sendRedirect("group/map_incheon.jsp");
            }
        }else if(command.equals("group_main")){
            //순위 표시
            int user_no = Integer.parseInt(request.getParameter("user_no"));
            String region = request.getParameter("region");

            UserDto userdto = userdao.selectuser(user_no);

            UserDto ps = userdao.region_point(user_no, region);

            request.setAttribute("name", userdto.getUser_name());
            request.setAttribute("point", userdto.getUser_point());
            request.setAttribute("no", ps.getUser_no());
            request.setAttribute("region", userdto.getRegion());

            List<UserDto> list = userdao.region_pointAll(region);
            request.setAttribute("rank_list", list);

            dispatch("group/group_main.jsp", request, response);
        }
    }

    private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
        String s = "<script type='text/javascript'>"+"alert('"+msg+"');"+"location.href='"+url+"';"+"</script>";
        PrintWriter out = response.getWriter();
        out.print(s);
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
