package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypageDao.NoticeDao;
import mypageDto.NoticeDto;

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
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
