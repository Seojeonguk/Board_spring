package com.example.user.Web;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.user.Service.UserService;
import com.example.user.Service.UserVO;
import com.example.util.util;

@Controller
public class UserController {
	@Autowired
	UserService userService;
	
	@RequestMapping(value="/user/index.do")
	public String index(HttpServletRequest request) throws Exception {
		
		return "user/index";
	}
	
	@RequestMapping(value="/user/login.do")
	public String login(HttpSession session,HttpServletRequest request) {
		if(session != null  && session.getAttribute("id") != null) {
			return "redirect:/";
		}
		return "user/login";
	}
	
	@RequestMapping(value="/user/loginActionAjax.do")
	public ModelAndView loginActionAjax(@ModelAttribute("UserVO")UserVO vo,HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("jsonView");
		UserVO select_vo = new UserVO();
		select_vo = userService.user_select_vo(vo);
		
		if(select_vo == null) {
			mv.addObject("success",0);
			mv.addObject("error_code", 0); // 아이디 찾을 수 없음
		}
		else if(!select_vo.getPassword().equals(vo.getPassword())) {
			mv.addObject("success",0);
			mv.addObject("error_code", 1); // 비밀번호 찾을수 없음
		}
		else {
			mv.addObject("success", 1);
			HttpSession session = request.getSession(true);
			session.setAttribute("id", select_vo.getId());
			session.setAttribute("name", select_vo.getName());
		}
		
		return mv;
	}
	
	@RequestMapping(value="/user/reg.do")
	public String reg(HttpSession session,Model model,HttpServletRequest request) throws Exception {
		util util = new util();
		
		String cmd = util.null_chk(request.getParameter("cmd"), "");
		if(cmd.equals("modify")) {
			UserVO vo= new UserVO();
			vo.setId((String)session.getAttribute("id"));
			vo = userService.user_select_vo(vo);
			
			String[] array = vo.getBirth().split("-");
			
			vo.setBirth_year(array[0]);
			vo.setBirth_month(array[1]);
			vo.setBirth_day(array[2]);
			
			model.addAttribute("UserVO", vo);
		}
		
		Calendar cal = Calendar.getInstance();
		int today_year = cal.get(Calendar.YEAR);
		
		Integer[] year_array = new Integer[130];
		for(int year = today_year,index=0;year>today_year-130;year--,index++) {
			year_array[index] = year;
		}
		
		String[] month_array = new String[12];
		for(int month=1;month<=12;month++) {
			month_array[month-1] = util.Convert_From_Integer_To_2letterString(month);
		}
		
		String[] day_array = new String[31];
		for(int day=1;day<=31;day++) {
			day_array[day-1] = util.Convert_From_Integer_To_2letterString(day);
		}
		
		model.addAttribute("yearList", year_array);
		model.addAttribute("monthList", month_array);
		model.addAttribute("dayList", day_array);
		
		return "user/reg";
	}
	
	@RequestMapping(value="/user/regActionAjax.do")
	public ModelAndView regActionAjax(@ModelAttribute("UserVO")UserVO vo,HttpSession session,HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("jsonView");

		try {
			vo.setBirth(vo.getBirth_year()+vo.getBirth_month()+vo.getBirth_day());
			
			int now = Calendar.getInstance().get(Calendar.YEAR);
			vo.setAge(now-Integer.parseInt(vo.getBirth_year())+1);
			
			userService.user_insert(vo);
			
			session =request.getSession(true);
			session.setAttribute("id", vo.getId());
			session.setAttribute("name", vo.getName());
			
			mv.addObject("success", true);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	@RequestMapping(value="/user/logout.do")
	public String logout(HttpServletRequest request, HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/?pid=board&cmd=list&page=1&category=001";
	}
	
	@RequestMapping(value="/user/deleteAjax.do")
	public ModelAndView deleteAjax(HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("jsonView");
		
		try {
			userService.user_delete((String) session.getAttribute("id"));
			session.invalidate();
			
			mv.addObject("success", true);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping(value="/user/modifyActionAjax.do")
	public ModelAndView modifyActionAjax(@ModelAttribute("UserVO")UserVO vo,HttpSession session,HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("jsonView");

		try {
			vo.setBirth(vo.getBirth_year()+vo.getBirth_month()+vo.getBirth_day());
			
			int now = Calendar.getInstance().get(Calendar.YEAR);
			vo.setAge(now-Integer.parseInt(vo.getBirth_year())+1);
			
			userService.user_update(vo);
			
			session =request.getSession(true);
			session.setAttribute("id", vo.getId());
			session.setAttribute("name", vo.getName());
			
			mv.addObject("success", true);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	@RequestMapping(value="/user/reg_id_check.do")
	public ModelAndView reg_id_check(@ModelAttribute("UserVO")UserVO vo,ModelAndView mv) throws Exception {
		mv.setViewName("jsonView");
		UserVO select_vo = new UserVO();
		select_vo = userService.user_select_vo(vo);
		mv.addObject("success", 100);
		if(select_vo != null) mv.addObject("dupl", 1);
		else mv.addObject("dupl", 0);
		return mv;
	}
}
