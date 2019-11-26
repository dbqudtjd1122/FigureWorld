package com.sol.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sol.model.ModelLogin_Log;
import com.sol.model.ModelUser;
import com.sol.service.IServiceUser;

@Controller
public class ControllerUser {

	private static final Logger logger = LoggerFactory.getLogger(ControllerUser.class);

	@Autowired
	IServiceUser svr;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

	// 회원가입
	@RequestMapping(value = "/insert_membership", method = RequestMethod.POST)
	public String figure_main(Locale locale, Model model, HttpServletRequest httpServletRequest) throws ParseException {
		ModelUser user = new ModelUser();
		System.out.println(httpServletRequest);

		user.setID(httpServletRequest.getParameter("ID"));
		user.setRating("소비자");
		user.setPW(httpServletRequest.getParameter("PW"));
		user.setPW_Check1(httpServletRequest.getParameter("PW_Check1"));
		user.setPW_Check2(httpServletRequest.getParameter("PW_Check2"));
		user.setNAME(httpServletRequest.getParameter("NAME"));
		user.setPostal_code(httpServletRequest.getParameter("Postal_code"));
		user.setOld_addr(httpServletRequest.getParameter("Old_addr"));
		user.setNew_addr(httpServletRequest.getParameter("New_addr"));
		user.setDetail_addr(httpServletRequest.getParameter("Detail_addr"));

		String mPhone = httpServletRequest.getParameter("Phone1");
		mPhone += httpServletRequest.getParameter("Phone2");
		mPhone += httpServletRequest.getParameter("Phone3");
		user.setPhone(mPhone);

		String mEmail = httpServletRequest.getParameter("Email1");
		mEmail += "@";
		mEmail += httpServletRequest.getParameter("Email2");
		user.setEmail(mEmail);

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String mbirth = httpServletRequest.getParameter("Birth1");
		mbirth += "-";
		mbirth += httpServletRequest.getParameter("Birth2");
		mbirth += "-";
		mbirth += httpServletRequest.getParameter("Birth3");

		user.setBirth(transFormat.parse(mbirth));

		System.out.println(user);

		int result = svr.InsertUser(user);

		if (result == 1) {
			return "figureworld/Figure_main";
		} else {
			return "redirect:/Figure_membership";
		}
	}

	// 아이디 중복확인
	@RequestMapping(value = "/ID_Overlap", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> ID_Overlap(ModelUser user) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();

		String ID = user.getID();
		int Count = svr.SelectOverlap(ID);
		map.put("id", ID);
		map.put("Count", Count);

		return map;
	}

	// 로그인
	@RequestMapping(value = "/Login_connectivity", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> Login_connectivity(ModelUser user, HttpServletRequest httpServletRequest,
			HttpSession session) {

		Map<String, Object> map = new HashMap<String, Object>();
		ModelUser result = svr.Connectivity(user);
		/* session.invalidate(); // 세션값 모두 삭제 */
		// session.removeAttribute("Login_ID"); // 세션값 하나삭제

		if (result != null) {
			session.setAttribute("Login_ID", result.getID().toString());
			session.setAttribute("Login_NM", result.getUser_NM());
			session.setAttribute("Login_NAME", result.getNAME().toString());
			session.setAttribute("Login_Rating", result.getRating().toString());

			ModelLogin_Log log = new ModelLogin_Log();
			log.setUser_NM(result.getUser_NM());
			log.setLog_InOut("로그인");
			svr.Login_log(log);

			map.put("Count", 1);
		} else {
			map.put("Count", 0);
		}
		map.put("User", result);

		return map;
	}

	// 로그아웃
	@RequestMapping(value = "/Logout_connectivity", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> Logout_connectivity(HttpSession session, HttpServletRequest httpServletRequest) {

		ModelLogin_Log log = new ModelLogin_Log();

		log.setUser_NM((Integer) session.getAttribute("Login_NM"));
		log.setLog_InOut("로그아웃");
		int result = svr.Login_log(log);

		if (result == 1) {
			// session.invalidate(); // 세션값 모두 삭제
			session.removeAttribute("Login_ID"); // 세션값 하나삭제
			session.removeAttribute("Login_NM");
			session.removeAttribute("Login_NAME");
		}

		Map<String, Object> map = new HashMap<String, Object>();
		return map;
	}
	
	// 마이 페이지
	@RequestMapping(value = "/Figure_myshopping", method = RequestMethod.POST)
	public ModelAndView Figure_MyShopping(ModelUser user) {

		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		list = svr.SelectMyShopping(user.getUser_NM());
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("figureworld/user/Figure_myshopping");
		mav.addObject("list", list);
		
		return mav;
	}

	// 메인 홈페이지
	@RequestMapping(value = "/Figure_main", method = RequestMethod.GET)
	public String figure_main() {

		return "figureworld/Figure_main";
	}

	// 회원가입 페이지
	@RequestMapping(value = "/Figure_membership", method = RequestMethod.GET)
	public String Figure_membership() {

		return "figureworld/user/Figure_membership";
	}

	// 로그인 페이지
	@RequestMapping(value = "/Figure_login", method = RequestMethod.GET)
	public String Figure_login() {

		return "figureworld/user/Figure_login";
	}

}
