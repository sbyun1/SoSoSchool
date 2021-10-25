package controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypageDao.NoticeDao;
import mypageDto.NoticeDto;
import result.result_dao.result_dao;
import result.result_dto.result_dto;

/**
 * Servlet implementation class Notice
 */
@WebServlet("/mypage_controller.do")
public class mypage_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("[command: " + command + "]");
		
		NoticeDao dao = new NoticeDao();
		result_dao resultdao = new result_dao();
		
		if(command.equals("main")) {
			response.sendRedirect("main.jsp");
		}
		/*마이페이지 공지사항 페이지*/
		else if(command.equals("mypage_notice")) {
			List<NoticeDto> noti_list = dao.selectAll(); //전체 리스트를 가져와서 selectAll실행
			
			request.setAttribute("list", noti_list);
			RequestDispatcher disp = request.getRequestDispatcher("mypage/mypage_notice.jsp");
			disp.forward(request, response);
		}
		else if(command.equals("notice_detail")){
			int noti_no = Integer.parseInt(request.getParameter("noti_no"));
			NoticeDto dto = dao.selectOne(noti_no);
			
			request.setAttribute("dto", dto);
			RequestDispatcher dp = request.getRequestDispatcher("mypage/mypage_notice_detail.jsp");

			dp.forward(request, response);
		}
		/*마이페이지 회원정보 수정 페이지*/
		else if(command.equals("mypage_userinfo")) {
			response.sendRedirect("mypage/mypage_userInfo.jsp");
		}
		
		
		/*마이페이지 고객문의*/
		else if(command.equals("mypage_qna")) {
			
		}
		/*상품교환 페이지 이동*/
		else if(command.equals("mypage_changestar")){
			response.sendRedirect("mypage/mypage_changestar.jsp");
		}
		/*성적 확인 페이지 이동*/
		else if(command.equals("mypage_checkscore")){
			result_dto month_1 = resultdao.select_month();
			result_dto month_2 = resultdao.select_month_1();
			result_dto month_3 = resultdao.select_month_2();

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
		}
	}

	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
