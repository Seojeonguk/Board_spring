package com.example.board.Service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

public interface BoardService {
	public List<BoardVO> listAll() throws Exception;
	public int insert(BoardVO vo) throws Exception;
	public BoardVO select_vo(BoardVO vo) throws Exception;
	public int update_viewcnt(BoardVO vo) throws Exception;
	public int modify(BoardVO vo) throws Exception;
}
