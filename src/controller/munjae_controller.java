package controller;

import com.soso.login.Dao.UserDao;
import com.soso.login.Dto.UserDto;
import mypageDao.NoticeDao;
import mypageDto.NoticeDto;
import result.result_dao.result_dao;
import result.result_dto.result_eng_dto;
import result.result_dto.result_kor_dto;
import result.result_dto.result_math_dto;

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
		result_dao resultdao = new result_dao();

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
		}else if(command.equals("kor_final")){
			int user_no = Integer.parseInt(request.getParameter("user_no"));				//유저 정보 확인용 유저 번호
			int correct = Integer.parseInt(request.getParameter("correct"));				//맞춘 개수
			int sum = Integer.parseInt(request.getParameter("sum"));						//점수
			int month = Integer.parseInt(request.getParameter("month"));					//사이트 기준 월
			int date = Integer.parseInt(request.getParameter("date"));					//사이트 기준 일

			userdto = userdao.selectuser(user_no);											//유저 정보 가져오기

			result_kor_dto kor_dto = resultdao.select_month_kor(userdto.getUser_id());		//이번달 국어 성적 가져오기

			if(userdto.getGrade() == 1){
				//이번달에 문제를 플었으면
				if(kor_dto.getMonth() == month){
					PrintWriter writer = response.getWriter();
					writer.println("<script type='text/javascript'>alert('이번 달에 이미 문제 풀이를 했습니다.'); location.href='../mypage_controller.do?command=mypage_checkscore&user_id="+userdto.getUser_id()+"';</script>");
					writer.close();
				}
				//이번달에 문제를 안풀었으면
				else{
					kor_dto.setUser_id(userdto.getUser_id());
					kor_dto.setMonth(month);
					kor_dto.setDay(date);
					kor_dto.setKor(sum);

					resultdao.insert_kor(kor_dto);

					userdao.insert_user_point(correct, userdto.getUser_id());
					userdao.insert_user_star(correct, userdto.getUser_id());

					result_kor_dto month_kor = resultdao.select_month_kor(userdto.getUser_id());
					request.setAttribute("month_kor", month_kor);

					userdto = userdao.selectuser(user_no);
					session.setAttribute("userdto", userdto);

					LocalDate now = LocalDate.now();

					//이번달
					result_eng_dto month_eng = resultdao.select_month_eng(userdto.getUser_id());
					result_math_dto month_math = resultdao.select_month_math(userdto.getUser_id());

					if(resultdao.check_eng(userdto.getUser_id()) == 0){
						month_eng.setEng(0);
						month_eng.setMonth(month);
						request.setAttribute("month_eng", month_eng);
					}
					if(resultdao.check_math(userdto.getUser_id()) == 0){
						month_math.setMath(0);
						month_math.setMonth(month);
						request.setAttribute("month_math", month_math);
					}

					//세 과목 모두 성적이 있으면 값 지정
					if(month_eng.getMonth() == month || month_math.getMonth() == month){
						request.setAttribute("month_eng", month_eng);
						request.setAttribute("month_math", month_math);
					}

					//한달전
					result_kor_dto month_kor_1 = resultdao.select_month_kor_1(userdto.getUser_id());
					result_eng_dto month_eng_1 = resultdao.select_month_eng_1(userdto.getUser_id());
					result_math_dto month_math_1 = resultdao.select_month_math_1(userdto.getUser_id());

					if(resultdao.check_kor_1(userdto.getUser_id()) == 0){
						month_kor_1.setKor(0);
						month_kor_1.setMonth(month);
						request.setAttribute("month_kor_1", month_kor_1);
					}
					if(resultdao.check_eng_1(userdto.getUser_id()) == 0){
						month_eng_1.setEng(0);
						month_eng_1.setMonth(month);
						request.setAttribute("month_eng_1", month_eng_1);
					}
					if(resultdao.check_math_1(userdto.getUser_id()) == 0){
						month_math_1.setMath(0);
						month_math_1.setMonth(month);
						request.setAttribute("month_math_1", month_math_1);
					}

					request.setAttribute("month_kor_1", month_kor_1);
					request.setAttribute("month_eng_1", month_eng_1);
					request.setAttribute("month_math_1", month_math_1);

					//두달전
					result_kor_dto month_kor_2 = resultdao.select_month_kor_2(userdto.getUser_id());
					result_eng_dto month_eng_2 = resultdao.select_month_eng_2(userdto.getUser_id());
					result_math_dto month_math_2 = resultdao.select_month_math_2(userdto.getUser_id());

					if(resultdao.check_kor_2(userdto.getUser_id()) == 0){
						month_kor_2.setKor(0);
						month_kor_2.setMonth(month);
						request.setAttribute("month_kor_2", month_kor_2);
					}
					if(resultdao.check_eng_2(userdto.getUser_id()) == 0){
						month_eng_2.setEng(0);
						month_eng_2.setMonth(month);
						request.setAttribute("month_eng_2", month_eng_2);
					}
					if(resultdao.check_math_2(userdto.getUser_id()) == 0){
						month_math_2.setMath(0);
						month_math_2.setMonth(month);
						request.setAttribute("month_math_2", month_math_2);
					}

					request.setAttribute("month_kor_2", month_kor_2);
					request.setAttribute("month_eng_2", month_eng_2);
					request.setAttribute("month_math_2", month_math_2);

					dispatch("mypage/mypage_checkscore.jsp",request,response);
				}
			}else if (userdto.getGrade() == 2){
				//이번달에 문제를 플었으면
				if(kor_dto.getMonth() == month){
					PrintWriter writer = response.getWriter();
					writer.println("<script type='text/javascript'>alert('이번 달에 이미 문제 풀이를 했습니다.'); location.href='../mypage_controller.do?command=mypage_checkscore&user_id="+userdto.getUser_id()+"';</script>");
					writer.close();
				}//이번달에 문제를 안풀었으면
				else {
					kor_dto.setUser_id(userdto.getUser_id());
					kor_dto.setMonth(month);
					kor_dto.setDay(date);
					kor_dto.setKor(sum);

					resultdao.insert_kor(kor_dto);

					userdao.insert_user_point(correct, userdto.getUser_id());
					userdao.insert_user_star(correct, userdto.getUser_id());

					result_kor_dto month_kor = resultdao.select_month_kor(userdto.getUser_id());
					request.setAttribute("month_kor", month_kor);

					userdto = userdao.selectuser(user_no);
					session.setAttribute("userdto", userdto);
					LocalDate now = LocalDate.now();

					//이번달
					result_eng_dto month_eng = resultdao.select_month_eng(userdto.getUser_id());
					result_math_dto month_math = resultdao.select_month_math(userdto.getUser_id());

					if(resultdao.check_eng(userdto.getUser_id()) == 0){
						month_eng.setEng(0);
						month_eng.setMonth(month);
						request.setAttribute("month_eng", month_eng);
					}
					if(resultdao.check_math(userdto.getUser_id()) == 0){
						month_math.setMath(0);
						month_math.setMonth(month);
						request.setAttribute("month_math", month_math);
					}

					//세 과목 모두 성적이 있으면 값 지정
					if(month_eng.getMonth() == month || month_math.getMonth() == month){
						request.setAttribute("month_eng", month_eng);
						request.setAttribute("month_math", month_math);
					}

					//한달전
					result_kor_dto month_kor_1 = resultdao.select_month_kor_1(userdto.getUser_id());
					result_eng_dto month_eng_1 = resultdao.select_month_eng_1(userdto.getUser_id());
					result_math_dto month_math_1 = resultdao.select_month_math_1(userdto.getUser_id());

					if(resultdao.check_kor_1(userdto.getUser_id()) == 0){
						month_kor_1.setKor(0);
						month_kor_1.setMonth(month);
						request.setAttribute("month_kor_1", month_kor_1);
					}
					if(resultdao.check_eng_1(userdto.getUser_id()) == 0){
						month_eng_1.setEng(0);
						month_eng_1.setMonth(month);
						request.setAttribute("month_eng_1", month_eng_1);
					}
					if(resultdao.check_math_1(userdto.getUser_id()) == 0){
						month_math_1.setMath(0);
						month_math_1.setMonth(month);
						request.setAttribute("month_math_1", month_math_1);
					}

					request.setAttribute("month_kor_1", month_kor_1);
					request.setAttribute("month_eng_1", month_eng_1);
					request.setAttribute("month_math_1", month_math_1);

					//두달전
					result_kor_dto month_kor_2 = resultdao.select_month_kor_2(userdto.getUser_id());
					result_eng_dto month_eng_2 = resultdao.select_month_eng_2(userdto.getUser_id());
					result_math_dto month_math_2 = resultdao.select_month_math_2(userdto.getUser_id());

					if(resultdao.check_kor_2(userdto.getUser_id()) == 0){
						month_kor_2.setKor(0);
						month_kor_2.setMonth(month);
						request.setAttribute("month_kor_2", month_kor_2);
					}
					if(resultdao.check_eng_2(userdto.getUser_id()) == 0){
						month_eng_2.setEng(0);
						month_eng_2.setMonth(month);
						request.setAttribute("month_eng_2", month_eng_2);
					}
					if(resultdao.check_math_2(userdto.getUser_id()) == 0){
						month_math_2.setMath(0);
						month_math_2.setMonth(month);
						request.setAttribute("month_math_2", month_math_2);
					}

					request.setAttribute("month_kor_2", month_kor_2);
					request.setAttribute("month_eng_2", month_eng_2);
					request.setAttribute("month_math_2", month_math_2);

					dispatch("mypage/mypage_checkscore.jsp",request,response);
				}
			}else if (userdto.getGrade() == 3){
				//이번달에 문제를 플었으면
				if(kor_dto.getMonth() == month){
					PrintWriter writer = response.getWriter();
					writer.println("<script type='text/javascript'>alert('이번 달에 이미 문제 풀이를 했습니다.'); location.href='../mypage_controller.do?command=mypage_checkscore&user_id="+userdto.getUser_id()+"';</script>");
					writer.close();
				}//이번달에 문제를 안풀었으면
				else {
					kor_dto.setUser_id(userdto.getUser_id());
					kor_dto.setMonth(month);
					kor_dto.setDay(date);
					kor_dto.setKor(sum);

					resultdao.insert_kor(kor_dto);

					userdao.insert_user_point(correct, userdto.getUser_id());
					userdao.insert_user_star(correct, userdto.getUser_id());

					result_kor_dto month_kor = resultdao.select_month_kor(userdto.getUser_id());
					request.setAttribute("month_kor", month_kor);

					userdto = userdao.selectuser(user_no);
					session.setAttribute("userdto", userdto);
					LocalDate now = LocalDate.now();

					//이번달
					result_eng_dto month_eng = resultdao.select_month_eng(userdto.getUser_id());
					result_math_dto month_math = resultdao.select_month_math(userdto.getUser_id());

					if(resultdao.check_eng(userdto.getUser_id()) == 0){
						month_eng.setEng(0);
						month_eng.setMonth(month);
						request.setAttribute("month_eng", month_eng);
					}
					if(resultdao.check_math(userdto.getUser_id()) == 0){
						month_math.setMath(0);
						month_math.setMonth(month);
						request.setAttribute("month_math", month_math);
					}

					//세 과목 모두 성적이 있으면 값 지정
					if(month_eng.getMonth() == month || month_math.getMonth() == month){
						request.setAttribute("month_eng", month_eng);
						request.setAttribute("month_math", month_math);
					}

					//한달전
					result_kor_dto month_kor_1 = resultdao.select_month_kor_1(userdto.getUser_id());
					result_eng_dto month_eng_1 = resultdao.select_month_eng_1(userdto.getUser_id());
					result_math_dto month_math_1 = resultdao.select_month_math_1(userdto.getUser_id());

					if(resultdao.check_kor_1(userdto.getUser_id()) == 0){
						month_kor_1.setKor(0);
						month_kor_1.setMonth(month);
						request.setAttribute("month_kor_1", month_kor_1);
					}
					if(resultdao.check_eng_1(userdto.getUser_id()) == 0){
						month_eng_1.setEng(0);
						month_eng_1.setMonth(month);
						request.setAttribute("month_eng_1", month_eng_1);
					}
					if(resultdao.check_math_1(userdto.getUser_id()) == 0){
						month_math_1.setMath(0);
						month_math_1.setMonth(month);
						request.setAttribute("month_math_1", month_math_1);
					}

					request.setAttribute("month_kor_1", month_kor_1);
					request.setAttribute("month_eng_1", month_eng_1);
					request.setAttribute("month_math_1", month_math_1);

					//두달전
					result_kor_dto month_kor_2 = resultdao.select_month_kor_2(userdto.getUser_id());
					result_eng_dto month_eng_2 = resultdao.select_month_eng_2(userdto.getUser_id());
					result_math_dto month_math_2 = resultdao.select_month_math_2(userdto.getUser_id());

					if(resultdao.check_kor_2(userdto.getUser_id()) == 0){
						month_kor_2.setKor(0);
						month_kor_2.setMonth(month);
						request.setAttribute("month_kor_2", month_kor_2);
					}
					if(resultdao.check_eng_2(userdto.getUser_id()) == 0){
						month_eng_2.setEng(0);
						month_eng_2.setMonth(month);
						request.setAttribute("month_eng_2", month_eng_2);
					}
					if(resultdao.check_math_2(userdto.getUser_id()) == 0){
						month_math_2.setMath(0);
						month_math_2.setMonth(month);
						request.setAttribute("month_math_2", month_math_2);
					}

					request.setAttribute("month_kor_2", month_kor_2);
					request.setAttribute("month_eng_2", month_eng_2);
					request.setAttribute("month_math_2", month_math_2);

					dispatch("mypage/mypage_checkscore.jsp",request,response);
				}
			}
		}

		if(command.equals("math_first")){
			int user_no = Integer.parseInt(request.getParameter("user_no"));

			userdto = userdao.selectuser(user_no);

			if(userdto.getGrade() == 1){
				dispatch("munjae/math_1_1.jsp", request, response);
			}else if (userdto.getGrade() == 2){
				dispatch("munjae/math_2_1.jsp", request, response);
			}else if (userdto.getGrade() == 3){
				dispatch("munjae/math_3_1.jsp", request, response);
			}
		}else if(command.equals("math_second")){
			int user_no = Integer.parseInt(request.getParameter("user_no"));
			int correct = Integer.parseInt(request.getParameter("correct"));

			userdto = userdao.selectuser(user_no);

			if(userdto.getGrade() == 1){
				request.setAttribute("correct", correct);
				dispatch("munjae/math_1_2.jsp", request, response);
			}else if (userdto.getGrade() == 2){
				request.setAttribute("correct", correct);
				dispatch("munjae/math_2_2.jsp", request, response);
			}else if (userdto.getGrade() == 3){
				request.setAttribute("correct", correct);
				dispatch("munjae/math_3_2.jsp", request, response);
			}
		}else if(command.equals("math_third")) {
			int user_no = Integer.parseInt(request.getParameter("user_no"));
			int correct = Integer.parseInt(request.getParameter("correct"));

			userdto = userdao.selectuser(user_no);

			if (userdto.getGrade() == 1) {
				request.setAttribute("correct", correct);
				dispatch("munjae/math_1_3.jsp", request, response);
			} else if (userdto.getGrade() == 2) {
				request.setAttribute("correct", correct);
				dispatch("munjae/math_2_3.jsp", request, response);
			} else if (userdto.getGrade() == 3) {
				request.setAttribute("correct", correct);
				dispatch("munjae/math_3_3.jsp", request, response);
			}
		}else if(command.equals("math_final")){
			int user_no = Integer.parseInt(request.getParameter("user_no"));				//유저 정보 확인용 유저 번호
			int correct = Integer.parseInt(request.getParameter("correct"));				//맞춘 개수
			int sum = Integer.parseInt(request.getParameter("sum"));						//점수
			int month = Integer.parseInt(request.getParameter("month"));					//사이트 기준 월
			int date = Integer.parseInt(request.getParameter("date"));					//사이트 기준 일

			userdto = userdao.selectuser(user_no);											//유저 정보 가져오기

			result_math_dto math_dto = resultdao.select_month_math(userdto.getUser_id());	//이번달 수학 성적 가져오기

			if(userdto.getGrade() == 1){
				//이번달에 문제를 풀었으면
				if(math_dto.getMonth() == month){
					PrintWriter writer = response.getWriter();
					writer.println("<script type='text/javascript'>alert('이번 달에 이미 문제 풀이를 했습니다.'); location.href='../mypage_controller.do?command=mypage_checkscore&user_id="+userdto.getUser_id()+"';</script>");
					writer.close();
				}else{
					math_dto.setUser_id(userdto.getUser_id());
					math_dto.setMonth(month);
					math_dto.setDay(date);
					math_dto.setMath(sum);

					resultdao.insert_math(math_dto);

					userdao.insert_user_point(correct, userdto.getUser_id());
					userdao.insert_user_star(correct, userdto.getUser_id());

					result_math_dto month_math = resultdao.select_month_math(userdto.getUser_id());
					request.setAttribute("month_math", month_math);

					userdto = userdao.selectuser(user_no);
					session.setAttribute("userdto", userdto);

					LocalDate now = LocalDate.now();

					//이번달
					result_kor_dto month_kor = resultdao.select_month_kor(userdto.getUser_id());
					result_eng_dto month_eng = resultdao.select_month_eng(userdto.getUser_id());

					if(resultdao.check_kor(userdto.getUser_id()) == 0){
						month_kor.setKor(0);
						month_kor.setMonth(month);
						request.setAttribute("month_kor", month_kor);
					}
					if(resultdao.check_eng(userdto.getUser_id()) == 0){
						month_eng.setEng(0);
						month_eng.setMonth(month);
						request.setAttribute("month_eng", month_eng);
					}

					//세 과목 모두 성적이 있으면 값 지정
					request.setAttribute("month_kor", month_kor);
					request.setAttribute("month_eng", month_eng);

					//한달전
					result_kor_dto month_kor_1 = resultdao.select_month_kor_1(userdto.getUser_id());
					result_eng_dto month_eng_1 = resultdao.select_month_eng_1(userdto.getUser_id());
					result_math_dto month_math_1 = resultdao.select_month_math_1(userdto.getUser_id());

					if(resultdao.check_kor_1(userdto.getUser_id()) == 0){
						month_kor_1.setKor(0);
						month_kor_1.setMonth(month);
						request.setAttribute("month_kor_1", month_kor_1);
					}
					if(resultdao.check_eng_1(userdto.getUser_id()) == 0){
						month_eng_1.setEng(0);
						month_eng_1.setMonth(month);
						request.setAttribute("month_eng_1", month_eng_1);
					}
					if(resultdao.check_math_1(userdto.getUser_id()) == 0){
						month_math_1.setMath(0);
						month_math_1.setMonth(month);
						request.setAttribute("month_math_1", month_math_1);
					}

					request.setAttribute("month_kor_1", month_kor_1);
					request.setAttribute("month_eng_1", month_eng_1);
					request.setAttribute("month_math_1", month_math_1);

					//두달전
					result_kor_dto month_kor_2 = resultdao.select_month_kor_2(userdto.getUser_id());
					result_eng_dto month_eng_2 = resultdao.select_month_eng_2(userdto.getUser_id());
					result_math_dto month_math_2 = resultdao.select_month_math_2(userdto.getUser_id());

					if(resultdao.check_kor_2(userdto.getUser_id()) == 0){
						month_kor_2.setKor(0);
						month_kor_2.setMonth(month);
						request.setAttribute("month_kor_2", month_kor_2);
					}
					if(resultdao.check_eng_2(userdto.getUser_id()) == 0){
						month_eng_2.setEng(0);
						month_eng_2.setMonth(month);
						request.setAttribute("month_eng_2", month_eng_2);
					}
					if(resultdao.check_math_2(userdto.getUser_id()) == 0){
						month_math_2.setMath(0);
						month_math_2.setMonth(month);
						request.setAttribute("month_math_2", month_math_2);
					}

					request.setAttribute("month_kor_2", month_kor_2);
					request.setAttribute("month_eng_2", month_eng_2);
					request.setAttribute("month_math_2", month_math_2);

					dispatch("mypage/mypage_checkscore.jsp",request,response);
				}
			}else if(userdto.getGrade() == 2){
				//이번달에 문제를 풀었으면
				if(math_dto.getMonth() == month){
					PrintWriter writer = response.getWriter();
					writer.println("<script type='text/javascript'>alert('이번 달에 이미 문제 풀이를 했습니다.'); location.href='../mypage_controller.do?command=mypage_checkscore&user_id="+userdto.getUser_id()+"';</script>");
					writer.close();
				}else{
					math_dto.setUser_id(userdto.getUser_id());
					math_dto.setMonth(month);
					math_dto.setDay(date);
					math_dto.setMath(sum);

					resultdao.insert_math(math_dto);

					userdao.insert_user_point(correct, userdto.getUser_id());
					userdao.insert_user_star(correct, userdto.getUser_id());

					result_math_dto month_math = resultdao.select_month_math(userdto.getUser_id());
					request.setAttribute("month_math", month_math);

					userdto = userdao.selectuser(user_no);
					session.setAttribute("userdto", userdto);

					LocalDate now = LocalDate.now();

					//이번달
					result_kor_dto month_kor = resultdao.select_month_kor(userdto.getUser_id());
					result_eng_dto month_eng = resultdao.select_month_eng(userdto.getUser_id());

					if(resultdao.check_kor(userdto.getUser_id()) == 0){
						month_kor.setKor(0);
						month_kor.setMonth(month);
						request.setAttribute("month_kor", month_kor);
					}
					if(resultdao.check_eng(userdto.getUser_id()) == 0){
						month_eng.setEng(0);
						month_eng.setMonth(month);
						request.setAttribute("month_eng", month_eng);
					}

					//세 과목 모두 성적이 있으면 값 지정
					request.setAttribute("month_kor", month_kor);
					request.setAttribute("month_eng", month_eng);

					//한달전
					result_kor_dto month_kor_1 = resultdao.select_month_kor_1(userdto.getUser_id());
					result_eng_dto month_eng_1 = resultdao.select_month_eng_1(userdto.getUser_id());
					result_math_dto month_math_1 = resultdao.select_month_math_1(userdto.getUser_id());

					if(resultdao.check_kor_1(userdto.getUser_id()) == 0){
						month_kor_1.setKor(0);
						month_kor_1.setMonth(month);
						request.setAttribute("month_kor_1", month_kor_1);
					}
					if(resultdao.check_eng_1(userdto.getUser_id()) == 0){
						month_eng_1.setEng(0);
						month_eng_1.setMonth(month);
						request.setAttribute("month_eng_1", month_eng_1);
					}
					if(resultdao.check_math_1(userdto.getUser_id()) == 0){
						month_math_1.setMath(0);
						month_math_1.setMonth(month);
						request.setAttribute("month_math_1", month_math_1);
					}

					request.setAttribute("month_kor_1", month_kor_1);
					request.setAttribute("month_eng_1", month_eng_1);
					request.setAttribute("month_math_1", month_math_1);

					//두달전
					result_kor_dto month_kor_2 = resultdao.select_month_kor_2(userdto.getUser_id());
					result_eng_dto month_eng_2 = resultdao.select_month_eng_2(userdto.getUser_id());
					result_math_dto month_math_2 = resultdao.select_month_math_2(userdto.getUser_id());

					if(resultdao.check_kor_2(userdto.getUser_id()) == 0){
						month_kor_2.setKor(0);
						month_kor_2.setMonth(month);
						request.setAttribute("month_kor_2", month_kor_2);
					}
					if(resultdao.check_eng_2(userdto.getUser_id()) == 0){
						month_eng_2.setEng(0);
						month_eng_2.setMonth(month);
						request.setAttribute("month_eng_2", month_eng_2);
					}
					if(resultdao.check_math_2(userdto.getUser_id()) == 0){
						month_math_2.setMath(0);
						month_math_2.setMonth(month);
						request.setAttribute("month_math_2", month_math_2);
					}

					request.setAttribute("month_kor_2", month_kor_2);
					request.setAttribute("month_eng_2", month_eng_2);
					request.setAttribute("month_math_2", month_math_2);

					dispatch("mypage/mypage_checkscore.jsp",request,response);
				}
			}else if(userdto.getGrade() == 3){
				//이번달에 문제를 풀었으면
				if(math_dto.getMonth() == month){
					PrintWriter writer = response.getWriter();
					writer.println("<script type='text/javascript'>alert('이번 달에 이미 문제 풀이를 했습니다.'); location.href='../mypage_controller.do?command=mypage_checkscore&user_id="+userdto.getUser_id()+"';</script>");
					writer.close();
				}else{
					math_dto.setUser_id(userdto.getUser_id());
					math_dto.setMonth(month);
					math_dto.setDay(date);
					math_dto.setMath(sum);

					resultdao.insert_math(math_dto);

					userdao.insert_user_point(correct, userdto.getUser_id());
					userdao.insert_user_star(correct, userdto.getUser_id());

					result_math_dto month_math = resultdao.select_month_math(userdto.getUser_id());
					request.setAttribute("month_math", month_math);

					userdto = userdao.selectuser(user_no);
					session.setAttribute("userdto", userdto);

					LocalDate now = LocalDate.now();

					//이번달
					result_kor_dto month_kor = resultdao.select_month_kor(userdto.getUser_id());
					result_eng_dto month_eng = resultdao.select_month_eng(userdto.getUser_id());

					if(resultdao.check_kor(userdto.getUser_id()) == 0){
						month_kor.setKor(0);
						month_kor.setMonth(month);
						request.setAttribute("month_kor", month_kor);
					}
					if(resultdao.check_eng(userdto.getUser_id()) == 0){
						month_eng.setEng(0);
						month_eng.setMonth(month);
						request.setAttribute("month_eng", month_eng);
					}

					//세 과목 모두 성적이 있으면 값 지정
					request.setAttribute("month_kor", month_kor);
					request.setAttribute("month_eng", month_eng);

					//한달전
					result_kor_dto month_kor_1 = resultdao.select_month_kor_1(userdto.getUser_id());
					result_eng_dto month_eng_1 = resultdao.select_month_eng_1(userdto.getUser_id());
					result_math_dto month_math_1 = resultdao.select_month_math_1(userdto.getUser_id());

					if(resultdao.check_kor_1(userdto.getUser_id()) == 0){
						month_kor_1.setKor(0);
						month_kor_1.setMonth(month);
						request.setAttribute("month_kor_1", month_kor_1);
					}
					if(resultdao.check_eng_1(userdto.getUser_id()) == 0){
						month_eng_1.setEng(0);
						month_eng_1.setMonth(month);
						request.setAttribute("month_eng_1", month_eng_1);
					}
					if(resultdao.check_math_1(userdto.getUser_id()) == 0){
						month_math_1.setMath(0);
						month_math_1.setMonth(month);
						request.setAttribute("month_math_1", month_math_1);
					}

					request.setAttribute("month_kor_1", month_kor_1);
					request.setAttribute("month_eng_1", month_eng_1);
					request.setAttribute("month_math_1", month_math_1);

					//두달전
					result_kor_dto month_kor_2 = resultdao.select_month_kor_2(userdto.getUser_id());
					result_eng_dto month_eng_2 = resultdao.select_month_eng_2(userdto.getUser_id());
					result_math_dto month_math_2 = resultdao.select_month_math_2(userdto.getUser_id());

					if(resultdao.check_kor_2(userdto.getUser_id()) == 0){
						month_kor_2.setKor(0);
						month_kor_2.setMonth(month);
						request.setAttribute("month_kor_2", month_kor_2);
					}
					if(resultdao.check_eng_2(userdto.getUser_id()) == 0){
						month_eng_2.setEng(0);
						month_eng_2.setMonth(month);
						request.setAttribute("month_eng_2", month_eng_2);
					}
					if(resultdao.check_math_2(userdto.getUser_id()) == 0){
						month_math_2.setMath(0);
						month_math_2.setMonth(month);
						request.setAttribute("month_math_2", month_math_2);
					}

					request.setAttribute("month_kor_2", month_kor_2);
					request.setAttribute("month_eng_2", month_eng_2);
					request.setAttribute("month_math_2", month_math_2);
					dispatch("mypage/mypage_checkscore.jsp",request,response);
				}
			}
		}


		if(command.equals("eng_first")){
			int user_no = Integer.parseInt(request.getParameter("user_no"));

			userdto = userdao.selectuser(user_no);

			if(userdto.getGrade() == 1){
				dispatch("munjae/eng_1_alphabet.jsp", request, response);
			}else if (userdto.getGrade() == 2){
				dispatch("munjae/eng_2_alphabet.jsp", request, response);
			}else if (userdto.getGrade() == 3){
				dispatch("munjae/eng_3_alphabet.jsp", request, response);
			}
		}else if(command.equals("eng_second")){
			int user_no = Integer.parseInt(request.getParameter("user_no"));
			int correct = Integer.parseInt(request.getParameter("correct"));

			userdto = userdao.selectuser(user_no);

			if(userdto.getGrade() == 1){
				request.setAttribute("correct", correct);
				dispatch("munjae/eng_1_word.jsp", request, response);
			}else if (userdto.getGrade() == 2){
				request.setAttribute("correct", correct);
				dispatch("munjae/eng_2_word.jsp", request, response);
			}else if (userdto.getGrade() == 3){
				request.setAttribute("correct", correct);
				dispatch("munjae/eng_3_word.jsp", request, response);
			}
		}else if(command.equals("eng_third")){
			int user_no = Integer.parseInt(request.getParameter("user_no"));
			int correct = Integer.parseInt(request.getParameter("correct"));

			userdto = userdao.selectuser(user_no);

			if(userdto.getGrade() == 1){
				request.setAttribute("correct", correct);
				dispatch("munjae/eng_1_a_picture_puzzle.jsp", request, response);
			}else if (userdto.getGrade() == 2){
				request.setAttribute("correct", correct);
				dispatch("munjae/eng_2_a_picture_puzzle.jsp", request, response);
			}else if (userdto.getGrade() == 3){
				request.setAttribute("correct", correct);
				dispatch("munjae/eng_3_a_picture_puzzle.jsp", request, response);
			}
		}else if(command.equals("eng_final")){
			int user_no = Integer.parseInt(request.getParameter("user_no"));				//유저 정보 확인용 유저 번호
			int correct = Integer.parseInt(request.getParameter("correct"));				//맞춘 개수
			int sum = Integer.parseInt(request.getParameter("sum"));						//점수
			int month = Integer.parseInt(request.getParameter("month"));					//사이트 기준 월
			int date = Integer.parseInt(request.getParameter("date"));					//사이트 기준 일

			userdto = userdao.selectuser(user_no);											//유저 정보 가져오기

			result_eng_dto eng_dto = resultdao.select_month_eng(userdto.getUser_id());		//이번달 영어 성적 가져오기

			if(userdto.getGrade() == 1){
				//이번달에 문제를 풀었으면
				if(eng_dto.getMonth() == month){
					PrintWriter writer = response.getWriter();
					writer.println("<script type='text/javascript'>alert('이번 달에 이미 문제 풀이를 했습니다.'); location.href='../mypage_controller.do?command=mypage_checkscore&user_id="+userdto.getUser_id()+"';</script>");
					writer.close();
				}else {
					eng_dto.setUser_id(userdto.getUser_id());
					eng_dto.setMonth(month);
					eng_dto.setDay(date);
					eng_dto.setEng(sum);

					resultdao.insert_eng(eng_dto);

					userdao.insert_user_point(correct, userdto.getUser_id());
					userdao.insert_user_star(correct, userdto.getUser_id());

					result_eng_dto month_eng = resultdao.select_month_eng(userdto.getUser_id());
					request.setAttribute("month_eng", month_eng);

					userdto = userdao.selectuser(user_no);
					session.setAttribute("userdto", userdto);

					LocalDate now = LocalDate.now();

					//이번달
					result_kor_dto month_kor = resultdao.select_month_kor(userdto.getUser_id());
					result_math_dto month_math = resultdao.select_month_math(userdto.getUser_id());

					if(resultdao.check_kor(userdto.getUser_id()) == 0){
						month_kor.setKor(0);
						month_kor.setMonth(month);
						request.setAttribute("month_kor", month_kor);
					}
					if(resultdao.check_math(userdto.getUser_id()) == 0){
						month_math.setMath(0);
						month_math.setMonth(month);
						request.setAttribute("month_math", month_math);
					}

					//세 과목 모두 성적이 있으면 값 지정
						request.setAttribute("month_kor", month_kor);
						request.setAttribute("month_math", month_math);

					//한달전
					result_kor_dto month_kor_1 = resultdao.select_month_kor_1(userdto.getUser_id());
					result_eng_dto month_eng_1 = resultdao.select_month_eng_1(userdto.getUser_id());
					result_math_dto month_math_1 = resultdao.select_month_math_1(userdto.getUser_id());

					if(resultdao.check_kor_1(userdto.getUser_id()) == 0){
						month_kor_1.setKor(0);
						month_kor_1.setMonth(month);
						request.setAttribute("month_kor_1", month_kor_1);
					}
					if(resultdao.check_eng_1(userdto.getUser_id()) == 0){
						month_eng_1.setEng(0);
						month_eng_1.setMonth(month);
						request.setAttribute("month_eng_1", month_eng_1);
					}
					if(resultdao.check_math_1(userdto.getUser_id()) == 0){
						month_math_1.setMath(0);
						month_math_1.setMonth(month);
						request.setAttribute("month_math_1", month_math_1);
					}

					if(month_kor_1.getMonth() == (month-1) || month_eng_1.getMonth() == (month-1) || month_math_1.getMonth() == (month-1)) {
						request.setAttribute("month_kor_1", month_kor_1);
						request.setAttribute("month_eng_1", month_eng_1);
						request.setAttribute("month_math_1", month_math_1);
					}

					//두달전
					result_kor_dto month_kor_2 = resultdao.select_month_kor_2(userdto.getUser_id());
					result_eng_dto month_eng_2 = resultdao.select_month_eng_2(userdto.getUser_id());
					result_math_dto month_math_2 = resultdao.select_month_math_2(userdto.getUser_id());

					if(resultdao.check_kor_2(userdto.getUser_id()) == 0){
						month_kor_2.setKor(0);
						month_kor_2.setMonth(month);
						request.setAttribute("month_kor_2", month_kor_2);
					}
					if(resultdao.check_eng_2(userdto.getUser_id()) == 0){
						month_eng_2.setEng(0);
						month_eng_2.setMonth(month);
						request.setAttribute("month_eng_2", month_eng_2);
					}
					if(resultdao.check_math_2(userdto.getUser_id()) == 0){
						month_math_2.setMath(0);
						month_math_2.setMonth(month);
						request.setAttribute("month_math_2", month_math_2);
					}

						request.setAttribute("month_kor_2", month_kor_2);
						request.setAttribute("month_eng_2", month_eng_2);
						request.setAttribute("month_math_2", month_math_2);
					dispatch("mypage/mypage_checkscore.jsp",request,response);
				}
			}else if(userdto.getGrade() == 2){
				//이번달에 문제를 풀었으면
				if(eng_dto.getMonth() == month){
					PrintWriter writer = response.getWriter();
					writer.println("<script type='text/javascript'>alert('이번 달에 이미 문제 풀이를 했습니다.'); location.href='../mypage_controller.do?command=mypage_checkscore&user_id="+userdto.getUser_id()+"';</script>");
					writer.close();
				}else {
					eng_dto.setUser_id(userdto.getUser_id());
					eng_dto.setMonth(month);
					eng_dto.setDay(date);
					eng_dto.setEng(sum);

					resultdao.insert_eng(eng_dto);

					userdao.insert_user_point(correct, userdto.getUser_id());
					userdao.insert_user_star(correct, userdto.getUser_id());

					result_eng_dto month_eng = resultdao.select_month_eng(userdto.getUser_id());
					request.setAttribute("month_eng", month_eng);

					userdto = userdao.selectuser(user_no);
					session.setAttribute("userdto", userdto);

					LocalDate now = LocalDate.now();

					//이번달
					result_kor_dto month_kor = resultdao.select_month_kor(userdto.getUser_id());
					result_math_dto month_math = resultdao.select_month_math(userdto.getUser_id());

					if(resultdao.check_kor(userdto.getUser_id()) == 0){
						month_kor.setKor(0);
						month_kor.setMonth(month);
						request.setAttribute("month_kor", month_kor);
					}
					if(resultdao.check_math(userdto.getUser_id()) == 0){
						month_math.setMath(0);
						month_math.setMonth(month);
						request.setAttribute("month_math", month_math);
					}

					//세 과목 모두 성적이 있으면 값 지정
						request.setAttribute("month_kor", month_kor);
						request.setAttribute("month_math", month_math);

					//한달전
					result_kor_dto month_kor_1 = resultdao.select_month_kor_1(userdto.getUser_id());
					result_eng_dto month_eng_1 = resultdao.select_month_eng_1(userdto.getUser_id());
					result_math_dto month_math_1 = resultdao.select_month_math_1(userdto.getUser_id());

					if(resultdao.check_kor_1(userdto.getUser_id()) == 0){
						month_kor_1.setKor(0);
						month_kor_1.setMonth(month);
						request.setAttribute("month_kor_1", month_kor_1);
					}
					if(resultdao.check_eng_1(userdto.getUser_id()) == 0){
						month_eng_1.setEng(0);
						month_eng_1.setMonth(month);
						request.setAttribute("month_eng_1", month_eng_1);
					}
					if(resultdao.check_math_1(userdto.getUser_id()) == 0){
						month_math_1.setMath(0);
						month_math_1.setMonth(month);
						request.setAttribute("month_math_1", month_math_1);
					}

						request.setAttribute("month_kor_1", month_kor_1);
						request.setAttribute("month_eng_1", month_eng_1);
						request.setAttribute("month_math_1", month_math_1);

					//두달전
					result_kor_dto month_kor_2 = resultdao.select_month_kor_2(userdto.getUser_id());
					result_eng_dto month_eng_2 = resultdao.select_month_eng_2(userdto.getUser_id());
					result_math_dto month_math_2 = resultdao.select_month_math_2(userdto.getUser_id());

					if(resultdao.check_kor_2(userdto.getUser_id()) == 0){
						month_kor_2.setKor(0);
						month_kor_2.setMonth(month);
						request.setAttribute("month_kor_2", month_kor_2);
					}
					if(resultdao.check_eng_2(userdto.getUser_id()) == 0){
						month_eng_2.setEng(0);
						month_eng_2.setMonth(month);
						request.setAttribute("month_eng_2", month_eng_2);
					}
					if(resultdao.check_math_2(userdto.getUser_id()) == 0){
						month_math_2.setMath(0);
						month_math_2.setMonth(month);
						request.setAttribute("month_math_2", month_math_2);
					}

						request.setAttribute("month_kor_2", month_kor_2);
						request.setAttribute("month_eng_2", month_eng_2);
						request.setAttribute("month_math_2", month_math_2);
					dispatch("mypage/mypage_checkscore.jsp",request,response);
				}
			}else if(userdto.getGrade() == 3){
				//이번달에 문제를 풀었으면
				if(eng_dto.getMonth() == month){
					PrintWriter writer = response.getWriter();
					writer.println("<script type='text/javascript'>alert('이번 달에 이미 문제 풀이를 했습니다.'); location.href='../mypage_controller.do?command=mypage_checkscore&user_id="+userdto.getUser_id()+"';</script>");
					writer.close();
				}else {
					eng_dto.setUser_id(userdto.getUser_id());
					eng_dto.setMonth(month);
					eng_dto.setDay(date);
					eng_dto.setEng(sum);

					resultdao.insert_eng(eng_dto);

					userdao.insert_user_point(correct, userdto.getUser_id());
					userdao.insert_user_star(correct, userdto.getUser_id());

					result_eng_dto month_eng = resultdao.select_month_eng(userdto.getUser_id());
					request.setAttribute("month_eng", month_eng);

					userdto = userdao.selectuser(user_no);
					session.setAttribute("userdto", userdto);

					LocalDate now = LocalDate.now();

					//이번달
					result_kor_dto month_kor = resultdao.select_month_kor(userdto.getUser_id());
					result_math_dto month_math = resultdao.select_month_math(userdto.getUser_id());

					if(resultdao.check_kor(userdto.getUser_id()) == 0){
						month_kor.setKor(0);
						month_kor.setMonth(month);
						request.setAttribute("month_kor", month_kor);
					}
					if(resultdao.check_math(userdto.getUser_id()) == 0){
						month_math.setMath(0);
						month_math.setMonth(month);
						request.setAttribute("month_math", month_math);
					}

					//세 과목 모두 성적이 있으면 값 지정
						request.setAttribute("month_kor", month_kor);
						request.setAttribute("month_math", month_math);

					//한달전
					result_kor_dto month_kor_1 = resultdao.select_month_kor_1(userdto.getUser_id());
					result_eng_dto month_eng_1 = resultdao.select_month_eng_1(userdto.getUser_id());
					result_math_dto month_math_1 = resultdao.select_month_math_1(userdto.getUser_id());

					if(resultdao.check_kor_1(userdto.getUser_id()) == 0){
						month_kor_1.setKor(0);
						month_kor_1.setMonth(month);
						request.setAttribute("month_kor_1", month_kor_1);
					}
					if(resultdao.check_eng_1(userdto.getUser_id()) == 0){
						month_eng_1.setEng(0);
						month_eng_1.setMonth(month);
						request.setAttribute("month_eng_1", month_eng_1);
					}
					if(resultdao.check_math_1(userdto.getUser_id()) == 0){
						month_math_1.setMath(0);
						month_math_1.setMonth(month);
						request.setAttribute("month_math_1", month_math_1);
					}

						request.setAttribute("month_kor_1", month_kor_1);
						request.setAttribute("month_eng_1", month_eng_1);
						request.setAttribute("month_math_1", month_math_1);

					//두달전
					result_kor_dto month_kor_2 = resultdao.select_month_kor_2(userdto.getUser_id());
					result_eng_dto month_eng_2 = resultdao.select_month_eng_2(userdto.getUser_id());
					result_math_dto month_math_2 = resultdao.select_month_math_2(userdto.getUser_id());

					if(resultdao.check_kor_2(userdto.getUser_id()) == 0){
						month_kor_2.setKor(0);
						month_kor_2.setMonth(month);
						request.setAttribute("month_kor_2", month_kor_2);
					}
					if(resultdao.check_eng_2(userdto.getUser_id()) == 0){
						month_eng_2.setEng(0);
						month_eng_2.setMonth(month);
						request.setAttribute("month_eng_2", month_eng_2);
					}
					if(resultdao.check_math_2(userdto.getUser_id()) == 0){
						month_math_2.setMath(0);
						month_math_2.setMonth(month);
						request.setAttribute("month_math_2", month_math_2);
					}

						request.setAttribute("month_kor_2", month_kor_2);
						request.setAttribute("month_eng_2", month_eng_2);
						request.setAttribute("month_math_2", month_math_2);
					dispatch("mypage/mypage_checkscore.jsp",request,response);
				}
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
