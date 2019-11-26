package com.sol.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sol.model.ModelLogin_Log;
import com.sol.model.ModelUser;

@Repository("daouser")
public class DaoUser implements IDaoUser {

	@Autowired
	private SqlSession session;

	
	@Override
	public int InsertUser(ModelUser user) {
        return session.insert("mapper.mysql.mapper.InsertUser", user);
	}

	@Override
	public int SelectOverlap(String ID) {
        return session.selectOne("mapper.mysql.mapper.SelectOverlap", ID);
    }

	@Override
	public ModelUser Connectivity(ModelUser user) {
		return session.selectOne("mapper.mysql.mapper.Connectivity", user);
	}

	@Override
	public int Login_log(ModelLogin_Log log) {
		return session.insert("mapper.mysql.mapper.Login_log", log);
	}

	@Override
	public ModelUser SelectPW(ModelUser user) {
		return session.selectOne("mapper.mysql.mapper.SelectPW", user);
	}

	@Override
	public List<Map<String, Object>> SelectMyShopping(Integer User_NM) {
		return session.selectList("mapper.mysql.mapper.SelectMyShopping", User_NM);
	}
}
