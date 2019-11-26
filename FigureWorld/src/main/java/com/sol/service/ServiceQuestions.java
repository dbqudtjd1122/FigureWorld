package com.sol.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sol.dao.IDaoQuestions;
import com.sol.model.ModelAnswer;
import com.sol.model.ModelQuestions;

@Repository("servicequestions")
public class ServiceQuestions implements IServiceQuestions {

	// SLF4J Logging
	private static Logger logger = LoggerFactory.getLogger(ServiceQuestions.class);

	@Autowired
	IDaoQuestions dao;

	@Override
	public List<Map<String, Object>> QuestionsList(Map<String, Object> map) {
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		try {
			result = dao.QuestionsList(map);
		} catch (Exception e) {
			logger.error("QuestionsList" + e.getMessage());
			throw e;
		}
		return result;
	}
	
	@Override
	public int QuestionsCount(Map<String, Object> map) {
		int result = -1;
		try {
			result = dao.QuestionsCount(map);
		} catch (Exception e) {
			logger.error("QuestionsCount" + e.getMessage());
			throw e;
		}
		return result;
	}

	@Override
	public int InsertQuestions(ModelQuestions questions) {
		int result = -1;
		try {
			result = dao.InsertQuestions(questions);
		} catch (Exception e) {
			logger.error("InsertQuestions" + e.getMessage());
			throw e;
		}
		return result;
	}

	@Override
	public int InquiryUp(int Questions_NM, HttpSession session) { // 조회수 증가
		int result = -1;
		
		long update_time = 0;
		// 세션에 저장된 조회시간 검색
		// 최초로 조회할경우 세션에 저장된 값이 없이 때문에 if문은 실행 X
		if(session.getAttribute("update_time_"+Questions_NM) != null) {
			update_time = (long) session.getAttribute("update_time_"+Questions_NM);
		}
		// 시스템의 현재시간을 current_time에 저장
		long current_time = System.currentTimeMillis();
		// 일정시간이 경과 후 조회수 증가 처리 24*60*60*1000(24시간)
		// 시스템 현재시간 - 열람시간 > 일정시간(조회수 증가가 가능하도록 지정한 시간)
		if(current_time - update_time > 30*60*1000) { // 30분
			try {
				result = dao.InquiryUp(Questions_NM, session);
				
				// 세션에 시간을 저장 : "update_time_"+Questions_NM 는 다른변수와 중복되지 않게 명명한 것
				session.setAttribute("update_time_"+Questions_NM, current_time);
			} catch (Exception e) {
				logger.error("InquiryUp" + e.getMessage());
				throw e;
			}
		}
		return result;
	}

	@Override
	public ModelQuestions SelectQuestions(int Questions_NM) {
		ModelQuestions result = new ModelQuestions();
		try {
			result = dao.SelectQuestions(Questions_NM);
		} catch (Exception e) {
			logger.error("SelectQuestions" + e.getMessage());
			throw e;
		}
		return result;
	}

	@Override
	public int QuestionsUpdate(ModelQuestions questions) {
		int result = -1;
		try {
			result = dao.QuestionsUpdate(questions);
		} catch (Exception e) {
			logger.error("QuestionsUpdate" + e.getMessage());
			throw e;
		}
		return result;
	}

	@Override
	public int QuestionsDelete(ModelQuestions questions) {
		int result = -1;
		try {
			result = dao.QuestionsDelete(questions);
		} catch (Exception e) {
			logger.error("QuestionsDelete" + e.getMessage());
			throw e;
		}
		return result;
	}

	@Override
	public int InsertAnswer(ModelAnswer answer) {
		int result = -1;
		try {
			result = dao.InsertAnswer(answer);
		} catch (Exception e) {
			logger.error("InsertAnswer" + e.getMessage());
			throw e;
		}
		return result;
	}

	@Override
	public List<Map<String, Object>> AnswerList(List<Map<String, Object>> questions) {
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		try {
			result = dao.AnswerList(questions);
		} catch (Exception e) {
			logger.error("AnswerList" + e.getMessage());
			throw e;
		}
		return result;
	}

	@Override
	public Map<String, Object> AnswerInfo(Integer Questions_NM) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			result = dao.AnswerInfo(Questions_NM);
		} catch (Exception e) {
			logger.error("AnswerInfo" + e.getMessage());
			throw e;
		}
		return result;
	}

}
