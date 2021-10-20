package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypageDao.NoticeDao;

/**
 * Servlet implementation class main_controller
 */
@WebServlet("/main_controller.do")
public class main_controller extends HttpServlet {
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
		
		//메인페이지에 존재하는 메뉴들 클릭해서 각 컨트롤러로 넘김 (각 컨트롤러에서 세부 페이지 이동)
		
		
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
