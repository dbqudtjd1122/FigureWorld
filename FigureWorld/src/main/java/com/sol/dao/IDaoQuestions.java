package com.sol.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;

import com.sol.model.ModelAnswer;
import com.sol.model.ModelQuestions;


@Repository
public interface IDaoQuestions {

	List<Map<String, Object>> QuestionsList(Map<String, Object> map); // 목록 불러오기
	
	int QuestionsCount(Map<String, Object> map); // 문의사항 갯수
	
	int InsertQuestions(ModelQuestions questions); // 게시글 작성
	
	int InquiryUp(int Questions_NM, HttpSession session); // 문의게시글 조회수 증가
	
	ModelQuestions SelectQuestions(int Questions_NM); // 게시글 상세보기 조회
	
	int QuestionsUpdate(ModelQuestions questions); // 게시글 업데이트
	
	int QuestionsDelete(ModelQuestions questions); // 게시글 삭제
	
	int InsertAnswer(ModelAnswer answer); // 문의글 답변 작성
	
	List<Map<String, Object>> AnswerList(List<Map<String, Object>> list);  // 문의글 리스트 가져오기
	
	Map<String, Object> AnswerInfo(Integer Questions_NM); // 문의 답변 상세정보;
}
