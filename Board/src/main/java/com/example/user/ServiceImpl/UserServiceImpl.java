package com.example.user.ServiceImpl;

import java.util.Calendar;

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
	
	@Override
	public int user_delete(String id) throws Exception {
		return userDAO.user_delete(id);
	}
	
	@Override
	public int user_update(UserVO vo) throws Exception {
		vo.setBirth(vo.getBirth_year()+vo.getBirth_month()+vo.getBirth_day());
		
		int now = Calendar.getInstance().get(Calendar.YEAR);
		vo.setAge(now-Integer.parseInt(vo.getBirth_year())+1);
		
		return userDAO.user_update(vo);
	}
}
