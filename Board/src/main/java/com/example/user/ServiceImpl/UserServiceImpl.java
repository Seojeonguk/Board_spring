package com.example.user.ServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.user.Service.UserService;
import com.example.user.Service.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO userDAO;
	
	@Override
	public UserVO user_select_vo(UserVO vo) throws Exception {
		return userDAO.user_select_vo(vo);
	}
	
	@Override
	public int user_insert(UserVO vo) throws Exception {
		return userDAO.user_insert(vo);
	}
}
