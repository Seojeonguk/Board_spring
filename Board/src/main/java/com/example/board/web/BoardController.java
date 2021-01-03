package com.example.board.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.board.Service.BoardService;
import com.example.board.Service.BoardVO;
import com.example.board.Service.CommentService;
import com.example.board.Service.CommentVO;
import com.example.util.util;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BoardController {

	@Autowired
	BoardService boardService;
	
	@Autowired
	CommentService commentService;
	
	@RequestMapping(value="/board/index.do")
	public String board_index() throws Exception {
		return "board/index";
	}
	
	@RequestMapping(value="/board/main.do")
	public String mainpage() throws Exception {
		return "board/main";	
	}
	
	@RequestMapping(value="/board/main_list.do")
	public String list(@ModelAttribute("BoardVO")BoardVO vo,Model model,HttpSession session) throws Exception {
		List<BoardVO> list = boardService.listAll(vo);
		model.addAttribute("BoardList",list);
		model.addAttribute("Page",vo);
		return "board/list";
	}
	
	@RequestMapping(value="/board/main_write.do")
	public String Write(@ModelAttribute("BoardVO")BoardVO vo,Model model,HttpSession session,HttpServletRequest request) throws Exception {
		util util = new util();
		
		String cmd = util.null_chk(request.getParameter("cmd"), "");
		if(cmd.equals("modify")) {
			vo = boardService.select_vo(vo);
			model.addAttribute("BoardVO", vo);
		}
		return "board/write";
	}
	
	
	@RequestMapping(value="/board/writeAjax.do",method=RequestMethod.POST)
	public ModelAndView writeAjax(@ModelAttribute("BoardVO") BoardVO vo) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		try {
			boardService.insert(vo);
			
			mv.addObject("success",true);
			mv.addObject("board_number", vo.getBoard_number());
		} catch(Exception e) {
			mv.addObject("success",false);
		}
		return mv;
	}
	
	@RequestMapping(value="/board/modifyAjax.do",method=RequestMethod.POST)
	public ModelAndView modifyAjax(@ModelAttribute("BoardVO") BoardVO vo) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		try {
			boardService.modify(vo);
			
			mv.addObject("success",true);
			mv.addObject("board_number", vo.getBoard_number());
		} catch(Exception e) {
			mv.addObject("success",false);
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping(value="/board/main_view.do")
	public String view(@ModelAttribute("BoardVO") BoardVO vo,
			@ModelAttribute("CommentVO") CommentVO co_vo,
			Model model) throws Exception {
		vo = boardService.select_vo(vo);
		boardService.update_viewcnt(vo);
		List<?> comment_list= commentService.listAll(co_vo);
		int comment_list_size = comment_list.size();
		model.addAttribute("comment_list",comment_list);
		model.addAttribute("resultVO",vo);
		model.addAttribute("comment_count", comment_list_size);
		return "board/view";
	}
	
	@RequestMapping(value="/board/deleteAjax.do",method=RequestMethod.POST)
	public ModelAndView deleteAjax(@ModelAttribute("BoardVO")BoardVO vo) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		try {
			boardService.delete(vo);
			
			mv.addObject("success",true);
		} catch(Exception e) {
			mv.addObject("success",false);
		}
		
		return mv;
	}
	
	@RequestMapping(value="/board/comment_reg.do",method=RequestMethod.POST)
	public ModelAndView comment_reg(@ModelAttribute("CommentVO")CommentVO vo) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		try {
			commentService.insert(vo);
			
			mv.addObject("success", true);
		} catch(Exception e) {
			mv.addObject("success", false);
		}
		return mv;
	}
	
	@RequestMapping(value="/board/comment_delete.do")
	public ModelAndView comment_delete(@ModelAttribute("CommentVO")CommentVO vo) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		try {
			commentService.delete(vo);
			
			mv.addObject("success",true);
		}catch (Exception e) {
			mv.addObject("success",false);
		}
		
		return mv;
	}
}
