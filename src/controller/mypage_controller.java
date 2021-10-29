package controller;

import java.io.IOException;

import java.io.PrintWriter;

import java.time.LocalDate;

import java.util.Date;

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
import mypageDao.QnaDao;
import mypageDao.changeStarDao;
import mypageDto.NoticeDto;
import mypageDto.QnaDto;
import mypageDto.changeStarDto;
import result.result_dao.result_dao;
import result.result_dto.result_dto;


/**
 * Servlet implementation class Notice
 */
@WebServlet("/mypage_controller.do")
public class mypage_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("[command: " + command + "]");
		

		result_dao resultdao = new result_dao();

		changeStarDao changestardao = new changeStarDao();
		UserDao userdao = new UserDao();

		NoticeDao Ndao = new NoticeDao();
		QnaDao Qdao = new QnaDao();

		
		if(command.equals("main")) {
			response.sendRedirect("main.jsp");
		}
		/*******************마이페이지 공지사항 페이지*************************/
		
		//공지 전체보기
		else if(command.equals("mypage_notice")) {
			List<NoticeDto> noti_list = Ndao.selectAll(); //전체 리스트를 가져와서 selectAll실행
			
			request.setAttribute("list", noti_list);
			RequestDispatcher disp = request.getRequestDispatcher("mypage/mypage_notice.jsp");
			disp.forward(request, response);
		}
		//공지 디테일 내용보기
		else if(command.equals("notice_detail")){
			int noti_no = Integer.parseInt(request.getParameter("noti_no"));
			NoticeDto dto = Ndao.selectOne(noti_no);
			
			request.setAttribute("dto", dto);
			RequestDispatcher dp = request.getRequestDispatcher("mypage/mypage_notice_detail.jsp");

			dp.forward(request, response);
		}
		//공지작성//
		else if(command.equals("notice_writeform")) {
			
			response.sendRedirect("mypage/mypage_notice_write.jsp");
		}
		else if(command.equals("notice_write")) {
			String notice_title = request.getParameter("notice_title");
			String notice_content = request.getParameter("notice_content");
			
			NoticeDto dto = new NoticeDto();
			dto.setNoti_title(notice_title);
			dto.setNoti_content(notice_content);
			
			int res = Ndao.insert(dto);
			
			if(res > 0) {
				dispatch("mypage_controller.do?command=mypage_notice",request,response);
			}else {
				dispatch("mypage_controller.do?command=notice_writeform", request, response);
			}
		}
		//공지 업데이트//
		else if(command.equals("notice_updateform")) {
			int noti_no = Integer.parseInt(request.getParameter("noti_no"));
			NoticeDto dto = Ndao.selectOne(noti_no);
			request.setAttribute("dto", dto);
			dispatch("mypage/notice_update.jsp", request, response);
		}
		
		else if(command.equals("notice_update")) {
			int noti_no = Integer.parseInt(request.getParameter("noti_no"));
			String noti_title = request.getParameter("noti_title");
			String noti_content = request.getParameter("noti_content");
			
			NoticeDto dto = new NoticeDto();
			dto.setNoti_no(noti_no);
			dto.setNoti_title(noti_title);
			dto.setNoti_content(noti_content);
			
			int res = Ndao.update(dto);
			
			if(res > 0) {
				dispatch("mypage_controller.do?command=mypage_notice", request, response);
				
			}else {
				dispatch("mypage_controller.do?command=notice_detail&noti_no="+noti_no, request, response);
			}
		}
		//공지 삭제//
		else if(command.equals("notice_delete")) {
			int noti_no = Integer.parseInt(request.getParameter("noti_no"));
			int res = Ndao.delete(noti_no);
			
			if(res > 0) {
				dispatch("mypage_controller.do?command=mypage_notice", request, response);
			}else {
				dispatch("mypage_controller.do?command=notice_detail&noti_no="+noti_no, request, response);
			}
		}
		
		/**************마이페이지 회원정보 수정 페이지**************************/
		else if(command.equals("mypage_userinfo")) {
			response.sendRedirect("mypage/mypage_userInfo.jsp");
		}
		else if(command.equals("mypage_userUpdate")){
			int user_no = Integer.parseInt(request.getParameter("user_no"));
	
		}
		
				
				
				
				
				
				
		/*******************마이페이지 고객문의*****************************/
		else if(command.equals("mypage_qna")) {
			List<QnaDto> qna_list = Qdao.selectAll(); //전체 리스트를 가져와서 selectAll실행
			
			request.setAttribute("list", qna_list);
			RequestDispatcher disp = request.getRequestDispatcher("mypage/mypage_qna.jsp");
			disp.forward(request, response);
		}
		else if(command.equals("qna_detail")) {
			int qna_no = Integer.parseInt(request.getParameter("qna_no"));
			QnaDto dto = new QnaDto();
			dto = Qdao.selectOne(qna_no);
			
			request.setAttribute("dto", dto);
			RequestDispatcher dp = request.getRequestDispatcher("mypage/mypage_qna_detail.jsp");

			dp.forward(request, response);
		}


		else if(command.equals("qna_writeform")) {
			response.sendRedirect("mypage/mypage_qna_write.jsp");
		}
		else if(command.equals("qna_write")) {
			String qna_title = request.getParameter("qna_title");
			String qna_writer = request.getParameter("qna_writer");
			String qna_content = request.getParameter("qna_content");
			
			QnaDto dto = new QnaDto();
			dto.setQna_title(qna_title);
			dto.setQna_writer(qna_writer);
			dto.setQna_content(qna_content);
			
			int res = Qdao.insert(dto);
		
			if(res > 0) {
				dispatch("mypage_controller.do?command=mypage_qna",request,response);
			}else {
				dispatch("mypage_controller.do?command=qna_writeform", request, response);
			}
		}
		
		else if(command.equals("qna_updateform")) {
			int qna_no = Integer.parseInt(request.getParameter("qna_no"));
		
			QnaDto dto = Qdao.selectOne(qna_no);
			request.setAttribute("dto", dto);
			dispatch("mypage/qna_update.jsp", request, response);
		}
		else if(command.equals("qna_update")) {
			int qna_no = Integer.parseInt(request.getParameter("qna_no"));
			String qna_title =request.getParameter("qna_title");
			String qna_content = request.getParameter("qna_content");
			
			QnaDto dto = new QnaDto();
			dto.setQna_no(qna_no);
			dto.setQna_title(qna_title);
			dto.setQna_content(qna_content);
			
			int res = Qdao.update(dto);
			
			if(res > 0) {
				dispatch("mypage_controller.do?command=mypage_qna", request, response);
				
			}else {
				dispatch("mypage_controller.do?command=qna_detail&qna_no="+qna_no, request, response);
			}
		}
		else if(command.equals("qna_delete")) {
			int qna_no = Integer.parseInt(request.getParameter("qna_no"));
			int res = Qdao.delete(qna_no);
			
			if(res > 0) {
				dispatch("mypage_controller.do?command=mypage_qna",request, response);
			}
			else {
				dispatch("mypage_controller.do?command=qna_detail&qna_no="+qna_no, request, response);
			}
			
		}

		else if(command.equals("qna_replyform")) {
			int parentqna_no = Integer.parseInt(request.getParameter("parentqna"));
			
			QnaDto dto = Qdao.selectOne(parentqna_no);
			request.setAttribute("parentqna", dto);
			dispatch("mypage/mypage_qna_reply.jsp", request, response);
		}
		else if(command.equals("qna_reply")) {
			int parentqna_no = Integer.parseInt(request.getParameter("parentqna_no"));
			String qna_writer = request.getParameter("qna_writer");
			String qna_title = request.getParameter("qna_title");
			String qna_content = request.getParameter("qna_content");
			
			QnaDto parentQna = Qdao.selectOne(parentqna_no);
			
			int parentgno = parentQna.getQna_gno();
			int parentgsq = parentQna.getQna_gsq();
			int parenttab = parentQna.getQna_tab();
			
			QnaDto dto = new QnaDto(0, parentgno, parentgsq, parenttab, qna_title, qna_writer, qna_content, null); 
			boolean res = Qdao.reply_logic(dto);
			
			if(res) {
				response.sendRedirect("mypage_controller.do?command=mypage_qna");
			}else {
				response.sendRedirect("mypage_controller.do?command=qna_detail&qna_no="+parentqna_no);
			}
			
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
		dispatch.forward(request,response);
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
