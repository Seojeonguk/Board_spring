package com.example.board.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.board.Service.BoardService;
import com.example.board.Service.BoardVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BoardController {

	@Autowired
	BoardService boardService;
	
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
	public String Write(@ModelAttribute("BoardVO")BoardVO vo) throws Exception {
		return "board/write";
	}
	
	@RequestMapping(value="/board/main_writeAction.do",method=RequestMethod.POST)
	public String WriteAction(@ModelAttribute("BoardVO") BoardVO vo) throws Exception {
		boardService.insert(vo);
		return "redirect:/board/main_list.do?page=1&category=" + vo.getCategory();
	}
	
	@RequestMapping(value="/board/main_view.do")
	public String view(@ModelAttribute("BoardVO") BoardVO vo,Model model) throws Exception {
		vo = boardService.select_vo(vo);
		boardService.update_viewcnt(vo);
		model.addAttribute("resultVO",vo);
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
}
