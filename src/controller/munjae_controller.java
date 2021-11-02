package controller;

import com.soso.login.Dao.UserDao;
import com.soso.login.Dto.UserDto;
import mypageDao.NoticeDao;
import mypageDto.NoticeDto;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/munjae_controller.do")
public class munjae_controller extends HttpServlet {
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


		if(command.equals("kor_first")){
			int user_no = Integer.parseInt(request.getParameter("user_no"));

			userdto = userdao.selectuser(user_no);

			if(userdto.getGrade() == 1){
				dispatch("munjae/kor_1_dictation.jsp", request, response);
			}else if (userdto.getGrade() == 2){
				dispatch("munjae/kor_2_dictation.jsp", request, response);
			}else if (userdto.getGrade() == 3){
				dispatch("munjae/kor_3_dictation.jsp", request, response);
			}
		}else if(command.equals("kor_second")){
			int user_no = Integer.parseInt(request.getParameter("user_no"));
			int correct = Integer.parseInt(request.getParameter("correct"));

			userdto = userdao.selectuser(user_no);

			if(userdto.getGrade() == 1){
				request.setAttribute("correct", correct);
				dispatch("munjae/kor_1_spelling.jsp", request, response);
			}else if (userdto.getGrade() == 2){
				request.setAttribute("correct", correct);
				dispatch("munjae/kor_2_spelling.jsp", request, response);
			}else if (userdto.getGrade() == 3){
				request.setAttribute("correct", correct);
				dispatch("munjae/kor_3_spelling.jsp", request, response);
			}
		}else if(command.equals("kor_third")){
			int user_no = Integer.parseInt(request.getParameter("user_no"));
			int correct = Integer.parseInt(request.getParameter("correct"));

			userdto = userdao.selectuser(user_no);

			if(userdto.getGrade() == 1){
				request.setAttribute("correct", correct);
				dispatch("munjae/kor_1_spacing.jsp", request, response);
			}else if (userdto.getGrade() == 2){
				request.setAttribute("correct", correct);
				dispatch("munjae/kor_2_spacing.jsp", request, response);
			}else if (userdto.getGrade() == 3){
				request.setAttribute("correct", correct);
				dispatch("munjae/kor_3_spacing.jsp", request, response);
			}
		}
	}

	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>"+"alert('"+msg+"');"+"location.href='"+url+"';"+"</script>";
		PrintWriter out = response.getWriter();
		out.print(s);
	}

	private void jsRe(String msg, HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>"+"alert('"+msg+"');"+"</script>";
		PrintWriter out = response.getWriter();
		out.print(s);
	}

	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
