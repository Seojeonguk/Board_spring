package com.example.user.ServiceImpl;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.example.user.Service.UserVO;

@Repository("userDAO")
public class UserDAO {
	@Inject
	private SqlSessionTemplate SqlSession;
	
	public UserVO user_select_vo(UserVO vo) throws Exception {
		return SqlSession.selectOne("user_select_vo",vo);
	}
	
	public int user_insert(UserVO vo) throws Exception {
		return SqlSession.insert("user_insert",vo);
	}
	
	public int user_delete(String id) throws Exception {
		return SqlSession.insert("user_delete",id);
	}
	
	public int user_update(UserVO vo) throws Exception {
		return SqlSession.update("user_update",vo);
	}
}
