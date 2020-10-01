package com.example.board.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.board.Service.BoardService;
import com.example.board.Service.BoardVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BoardController {

	@Autowired
	BoardService boardService;
	
	@RequestMapping(value="/board/list.do")
	public String list(@ModelAttribute("BoardVO")BoardVO vo,Model model) throws Exception {
		vo.setPerpagenum(10);
		vo.setStartpage((vo.getPage()-1)*vo.getPerpagenum());
		List<BoardVO> list = boardService.listAll(vo);
		
		model.addAttribute("BoardList",list);
		return "board/list";
	}
	
	@RequestMapping(value="/board/write.do")
	public String Write() throws Exception {
		return "board/write";
	}
	
	@RequestMapping(value="/board/writeAction.do",method=RequestMethod.POST)
	public String WriteAction(@ModelAttribute("BoardVO") BoardVO vo) throws Exception {
		boardService.insert(vo);
		return "redirect:/board/list.do";
	}
	
	@RequestMapping(value="/board/view.do")
	public String view(@ModelAttribute("BoardVO") BoardVO vo,Model model) throws Exception {
		vo = boardService.select_vo(vo);
		boardService.update_viewcnt(vo);
		model.addAttribute("resultVO",vo);
		return "board/view";
	}
	
	@RequestMapping(value="/board/modify.do",method=RequestMethod.POST)
	public String modify(@ModelAttribute("BoardVO") BoardVO vo,Model model) throws Exception {
		
		
		return "board/modify";
	}
	
	@RequestMapping(value="/board/modifyAction.do", method=RequestMethod.POST)
	public String modifyAction(@ModelAttribute("BoardVO")BoardVO vo) throws Exception {
		boardService.modify(vo);
		return "redirect:/board/list.do";
	}
	
	@RequestMapping(value="/board/delete.do",method=RequestMethod.POST)
	public String delete(@ModelAttribute("BoardVO")BoardVO vo) throws Exception {
		boardService.delete(vo);
		return "redirect:/board/list.do";
	}
}
