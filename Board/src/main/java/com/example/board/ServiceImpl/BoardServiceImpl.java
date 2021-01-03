package com.example.board.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.board.Service.BoardService;
import com.example.board.Service.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;

	@Override
	public List<BoardVO> listAll(BoardVO vo) throws Exception {
		vo.setTotalcount(boardDAO.list_count(vo));
		vo.setCalPage(vo.getPerpagenum(),vo.getTotalcount());
		return boardDAO.listAll(vo);
	}

	@Override
	public int insert(BoardVO vo) throws Exception {
		return boardDAO.insert(vo);
	}
	
	@Override
	public BoardVO select_vo(BoardVO vo) throws Exception  {
		return boardDAO.select_vo(vo);
	}
	
	@Override
	public int update_viewcnt(BoardVO vo) throws Exception {
		return boardDAO.update_viewcnt(vo);
	}
	
	@Override
	public int modify(BoardVO vo) throws Exception {
		return boardDAO.modify(vo);
	}
	
	@Override
	public int delete(BoardVO vo) throws Exception {
		return boardDAO.delete(vo);
	}
	
	@Override
	public int list_count(BoardVO vo) throws Exception {
		return boardDAO.list_count(vo);
	}
}
