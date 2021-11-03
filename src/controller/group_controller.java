package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.soso.login.Dao.UserDao;
import com.soso.login.Dto.UserDto;
import group.groupDao;
import group.groupDto;

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
        //관리자 기능

        //게시글 내용 보기
        else if(command.equals("group_board_detail")){
            int gboard_no = Integer.parseInt(request.getParameter("gboard_no"));

            groupDto gdto = groupdao.admin_selectOne(gboard_no);

            request.setAttribute("gdto", gdto);

            dispatch("admin/admin_group_board_detail.jsp",request,response);
        }
        else if(command.equals("group_board_detail_update")){
            int gboard_no = Integer.parseInt(request.getParameter("gboard_no"));
            String title = request.getParameter("title");
            String subtitle = request.getParameter("subtitle");
            String content = request.getParameter("content");
            String img = request.getParameter("img");

            groupDto selgdto = new groupDto();
            selgdto.setGboard_no(gboard_no);
            selgdto.setGboard_title(title);
            selgdto.setGboard_subtitle(subtitle);
            selgdto.setGboard_content(content);
            selgdto.setGboard_img(img);

            int res = groupdao.update(selgdto);

            List<groupDto> list_all = groupdao.admin_selectAll();				//전체 지역 리스트 불러오기
            List<groupDto> list_seoul = groupdao.admin_selectAll_seoul();		//서울 지역 리스트 불러오기
            List<groupDto> list_gyeonggi = groupdao.admin_selectAll_gyeonggi();	//경기 지역 리스트 불러오기
            List<groupDto> list_incheon = groupdao.admin_selectAll_incheon();	//인천 지역 리스트 불러오기

            request.setAttribute("list_all", list_all);							//리스트 속성 지정
            request.setAttribute("list_seoul", list_seoul);						//리스트 속성 지정
            request.setAttribute("list_gyeonggi", list_gyeonggi);				//리스트 속성 지정
            request.setAttribute("list_incheon", list_incheon);					//리스트 속성 지정

            if(res > 0){
                String s = "<script type='text/javascript'>"+"alert('수정 성공');"+"</script>";
                PrintWriter out = response.getWriter();
                out.print(s);
                dispatch("admin/admin_group_board_list.jsp", request,response);
            }else{
                String s = "<script type='text/javascript'>"+"alert('수정 실패');"+"</script>";
                PrintWriter out = response.getWriter();
                out.print(s);
                dispatch("admin/admin_group_board_list.jsp", request,response);
            }
        }
        //게시글 삭제
        else if(command.equals("group_board_delete")){
            int gboard_no = Integer.parseInt(request.getParameter("gboard_no"));

            int res = groupdao.delete(gboard_no);

            List<groupDto> list_all = groupdao.admin_selectAll();				//전체 지역 리스트 불러오기
            List<groupDto> list_seoul = groupdao.admin_selectAll_seoul();		//서울 지역 리스트 불러오기
            List<groupDto> list_gyeonggi = groupdao.admin_selectAll_gyeonggi();	//경기 지역 리스트 불러오기
            List<groupDto> list_incheon = groupdao.admin_selectAll_incheon();	//인천 지역 리스트 불러오기

            request.setAttribute("list_all", list_all);							//리스트 속성 지정
            request.setAttribute("list_seoul", list_seoul);						//리스트 속성 지정
            request.setAttribute("list_gyeonggi", list_gyeonggi);				//리스트 속성 지정
            request.setAttribute("list_incheon", list_incheon);					//리스트 속성 지정

            if(res>0){
                dispatch("admin/admin_group_board_list.jsp", request,response);
            }else{
                dispatch("admin/admin_group_board_list.jsp", request,response);
            }
        }
        //게시글 추가 페이지 이동
        else if(command.equals("group_board_insert_form")){
            response.sendRedirect("admin/admin_group_board_insert.jsp");
        }
        //게시글 추가
        else if(command.equals("group_board_detail_insert")){
            String title = request.getParameter("title");
            String subtitle = request.getParameter("subtitle");
            String content = request.getParameter("content");
            String img = request.getParameter("img");
            String region = request.getParameter("region");
            String library = request.getParameter("library");

            groupDto insergdto = new groupDto();
            insergdto.setGboard_title(title);
            insergdto.setGboard_subtitle(subtitle);
            insergdto.setGboard_content(content);
            insergdto.setGboard_img(img);
            insergdto.setGboard_region(region);
            insergdto.setGboard_library(library);

            int res = groupdao.insert(insergdto);

            List<groupDto> list_all = groupdao.admin_selectAll();				//전체 지역 리스트 불러오기
            List<groupDto> list_seoul = groupdao.admin_selectAll_seoul();		//서울 지역 리스트 불러오기
            List<groupDto> list_gyeonggi = groupdao.admin_selectAll_gyeonggi();	//경기 지역 리스트 불러오기
            List<groupDto> list_incheon = groupdao.admin_selectAll_incheon();	//인천 지역 리스트 불러오기

            request.setAttribute("list_all", list_all);							//리스트 속성 지정
            request.setAttribute("list_seoul", list_seoul);						//리스트 속성 지정
            request.setAttribute("list_gyeonggi", list_gyeonggi);				//리스트 속성 지정
            request.setAttribute("list_incheon", list_incheon);					//리스트 속성 지정

            if(res > 0){
                dispatch("admin/admin_group_board_list.jsp", request,response);
            }else{
                dispatch("admin/admin_group_board_list.jsp", request,response);
            }
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
