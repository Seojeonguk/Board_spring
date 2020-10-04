package com.example.user.Service;

public interface UserService {
	public UserVO user_select_vo(UserVO vo) throws Exception;
	public int user_insert(UserVO vo) throws Exception;
	public int user_delete(String id) throws Exception;
	public int user_update(UserVO vo) throws Exception;
}
