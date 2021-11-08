package controller;

import java.io.IOException;
import java.io.PrintWriter;
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
			List<referenceDto> eng_list = dao.select(1, "ENG");
			request.setAttribute("eng_list", eng_list);

			dispatch("reference/reference_boardlist_1_eng.jsp", request, response);
		}else if(command.equals("ref_grade2_kor")){
			List<referenceDto> kor_list = dao.select(2, "KOR");
			request.setAttribute("kor_list", kor_list);

			dispatch("reference/reference_boardlist_2_kor.jsp", request, response);
		}
		else if(command.equals("ref_grade2_eng")){
			List<referenceDto> eng_list = dao.select(2, "ENG");
			request.setAttribute("eng_list", eng_list);

			dispatch("reference/reference_boardlist_2_eng.jsp", request, response);
		}
		else if(command.equals("ref_grade2_math")){
			List<referenceDto> math_list = dao.select(2, "MATH");
			request.setAttribute("math_list", math_list);

			dispatch("reference/reference_boardlist_2_math.jsp", request, response);
		}
		else if(command.equals("ref_grade3_kor")){
			List<referenceDto> kor_list = dao.select(3, "KOR");
			request.setAttribute("kor_list", kor_list);

			dispatch("reference/reference_boardlist_3_kor.jsp", request, response);
		}
		else if(command.equals("ref_grade3_eng")){
			List<referenceDto> eng_list = dao.select(3, "ENG");
			request.setAttribute("eng_list", eng_list);

			dispatch("reference/reference_boardlist_3_eng.jsp", request, response);
		}
		else if(command.equals("ref_grade3_math")){
			List<referenceDto> math_list = dao.select(3, "MATH");
			request.setAttribute("math_list", math_list);

			dispatch("reference/reference_boardlist_3_math.jsp", request, response);
		}
		else if(command.equals("boarddetail")){
			int rboard_no=Integer.parseInt(request.getParameter("rboard_no"));
			referenceDto referenceDto = dao.selectOne(rboard_no);

			request.setAttribute("referencedto", referenceDto);
			dispatch("reference/boarddetail.jsp", request, response);
		}
		
		/***자료실 게시글CRUD***/
		/*게시글작성*/
		else if(command.equals("ref_board_insert_form")) {
			dispatch("admin/admin_ref_board_insert.jsp", request, response);
		}
		else if(command.equals("ref_board_insert")){
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int grade = Integer.parseInt(request.getParameter("grade"));
			String subject = request.getParameter("subject");
			String type = request.getParameter("type");

			referenceDto dto = new referenceDto();

			dto.setRboard_title(title);
			dto.setRboard_content(content);
			dto.setRboard_grade(grade);
			dto.setRboard_subject(subject);
			dto.setRboard_type(type);

			int res = dao.insert(dto);

			if(res > 0){
				PrintWriter writer = response.getWriter();
				writer.println("<script type='text/javascript'>alert('작성 완료.'); location.href='../admin_controller.do?command=ref';</script>");
				writer.close();
			}else{
				PrintWriter writer = response.getWriter();
				writer.println("<script type='text/javascript'>alert('작성 실패.'); location.href='../admin_controller.do?command=ref';</script>");
				writer.close();
			}
		}
		else if(command.equals("board_detail")) {
			int rboard_no=Integer.parseInt(request.getParameter("rboard_no"));
			referenceDto referenceDto = dao.selectOne(rboard_no);
			
			request.setAttribute("referencedto", referenceDto);
			dispatch("admin/admin_ref_board_detail.jsp", request, response);
		}
		else if(command.equals("ref_board_update")){
			int no = Integer.parseInt(request.getParameter("no"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int grade = Integer.parseInt(request.getParameter("grade"));
			String subject = request.getParameter("subject");
			String type = request.getParameter("type");

			referenceDto dto = new referenceDto();

			dto.setRboard_no(no);
			dto.setRboard_title(title);
			dto.setRboard_content(content);
			dto.setRboard_grade(grade);
			dto.setRboard_subject(subject);
			dto.setRboard_type(type);

			int res = dao.update(dto);

			if(res > 0){
				PrintWriter writer = response.getWriter();
				writer.println("<script type='text/javascript'>alert('수정 완료.'); location.href='../admin_controller.do?command=ref';</script>");
				writer.close();
			}else{
				PrintWriter writer = response.getWriter();
				writer.println("<script type='text/javascript'>alert('수정 실패.'); location.href='../admin_controller.do?command=ref';</script>");
				writer.close();
			}
		}
		else if(command.equals("delete")){
			int no = Integer.parseInt(request.getParameter("no"));

			int res = dao.delete(no);

			if(res > 0){
				PrintWriter writer = response.getWriter();
				writer.println("<script type='text/javascript'>alert('삭제 완료.'); location.href='../admin_controller.do?command=ref';</script>");
				writer.close();
			}else{
				PrintWriter writer = response.getWriter();
				writer.println("<script type='text/javascript'>alert('삭제 실패.'); location.href='../admin_controller.do?command=ref';</script>");
				writer.close();
			}
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