package com.sol.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sol.model.ModelAnswer;
import com.sol.model.ModelQuestions;


@Repository("daoquestions")
public class DaoQuestions implements IDaoQuestions {

	@Autowired
	private SqlSession session;

	@Override
	public List<Map<String, Object>> QuestionsList(Map<String, Object> map) {
		return session.selectList("mapper.mysql.mapper.QuestionsList", map);
	}
	
	@Override
	public int QuestionsCount(Map<String, Object> map) {
		return session.selectOne("mapper.mysql.mapper.QuestionsCount", map);
	}

	@Override
	public int InsertQuestions(ModelQuestions questions) {
		return session.insert("mapper.mysql.mapper.InsertQuestions", questions);
	}

	@Override
	public int InquiryUp(int Questions_NM, HttpSession test) {
		return session.update("mapper.mysql.mapper.InquiryUp", Questions_NM);
	}

	@Override
	public ModelQuestions SelectQuestions(int Questions_NM) {
		return session.selectOne("mapper.mysql.mapper.SelectQuestions", Questions_NM);
	}

	@Override
	public int QuestionsUpdate(ModelQuestions questions) {
		return session.update("mapper.mysql.mapper.QuestionsUpdate", questions);
	}

	@Override
	public int QuestionsDelete(ModelQuestions questions) {
		return session.delete("mapper.mysql.mapper.QuestionsDelete", questions);
	}

	@Override
	public int InsertAnswer(ModelAnswer answer) {
		return session.insert("mapper.mysql.mapper.InsertAnswer", answer);
	}

	@Override
	public List<Map<String, Object>> AnswerList(List<Map<String, Object>> questions) {
		return session.selectList("mapper.mysql.mapper.AnswerList", questions);
	}

	@Override
	public Map<String, Object> AnswerInfo(Integer Questions_NM) {
		return session.selectOne("mapper.mysql.mapper.AnswerInfo", Questions_NM);
	}


}
