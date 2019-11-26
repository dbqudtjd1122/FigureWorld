package com.sol.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.sol.model.ModelLogin_Log;
import com.sol.model.ModelUser;

@Repository
public interface IDaoUser {

	int InsertUser(ModelUser user); // 회원가입
	
	int SelectOverlap(String ID); // 아이디 중복확인
	
	ModelUser SelectPW(ModelUser user); // 비밀번호 가져오기
	
	ModelUser Connectivity(ModelUser user); // 로그인
	
	int Login_log(ModelLogin_Log log); // 로그인 / 로그아웃 로그
	
	List<Map<String, Object>> SelectMyShopping(Integer User_NM); // 주문내역 
}
