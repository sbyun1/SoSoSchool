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

import mypageDao.NoticeDao;
import mypageDto.NoticeDto;

@WebServlet("/login_controller.do")
public class login_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("["+command+"]");
		
		PrintWriter out = response.getWriter();
		
		UserDao dao = new UserDao();
		NoticeDao nDao = new NoticeDao();
		HttpSession session = request.getSession();

		if(command.equals("loginform")) {
			response.sendRedirect("/login/login.jsp");
		}else if(command.equals("login")) {
			String id = request.getParameter("userId");
			String pw = request.getParameter("userPassword");
			
			UserDto userdto = dao.login(id, pw);

			if(userdto.getUser_id() != null) {
				session.setAttribute("userdto", userdto);
				session.setMaxInactiveInterval(60*60);

				if(userdto.getEnabled_yn().equals("N")){
					PrintWriter writer = response.getWriter();
					writer.println("<script type='text/javascript'>alert('탈퇴한 회원입니다');location.href='../login_controller.do?command=loginform';</script>");
					writer.close();
					session.invalidate();
				}else if(userdto.getEnabled_yn().equals("Y")){
					//유저 로그인 시 ( *관리자 로그인 시 구현 필요)
					if(userdto.getUser_type().equals("USER")) {
						//순위 표시
						request.setAttribute("name", userdto.getUser_name());
						request.setAttribute("point", userdto.getUser_point());
						int no = userdto.getUser_no();
						UserDto ps = dao.pointSelect(no);
						request.setAttribute("no", ps.getUser_no());
						List<UserDto> list = dao.pointAll();
						request.setAttribute("rank_list", list);

						//공지 사항 리스트
						List<NoticeDto> noti_list = nDao.selectAll();
						request.setAttribute("noti_list", noti_list);


						RequestDispatcher disp = request.getRequestDispatcher("login/main.jsp");
						disp.forward(request, response);
					}else if(userdto.getUser_type().equals("ADMIN")){
						RequestDispatcher disp = request.getRequestDispatcher("admin/admin_main.jsp");
						disp.forward(request, response);
					}
				}

				
			//id , pw 잘못 입력 했을떄
			}else{ 
				out.println("<script>alert('아이디 또는 비밀번호를 다시 확인해주세요.'); location.href='../login_controller.do?command=loginform';</script>");
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
			String user_pw = request.getParameter("new_password");
			String phone = request.getParameter("chk_tel");
			int garde = Integer.parseInt(request.getParameter("garde"));
			String email1 = request.getParameter("new_email");
			//String email2 = request.getParameter("textEmail");
			String email = email1;
			//+'@'+ email2;
			String postcode= request.getParameter("postcode");
			String roadAddr= request.getParameter("roadAddress");
			String detailAddr= request.getParameter("detailAddress");
			String region = request.getParameter("region");

			UserDto dto = new UserDto();
			dto.setUser_pr(user_pr);
			dto.setUser_id(user_id);
			dto.setUser_name(user_name);
			dto.setUser_pw(user_pw);
			dto.setPhone(phone);
			dto.setGrade(garde);
			dto.setEmail(email);
			dto.setPostcode(postcode);
			dto.setRoadAddr(roadAddr);
			dto.setDetailAddr(detailAddr);
			dto.setRegion(region);

			int res = dao.insertUser(dto);

			if(res > 0) {
				out.println("<script>alert('회원가입을 환영합니다 !'); location.href='../login_controller.do?command=loginform';</script>");
			}else {
				out.println("<script>alert('잘못 입력하셨습니다.'); location.href='../login_controller.do?command=regisform';</script>");
			}
		}else if(command.equals("searchForm")){
			response.sendRedirect("/login/searchForm.jsp");
		}else if(command.equals("searchIdForm")) {
			response.sendRedirect("/login/searchidForm.jsp");
		}else if(command.equals("searchPwForm")) {
			response.sendRedirect("/login/searchpwForm.jsp");
		}else if(command.equals("searchId")){
			String name = request.getParameter("name");
			String email = request.getParameter("email");

			String id = dao.searchId(name, email);

			if(id != null) {
				out.println("<script>alert('회원님의 ID 는 " + id + " 입니다.'); location.href='../login_controller.do?command=loginform'</script>");
			}else {
				out.println("<script>alert('ID를 찾을 수 없습니다.'); location.href='../login_controller.do?command=searchIdForm';</script>");
			}
		}else if(command.equals("searchPw")) {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String id = request.getParameter("id");

			String pw = dao.searchPw(name,email,id);

			if(pw != null) {
				out.println("<script>alert('회원님의 PW 은 " + pw + " 입니다.'); location.href='../login_controller.do?command=loginform'</script>");
			}else {
				out.println("<script>alert('PW를 찾을 수 없습니다.'); location.href='../login_controller.do?command=searchPwForm';</script>");
			}
		}else if(command.equals("logout")){
			session.invalidate();
			response.sendRedirect("../login/login.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}