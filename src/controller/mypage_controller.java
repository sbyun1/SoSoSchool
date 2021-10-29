package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
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
import mypageDao.changeStarDao;
import mypageDto.NoticeDto;
import result.result_dao.result_dao;
import result.result_dto.result_dto;
import mypageDto.changeStarDto;

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
		changeStarDao changestardao = new changeStarDao();
		UserDao userdao = new UserDao();
		
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
			List<changeStarDto> list = changestardao.selectall();

			request.setAttribute("list", list);
			dispatch("mypage/mypage_changestar.jsp", request, response);
		}
		/*성적 확인 페이지 이동*/
		else if(command.equals("mypage_checkscore")){
			String user_id = request.getParameter("user_id");
			result_dto month_1 = resultdao.select_month(user_id);
			result_dto month_2 = resultdao.select_month_1(user_id);
			result_dto month_3 = resultdao.select_month_2(user_id);

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
		//상품 교환
		else if(command.equals("changegift")){
			int user_no = Integer.parseInt(request.getParameter("user_no"));	//현재 본인 계정
			int gi_no = Integer.parseInt(request.getParameter("gi_no"));	//선택한 상품의 번호
			int user_star = Integer.parseInt(request.getParameter("user_star"));	//현재 본인 계정의 포인트

			changeStarDto changeStarDto = changestardao.selectone(gi_no);	//선택한 상품 개수 가져오기

			//선택한 상품의 가격이 본인이 가지고 있는 포인트보다 많을 경우
			if(changeStarDto.getGi_prize() > user_star){
				jsResponse("포인트가 부족함 ㅇㅇ", "mypage_controller.do?command=mypage_changestar", response);
			}
			//선택한 상품의 가격이 본인이 가지고 있는 포인트보다 같거나 작을경우(구매 가능할 경우)
			else if(changeStarDto.getGi_prize() <= user_star){
				int res = changestardao.buygift(gi_no);	//상품 교환
				int change_user_star = user_star - changeStarDto.getGi_prize();	//상품 교환 후 계정 포인트 차감

				System.out.println(change_user_star);

				if(res > 0){
					int update_star = userdao.update_star(change_user_star, user_no);
					if(update_star > 0){
						HttpSession session = request.getSession();
						UserDto userdto = userdao.selectuser(user_no);
						session.setAttribute("userdto", userdto);
						jsResponse("상품 교환 성공", "../mypage_controller.do?command=mypage_changestar", response);
					}else {
						jsResponse("포인트 차감에서 실패", "../mypage_controller.do?command=mypage_changestar", response);
					}
				}else {
					jsResponse("상품 교환에서 실패", "../mypage_controller.do?command=mypage_changestar", response);
				}
			}
		}
	}

	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>"+"alert('"+msg+"');"+"location.href='"+url+"';"+"</script>";
		PrintWriter out = response.getWriter();
		out.print(s);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
