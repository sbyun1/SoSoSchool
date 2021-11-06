package controller;

import com.soso.login.Dao.UserDao;
import com.soso.login.Dto.UserDto;
import group.groupDao;
import group.groupDto;
import mypageDao.changeStarDao;
import mypageDto.changeStarDto;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/admin_controller.do")
public class admin_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//인코딩 관련 코드
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		//command 가져오고 콘솔창에 출력
		String command = request.getParameter("command");
		System.out.println("command: " + command);

		//세션 가져오는 코드
		HttpSession session = request.getSession();
		UserDto userdto = (UserDto) session.getAttribute("userdto");
		UserDao userdao = new UserDao();

		//Dao 불러오는 코드
		groupDao groupdao = new groupDao();					//소그룹 dao
		changeStarDao changestardao = new changeStarDao();	//상품교환 dao

		//소그룹
		if(command.equals("group")){
			List<groupDto> list_all = groupdao.admin_selectAll();				//전체 지역 리스트 불러오기
			List<groupDto> list_seoul = groupdao.admin_selectAll_seoul();		//서울 지역 리스트 불러오기
			List<groupDto> list_gyeonggi = groupdao.admin_selectAll_gyeonggi();	//경기 지역 리스트 불러오기
			List<groupDto> list_incheon = groupdao.admin_selectAll_incheon();	//인천 지역 리스트 불러오기

			request.setAttribute("list_all", list_all);							//리스트 속성 지정
			request.setAttribute("list_seoul", list_seoul);						//리스트 속성 지정
			request.setAttribute("list_gyeonggi", list_gyeonggi);				//리스트 속성 지정
			request.setAttribute("list_incheon", list_incheon);					//리스트 속성 지정

			dispatch("admin/admin_group_board_list.jsp", request, response);	//페이지 넘어가기
		}
		//상품 교환
		else if(command.equals("changestar")){
			List<changeStarDto> list = changestardao.selectall();

			request.setAttribute("list", list);

			dispatch("admin/admin_changeStar_board_list.jsp", request, response);
		}

	}

	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
