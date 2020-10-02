package com.example.board.Service;

import java.util.List;

public interface BoardService {
	public List<BoardVO> listAll(BoardVO vo) throws Exception;
	public int insert(BoardVO vo) throws Exception;
	public BoardVO select_vo(BoardVO vo) throws Exception;
	public int update_viewcnt(BoardVO vo) throws Exception;
	public int modify(BoardVO vo) throws Exception;
	public int delete(BoardVO vo) throws Exception;
	public int list_count(BoardVO vo) throws Exception;
}
