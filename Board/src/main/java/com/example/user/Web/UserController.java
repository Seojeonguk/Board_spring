package com.example.user.Web;

import java.io.UnsupportedEncodingException;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.user.Service.UserService;
import com.example.user.Service.UserVO;

@Controller
public class UserController {
	@Autowired
	UserService userService;
	
	@RequestMapping(value="/user/login.do")
	public String login() {
		return "user/login";
	}
	
	@RequestMapping(value="/user/loginAction.do")
	public String loginAction(@ModelAttribute("UserVO")UserVO vo) throws Exception {
		UserVO select_vo = new UserVO();
		select_vo=userService.user_select_vo(vo);
		
		if(select_vo == null || !select_vo.getPassword().equals(vo.getPassword())) {
			return "redirect:/user/login.do";
		}
		return "redirect:/board/list.do?page=1";
	}
	
	@RequestMapping(value="/user/reg.do")
	public String reg() throws Exception {
		return "user/reg";
	}
	
	@RequestMapping(value="/user/regAction.do")
	public String regAction(@ModelAttribute("UserVO")UserVO vo) throws Exception {
		vo.setBirth(vo.getBirth_year()+vo.getBirth_month()+vo.getBirth_day());
		int now = Calendar.getInstance().get(Calendar.YEAR);
		vo.setAge(now-Integer.parseInt(vo.getBirth_year())+1);
		userService.user_insert(vo);
		return "redirect:/board/list.do?page=1";
	}
}
