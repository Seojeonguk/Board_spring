package com.example.board.ServiceImpl;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.example.board.Service.CommentVO;

@Repository("commentDAO")
public class CommentDAO {
	@Inject
	private SqlSessionTemplate SqlSession;
	
	@SuppressWarnings("rawtypes")
	public List<?> listAll(CommentVO vo) throws Exception {
		return (List)SqlSession.selectList("comment.listAll",vo);
	}
	
	public int insert(CommentVO vo) throws Exception {
		return SqlSession.insert("comment.insert",vo);
	}
	
	public int delete(CommentVO vo) throws Exception {
		return SqlSession.delete("comment.delete",vo);
	}
}
