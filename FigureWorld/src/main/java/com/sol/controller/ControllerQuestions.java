package com.sol.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sol.model.ModelAnswer;
import com.sol.model.ModelPageMaker;
import com.sol.model.ModelQuestions;
import com.sol.service.IServiceQuestions;

@Controller
public class ControllerQuestions {

	private static final Logger logger = LoggerFactory.getLogger(ControllerQuestions.class);

	@Autowired
	IServiceQuestions svr;

	// 게시글 목록
	@RequestMapping("Figure_questions")
	public ModelAndView QuestionsList(HttpServletRequest request) {
		ModelPageMaker pagemaker = new ModelPageMaker();
		String pagenum = request.getParameter("pagenum"); // 페이지 값을 입력 받는다.
		// String contentnum = request.getParameter("contentnum"); // 한 페이지에 몇개 보일지
		String search = request.getParameter("search"); // 검색한 문자열
		String search_value = request.getParameter("search_value"); // 검색 옵션 (제목/내용/작성자)

		int cpagenum = 0;
		int ccontentnum = 10;
		if (pagenum == null) {
			cpagenum = 1;
		} else {
			cpagenum = Integer.parseInt(pagenum);// int 형으로 몇 번 페이지인지 페이지 값 형변환
			// ccontentnum = Integer.parseInt(contentnum);// int 형으로 한 페이지에 몇개 보일지 값 형변환
		}

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>(); // 게시글 담을 리스트 선언
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> searchlist = new ArrayList<String>();
		if (search != null) {
			String[] searchlist_value = search.split(" "); // 띄어쓰기 단위로 문자열 자르기
			searchlist = Arrays.asList(searchlist_value); // 배열을 리스트로 변환
		} else {
			searchlist.add("");
		}

		if (search_value != null) { // 검색옵션 확인
			if (search_value.equals("제목")) {
				map.put("Options", "Title");
			} else if (search_value.equals("내용")) {
				map.put("Options", "Questions_Content");
			} else if (search_value.equals("작성자")) {
				map.put("Options", "User_NM");
			} else {
				map.put("Options", "All");
			}
		} else {
			map.put("Options", "All");
		}

		map.put("Search", searchlist); // 검색한 문자열 리스트

		/*---------페이지 객체에 새로운 정보 다시 지정해주는 부분------------------*/
		int count = svr.QuestionsCount(map);
		if (count == 0) { // 값이 없다면 1을 입력. 1페이지만을 보여주기위함
			count = 1;
		}
		pagemaker.setTotalcount(count);// 전체 게시글 개수 지정한다
		pagemaker.setPagenum(cpagenum - 1);// 현재 페이지를 페이지 객체에 다시 지정해준다//몇번 페이지인지 PageMaker에 세팅한다
		pagemaker.setContentnum(ccontentnum);// 한 페이지에 몇개씩 보여줄지 세팅한다
		pagemaker.setCurrentblock(cpagenum);// 현재 페이지블록이 몇번인지 현재 페이지 번호를 통해서 지정한다
		pagemaker.setLastblock(pagemaker.getTotalcount());// 마지막 블록 번호를 전체 게시글 수를 통해서 정한다

		/*---------페이지 객체에 새로운 정보 다시 지정해주는 부분------------------*/
		pagemaker.prevnext(cpagenum, count);// 현재 페이지 번호로 화살표 나타낼지 결정한다
		pagemaker.setStartPage(pagemaker.getCurrentblock());// 시작페이지 번호를 현재 페이지 블록으로 정한다
		pagemaker.setEndPage(pagemaker.getLastblock(), pagemaker.getCurrentblock());
		// 현재 블록 번호와 마지막 블록 번호를 보내서 대조하고 페이지 블록의 마지막 번호를 지정한다

		map.put("Pagenum", pagemaker.getPagenum() * 10);
		map.put("Contentnum", pagemaker.getContentnum());

		list = svr.QuestionsList(map);
		// request.setAttribute("list", list);// sql로 얻은 리스트를 .jsp페이지로 전달
		// request.setAttribute("page", pagemaker);// 페이지 번호 객체 .jsp페이지로 전달

		List<Map<String, Object>> answer = new ArrayList<Map<String, Object>>();
		if(list.size() > 0) {
			answer = svr.AnswerList(list);
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("figureworld/questions/Figure_questions");
		mav.addObject("list", list);
		mav.addObject("answer", answer);
		mav.addObject("page", pagemaker);
		mav.addObject("search", search);
		mav.addObject("search_value", search_value);
		return mav;
	}

	// 글쓰기
	@RequestMapping("/InsertQuestions")
	public String InsertQuestions(Model model, HttpServletRequest httpServletRequest) {

		ModelQuestions questions = new ModelQuestions();
		questions.setUser_NM(Integer.parseInt(httpServletRequest.getParameter("User_NM")));
		questions.setTitle(httpServletRequest.getParameter("title"));
		questions.setQuestions_Content(httpServletRequest.getParameter("content"));

		String str = String.valueOf(httpServletRequest.getParameter("secret"));

		if (str.equals("on")) {
			questions.setSecret(true);
		} else {
			questions.setSecret(false);
		}

		int result = svr.InsertQuestions(questions);

		if (result == 1) {
			return "redirect:Figure_questions";
		} else {
			return "redirect:Figure_writing";
		}
	}

	// 상세정보
	@RequestMapping(value = "Questions_info", method = RequestMethod.GET)
	public ModelAndView Questions_info(int Questions_NM, String name, HttpServletRequest httpServletRequest,
			HttpSession session) throws Exception {

		ModelQuestions questions = svr.SelectQuestions(Questions_NM);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("questions", questions);
		map.put("name", name);

		int result = svr.InquiryUp(Questions_NM, session); // 조회수 증가

		ModelAndView mav = new ModelAndView();
		mav.setViewName("figureworld/questions/Figure_questions_info");
		mav.addObject("map", map);

		return mav;
	}

	// 관리자 답글 상세정보
	@RequestMapping(value = "Answer_info", method = RequestMethod.GET)
	public ModelAndView Answer_info(int Questions_NM, String name, HttpServletRequest httpServletRequest,
			HttpSession session) throws Exception {

		Map<String, Object> map = svr.AnswerInfo(Questions_NM);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("figureworld/questions/Figure_answer_info");
		mav.addObject("map", map);

		return mav;
	}

	// 수정 페이지
	@RequestMapping(value = "Questions_update", method = RequestMethod.GET)
	public ModelAndView Questions_update(int Questions_NM, String name, HttpServletRequest httpServletRequest,
			HttpSession session) throws Exception {

		ModelQuestions questions = svr.SelectQuestions(Questions_NM);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("questions", questions);
		map.put("name", name);

		int result = svr.InquiryUp(Questions_NM, session); // 조회수 증가

		ModelAndView mav = new ModelAndView();
		mav.setViewName("figureworld/questions/Figure_update");
		mav.addObject("map", map);

		return mav;
	}

	// 수정 업데이트
	@RequestMapping(value = "Questions_update_writing", method = RequestMethod.POST)
	public String Questions_update_Writing(int Questions_NM, HttpServletRequest httpServletRequest) throws Exception {

		ModelQuestions questions = new ModelQuestions();

		questions.setQuestions_NM(Questions_NM);
		questions.setTitle(httpServletRequest.getParameter("title"));
		questions.setQuestions_Content(httpServletRequest.getParameter("content"));

		String str = String.valueOf(httpServletRequest.getParameter("secret"));
		if (str.equals("on")) {
			questions.setSecret(true);
		} else {
			questions.setSecret(false);
		}

		int result = svr.QuestionsUpdate(questions); // 게시글 업데이트

		if (result == 1) {
			return "redirect:Figure_questions";
		} else {
			return "redirect:Questions_update";
		}
	}

	// 게시글 삭제
	@RequestMapping(value = "Questions_delete", method = RequestMethod.GET)
	public String Questions_delete(int Questions_NM, HttpServletRequest httpServletRequest) throws Exception {

		ModelQuestions questions = new ModelQuestions();

		questions.setQuestions_NM(Questions_NM);

		int result = svr.QuestionsDelete(questions); // 게시글 삭제

		if (result == 1) {
			return "redirect:Figure_questions";
		} else {
			return "redirect:Questions_info";
		}
	}

	// 문의사항 답변 페이지
	@RequestMapping(value = "/Figure_AnswerWriting", method = RequestMethod.GET)
	public ModelAndView InsertQuestions(int Questions_NM, String name, HttpServletRequest httpServletRequest,
			HttpSession session) {

		ModelQuestions questions = svr.SelectQuestions(Questions_NM);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("questions", questions);
		map.put("name", name);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("figureworld/questions/Figure_answer");
		mav.addObject("map", map);

		return mav;
	}

	// 문의사항 답변
	@RequestMapping(value = "/InsertAnswer", method = RequestMethod.POST)
	public String InsertAnswer(int Questions_NM, HttpServletRequest httpServletRequest, HttpSession session) {

		ModelAnswer answer = new ModelAnswer();

		answer.setUser_NM(Integer.parseInt(httpServletRequest.getParameter("User_NM")));
		answer.setQuestions_NM(Questions_NM);
		answer.setAnswer_Content(httpServletRequest.getParameter("answer"));

		int result = svr.InsertAnswer(answer);

		if (result == 1) {
			return "redirect:Figure_questions";
		} else {
			return "redirect:Figure_AnswerWriting";
		}
	}

	// 게시글 작성 페이지
	@RequestMapping(value = "/Figure_writing", method = RequestMethod.GET)
	public String QuestionsWriting(Locale locale, Model model) {

		return "figureworld/questions/Figure_writing";
	}
}
