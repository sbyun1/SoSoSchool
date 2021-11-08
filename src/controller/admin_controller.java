package controller;

import com.soso.login.Dao.UserDao;
import com.soso.login.Dto.UserDto;
import com.soso.ref.dao.referenceDao;
import com.soso.ref.dto.referenceDto;
import group.groupDao;
import group.groupDto;
import mypageDao.changeStarDao;
import mypageDto.changeStarDto;
import mypageDao.NoticeDao;
import mypageDto.NoticeDto;
import mypageDao.QnaDao;
import mypageDto.QnaDto;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/admin_controller.do")
public class admin_controller extends HttpServlet {
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
		groupDao groupdao = new groupDao();					//소그룹 dao
		changeStarDao changestardao = new changeStarDao();	//상품교환 dao
		referenceDao referenceDao = new referenceDao();		//자료실 dao
		NoticeDao Ndao = new NoticeDao();					//공지 dao
		QnaDao Qdao = new QnaDao();							//qna dao

		//소그룹
		if(command.equals("group")){
			List<groupDto> list_all = groupdao.admin_selectAll();				//전체 지역 리스트 불러오기
			List<groupDto> list_seoul = groupdao.admin_selectAll_seoul();		//서울 지역 리스트 불러오기
			List<groupDto> list_gyeonggi = groupdao.admin_selectAll_gyeonggi();	//경기 지역 리스트 불러오기
			List<groupDto> list_incheon = groupdao.admin_selectAll_incheon();	//인천 지역 리스트 불러오기

			request.setAttribute("list_all", list_all);							//리스트 속성 지정
			request.setAttribute("list_seoul", list_seoul);						//리스트 속성 지정
			request.setAttribute("list_gyeonggi", list_gyeonggi);				//리스트 속성 지정
			request.setAttribute("list_incheon", list_incheon);					//리스트 속성 지정

			dispatch("admin/admin_group_board_list.jsp", request, response);	//페이지 넘어가기
		}
		//상품 교환
		else if(command.equals("changestar")){
			List<changeStarDto> list = changestardao.selectall();

			request.setAttribute("list", list);

			dispatch("admin/admin_changeStar_board_list.jsp", request, response);
		}
		//자료실
		else if(command.equals("ref")){
			List<referenceDto> list_all = referenceDao.selectall();
			request.setAttribute("list_all", list_all);
			//국어
			List<referenceDto> kor_1 = referenceDao.select(1, "KOR");
			List<referenceDto> kor_2 = referenceDao.select(2, "KOR");
			List<referenceDto> kor_3 = referenceDao.select(3, "KOR");
			request.setAttribute("kor_1", kor_1);
			request.setAttribute("kor_2", kor_2);
			request.setAttribute("kor_3", kor_3);
			//영어
			List<referenceDto> eng_1 = referenceDao.select(1, "ENG");
			List<referenceDto> eng_2 = referenceDao.select(2, "ENG");
			List<referenceDto> eng_3 = referenceDao.select(3, "ENG");
			request.setAttribute("eng_1", eng_1);
			request.setAttribute("eng_2", eng_2);
			request.setAttribute("eng_3", eng_3);
			//수학
			List<referenceDto> math_1 = referenceDao.select(1, "MATH");
			List<referenceDto> math_2 = referenceDao.select(2, "MATH");
			List<referenceDto> math_3 = referenceDao.select(3, "MATH");
			request.setAttribute("math_1", math_1);
			request.setAttribute("math_2", math_2);
			request.setAttribute("math_3", math_3);

			dispatch("admin/admin_ref_board_list.jsp", request, response);
		}		
		
		
		//공지사항
		else if(command.equals("admin_notice")) {
			List<NoticeDto> noti_list = Ndao.selectAll(); //전체 리스트를 가져와서 selectAll실행
			
			request.setAttribute("list", noti_list);
			RequestDispatcher disp = request.getRequestDispatcher("admin/admin_notice.jsp");
			disp.forward(request, response);
		}
		//공지 디테일
		else if(command.equals("notice_detail")){
			int noti_no = Integer.parseInt(request.getParameter("noti_no"));
			NoticeDto dto = Ndao.selectOne(noti_no);
			
			request.setAttribute("dto", dto);
			RequestDispatcher dp = request.getRequestDispatcher("admin/admin_notice_detail.jsp");

			dp.forward(request, response);
		}
		//공지 수정
		else if(command.equals("notice_updateform")) {
			int noti_no = Integer.parseInt(request.getParameter("noti_no"));
			NoticeDto dto = Ndao.selectOne(noti_no);
			request.setAttribute("dto", dto);
			dispatch("admin/admin_notice_update.jsp", request, response);
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
				dispatch("admin_controller.do?command=admin_notice", request, response);
				
			}else {
				dispatch("admin_controller.do?command=notice_detail&noti_no="+noti_no, request, response);
			}
		}
		//공지삭제
		else if(command.equals("notice_delete")) {
			int noti_no = Integer.parseInt(request.getParameter("noti_no"));
			int res = Ndao.delete(noti_no);
			
			if(res > 0) {
				dispatch("admin_controller.do?command=admin_notice", request, response);
			}else {
				dispatch("admin_controller.do?command=notice_detail&noti_no="+noti_no, request, response);
			}
		}
		
		//공지 작성
		else if(command.equals("notice_writeform")) {
			
			response.sendRedirect("admin/admin_notice_write.jsp");
		}
		else if(command.equals("notice_write")) {
			String notice_title = request.getParameter("notice_title");
			String notice_content = request.getParameter("notice_content");
			
			NoticeDto dto = new NoticeDto();
			dto.setNoti_title(notice_title);
			dto.setNoti_content(notice_content);
			
			int res = Ndao.insert(dto);
			
			if(res > 0) {
				dispatch("admin_controller.do?command=admin_notice",request,response);
			}else {
				dispatch("admin_controller.do?command=notice_writeform", request, response);
			}
		}
		
		//qna
		else if(command.equals("admin_qna")) {
			List<QnaDto> qna_list = Qdao.selectAll(); //전체 리스트를 가져와서 selectAll실행
			
			request.setAttribute("list", qna_list);
			RequestDispatcher disp = request.getRequestDispatcher("admin/admin_qna.jsp");
			disp.forward(request, response);
		}
		//qna 디테일
		else if(command.equals("qna_detail")) {
			int qna_no = Integer.parseInt(request.getParameter("qna_no"));
			QnaDto dto = new QnaDto();
			dto = Qdao.selectOne(qna_no);
			
			request.setAttribute("dto", dto);
			RequestDispatcher dp = request.getRequestDispatcher("admin/admin_qna_detail.jsp");

			dp.forward(request, response);
		}
		//qna 답글달기
		else if(command.equals("qna_replyform")) {
			int parentqna_no = Integer.parseInt(request.getParameter("parentqna"));
			
			QnaDto dto = Qdao.selectOne(parentqna_no);
			request.setAttribute("parentqna", dto);
			dispatch("admin/admin_qna_reply.jsp", request, response);
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
				response.sendRedirect("admin_controller.do?command=admin_qna");
			}else {
				response.sendRedirect("admin_controller.do?command=qna_detail&qna_no="+parentqna_no);
			}
			
		}
		//qna 삭제
		else if(command.equals("qna_delete")) {
			int qna_no = Integer.parseInt(request.getParameter("qna_no"));
			int res = Qdao.delete(qna_no);
			
			if(res > 0) {
				dispatch("admin_controller.do?command=admin_qna",request, response);
			}
			else {
				dispatch("admin_controller.do?command=qna_detail&qna_no="+qna_no, request, response);
			}
			
		}
		
		//qna 수정
		else if(command.equals("qna_updateform")) {
			int qna_no = Integer.parseInt(request.getParameter("qna_no"));
		
			QnaDto dto = Qdao.selectOne(qna_no);
			request.setAttribute("dto", dto);
			dispatch("admin/admin_qna_update.jsp", request, response);
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
				dispatch("admin_controller.do?command=admin_qna", request, response);
				
			}else {
				dispatch("admin_controller.do?command=qna_detail&qna_no="+qna_no, request, response);
			}
		}
		

	}

	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
