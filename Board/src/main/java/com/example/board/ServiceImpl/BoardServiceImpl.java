package com.example.board.ServiceImpl;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.board.Service.BoardService;
import com.example.board.Service.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;

	@Override
	public List<BoardVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.listAll();
	}

	@Override
	public int insert(BoardVO vo) throws Exception {
		return boardDAO.insert(vo);
	}
}
