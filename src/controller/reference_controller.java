package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.soso.ref.dao.referenceDao;
import com.soso.ref.dto.referenceDto;
@WebServlet("/reference_controller.do")
public class reference_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String command = request.getParameter("command");
		System.out.println("["+command+"]");
		
		referenceDao dao = new referenceDao();
		
		/***자료실 더보기***/
		if(command.equals("grade1")){
			//국어자료
			List<referenceDto> kor_list = dao.select(1,"KOR");
			request.setAttribute("kor_list", kor_list);
			//수학자료
			List<referenceDto> math_list = dao.select(1,"MATH");
			request.setAttribute("math_list", math_list);			
			//영어자료
			List<referenceDto> eng_list = dao.select(1,"ENG");
			request.setAttribute("eng_list", eng_list);
			
			dispatch("reference/reference_board1.jsp", request, response);

		}else if(command.equals("ref_grade1_kor")) {
			List<referenceDto> kor_list = dao.select(1,"KOR");
			request.setAttribute("kor_list", kor_list);
			
			dispatch("reference/reference_boardlist_1_kor.jsp", request, response);
		}else if(command.equals("grade2")) {
			List<referenceDto> kor_list = dao.select(2,"KOR");
			request.setAttribute("kor_list", kor_list);

			List<referenceDto> math_list = dao.select(2,"MATH");
			request.setAttribute("math_list", math_list);			

			List<referenceDto> eng_list = dao.select(2,"ENG");
			request.setAttribute("eng_list", eng_list);
			
			dispatch("reference/reference_board2.jsp", request, response);
			
		}else if(command.equals("grade3")) {
			List<referenceDto> kor_list = dao.select(3,"KOR");
			request.setAttribute("kor_list", kor_list);

			List<referenceDto> math_list = dao.select(3,"MATH");
			request.setAttribute("math_list", math_list);			

			List<referenceDto> eng_list = dao.select(3,"ENG");
			request.setAttribute("eng_list", eng_list);
			
			dispatch("reference/reference_board3.jsp", request, response);
			
		}else if(command.equals("ref_grade1_math")) {
			List<referenceDto> math_list = dao.select(1,"MATH");
			request.setAttribute("math_list", math_list);
			
			dispatch("reference/reference_boardlist_1_math.jsp", request, response);
		}else if(command.equals("ref_grade1_eng")) {
			List<referenceDto> eng_list = dao.select(1,"ENG");
			request.setAttribute("eng_list", eng_list);
			
			dispatch("reference/reference_boardlist_1_eng.jsp", request, response);

		
		/***자료실 게시글CRUD***/
		/*게시글작성*/
		}else if(command.equals("ref_insertform")) {
			dispatch("reference/boardinsert.jsp", request, response);
		}else if(command.equals("boarddetail")) {
			int rboard_no=Integer.parseInt(request.getParameter("rboard_no"));
			referenceDto referenceDto = dao.selectOne(rboard_no);
			
			request.setAttribute("referencedto", referenceDto);
			dispatch("reference/boarddetail.jsp", request, response);
		}
		
	}

	private void dispatch(String url, HttpServletRequest request, HttpServletResponse reponse) throws ServletException, IOException {  
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, reponse);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
