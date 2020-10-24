package com.example.board.web;

import java.util.List;

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

/**
 * Handles requests for the application home page.
 */
@Controller
public class BoardController {

	@Autowired
	BoardService boardService;
	
	@Autowired
	CommentService commentService;
	
	@RequestMapping(value="/board/main.do")
	public String mainpage() throws Exception {
		return "board/main";	
	}
	
	@RequestMapping(value="/board/main_list.do")
	public String list(@ModelAttribute("BoardVO")BoardVO vo,Model model,HttpSession session) throws Exception {
		vo.setStartpage((vo.getPage()-1)*vo.getPerpagenum());
		vo.setTotalcount(boardService.list_count(vo));
		vo.setCalPage(vo.getPerpagenum(),vo.getTotalcount());
		List<BoardVO> list = boardService.listAll(vo);
		model.addAttribute("BoardList",list);
		return "board/list";
	}
	
	@RequestMapping(value="/board/main_write.do")
	public String Write(@ModelAttribute("BoardVO")BoardVO vo,HttpSession session) throws Exception {
		return "board/write";
	}
	
	@RequestMapping(value="/board/main_writeAction.do",method=RequestMethod.POST)
	public String WriteAction(@ModelAttribute("BoardVO") BoardVO vo) throws Exception {
		boardService.insert(vo);
		return "redirect:/board/main_list.do?page=1&category=" + vo.getCategory();
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
	
	
	@RequestMapping(value="/board/main_modify.do",method=RequestMethod.POST)
	public String modify(@ModelAttribute("BoardVO") BoardVO vo,Model model) throws Exception {
		return "board/modify";
	}
	
	
	
	@RequestMapping(value="/board/main_modifyAction.do", method=RequestMethod.POST)
	public String modifyAction(@ModelAttribute("BoardVO")BoardVO vo) throws Exception {
		boardService.modify(vo);
		return "redirect:/board/main_list.do?page=1&category="+vo.getCategory();
	}
	
	@RequestMapping(value="/board/main_delete.do",method=RequestMethod.POST)
	public String delete(@ModelAttribute("BoardVO")BoardVO vo) throws Exception {
		boardService.delete(vo);
		return "redirect:/board/main_list.do?page=1&category=001";
	}
	
	@RequestMapping(value="/board/comment_reg.do",method=RequestMethod.POST)
	public ModelAndView comment_reg(@ModelAttribute("CommentVO")CommentVO vo) throws Exception {
		commentService.insert(vo);
		ModelAndView mv = new ModelAndView("jsonView");
		mv.addObject("success", true);
		return mv;
	}
	
	@RequestMapping(value="/board/comment_delete.do")
	public ModelAndView comment_delete(@ModelAttribute("CommentVO")CommentVO vo) throws Exception {
		commentService.delete(vo);
		ModelAndView mv = new ModelAndView("jsonView");
		mv.addObject("success",true);
		return mv;
	}
}
