package com.example.user.Web;

import java.io.UnsupportedEncodingException;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.user.Service.UserService;
import com.example.user.Service.UserVO;

@Controller
public class UserController {
	@Autowired
	UserService userService;
	
	@RequestMapping(value="/user/login.do")
	public String login(HttpSession session) {
		if(session != null  && session.getAttribute("id") != null) {
			return "redirect:/board/list.do?page=1";
		}
		return "user/login";
	}
	
	@RequestMapping(value="/user/loginAction.do")
	public String loginAction(@ModelAttribute("UserVO")UserVO vo,HttpServletRequest request) throws Exception {
		UserVO select_vo = new UserVO();
		select_vo=userService.user_select_vo(vo);
		
		if(select_vo == null || !select_vo.getPassword().equals(vo.getPassword())) {
			
			return "redirect:/user/login.do";
		}
		
		HttpSession session = request.getSession(true);
		session.setAttribute("id", select_vo.getId());
		
		return "redirect:/board/list.do?page=1";
	}
	
	@RequestMapping(value="/user/reg.do")
	public String reg() throws Exception {
		return "user/reg";
	}
	
	@RequestMapping(value="/user/regAction.do")
	public String regAction(@ModelAttribute("UserVO")UserVO vo,HttpSession session,HttpServletRequest request) throws Exception {
		vo.setBirth(vo.getBirth_year()+vo.getBirth_month()+vo.getBirth_day());
		int now = Calendar.getInstance().get(Calendar.YEAR);
		vo.setAge(now-Integer.parseInt(vo.getBirth_year())+1);
		userService.user_insert(vo);
		session =request.getSession(true);
		session.setAttribute("id", vo.getId());
		return "redirect:/board/list.do?page=1";
	}
	
	@RequestMapping(value="user/logout.do")
	public String logout(HttpServletRequest request, HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/user/login.do";
	}
	
	@RequestMapping(value="user/delete.do")
	public String delete(HttpServletRequest request, HttpSession session) throws Exception {
		userService.user_delete((String) session.getAttribute("id"));
		session.invalidate();
		return "redirect:/user/login.do";
	}
}
