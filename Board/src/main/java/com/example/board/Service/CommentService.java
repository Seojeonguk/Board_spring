package com.example.board.Service;

import java.util.List;

public interface CommentService {
	public List<?> listAll(CommentVO vo) throws Exception;
	public int insert(CommentVO vo) throws Exception;
	public int delete(CommentVO vo) throws Exception;
}
