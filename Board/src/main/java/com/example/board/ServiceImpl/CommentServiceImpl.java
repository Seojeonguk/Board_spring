package com.example.board.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.board.Service.CommentService;
import com.example.board.Service.CommentVO;

@Service("commentService")
public class CommentServiceImpl implements CommentService {
	@Autowired
	private CommentDAO commentDAO;
	
	@SuppressWarnings("rawtypes")
	@Override
	public List<?> listAll(CommentVO vo) throws Exception {
		return (List)commentDAO.listAll(vo);
	}
	
	@Override
	public int insert(CommentVO vo) throws Exception {
		return commentDAO.insert(vo);
	}
	
	@Override
	public int delete(CommentVO vo) throws Exception {
		return commentDAO.delete(vo);
	}
}