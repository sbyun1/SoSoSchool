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
import javax.servlet.http.HttpSession;

import com.soso.login.Dao.UserDao;
import com.soso.login.Dto.UserDto;

@WebServlet("/login_controller.do")
public class login_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("["+command+"]");
		
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		UserDao dao = new UserDao();
		
		if(command.equals("login")) {
			String id = request.getParameter("userId");
			String pw = request.getParameter("userPassword");
			
			UserDto dto = dao.login(id, pw);
			session.setAttribute("dto", dto);
			session.setMaxInactiveInterval(60*60);
			
			if(dto.getUser_id() != null) {
				//유저 로그인 시 ( *관리자 로그인 시 구현 필요)
				if(dto.getUser_type().equals("USER")) {
					
					//순위 표시
					request.setAttribute("name", dto.getUser_name());
					request.setAttribute("point", dto.getUser_point());
					int no = dto.getUser_no();
					System.out.println("no : " + no);
					UserDto ps = dao.pointSelect(no);
					
					request.setAttribute("no", ps.getUser_no());
										
					List<UserDto> list = dao.pointAll();
					request.setAttribute("list", list);
					RequestDispatcher disp = request.getRequestDispatcher("login/main.jsp");
					disp.forward(request, response);
					
					//
					
					
					
					
				}
				
			//id , pw 잘못 입력 했을떄
			}else{ 
				out.println("<script>alert('아이디 또는 비밀번호를 다시 확인해주세요.'); location.href='2.jsp';</script>");
			}
		}else if(command.equals("regisform")) {
			response.sendRedirect("/login/regis.jsp");
			
		}else if(command.equals("idchk")){
			String user_id = request.getParameter("id");
			String res = dao.idChk(user_id);
			
			boolean idnotuser = true;
			if(res != null) {
				idnotuser = false;
			}
			response.sendRedirect("login/idChk.jsp?idnotused="+idnotuser);
			
		}else if(command.equals("insertuser")) {
			
			String user_pr = request.getParameter("parent_name");
			String user_id = request.getParameter("parent_id");
			String user_name = request.getParameter("student_name");
			String user_nn = request.getParameter("nick_name");
			String user_pw = request.getParameter("new_password");
			int phone = Integer.parseInt(request.getParameter("chk_tel"));
			int garde = Integer.parseInt(request.getParameter("garde"));
			String email1 = request.getParameter("new_email");
			String email2 = request.getParameter("textEmail");
			String email = email1 +'@'+ email2;
			
			/*
			 * String address = request.getParameter("new_address"); String address2 =
			 * request.getParameter("new_address2"); address = address +" "+ address2;
			 */
			
			String addr1= request.getParameter("postcode");
			String addr2= request.getParameter("roadAddress");
			String addr3= request.getParameter("detailAddress");
			String addr = addr1+" "+addr2+" "+addr3;
			
			
			UserDto dto = new UserDto();
			dto.setUser_pr(user_pr);
			dto.setUser_id(user_id);
			dto.setUser_name(user_name);
			dto.setUser_nn(user_nn);
			dto.setUser_pw(user_pw);
			dto.setPhone(phone);
			dto.setGrade(garde);
			dto.setEmail(email);
			dto.setAddr(addr);
			dto.getUser_point();
			dto.getSub_yn();
			dto.getEnabled_yn();
			dto.getUser_type();
						
			int res = dao.insertUser(dto);
			
			if(res > 0) {
				out.println("<script>alert('회원가입을 환영합니다 !'); location.href='login/login.jsp';</script>");	
			}else {
				out.println("<script>alert('잘못 입력하셨습니다.'); location.href='login/regis.jsp';</script>");
			}
		} /*
			 * else if(command.equals("list")){ List<UserDto> list = dao.selectAll();
			 * request.setAttribute("list", list); RequestDispatcher disp =
			 * request.getRequestDispatcher("4.jsp"); disp.forward(request, response); }
			 */
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
