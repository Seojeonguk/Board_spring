package com.example.board.ServiceImpl;

import java.util.List;
import javax.inject.Inject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.example.board.Service.BoardVO;

@Repository("boardDAO")
public class BoardDAO {
	@Inject
	private SqlSessionTemplate SqlSession;
	
	public List<BoardVO> listAll(BoardVO vo) throws Exception {
		return SqlSession.selectList("board.listAll",vo);
	}
	
	public int insert(BoardVO vo) throws Exception {
		return SqlSession.insert("board.insert",vo);
	}
	
	public BoardVO select_vo(BoardVO vo) throws Exception {
		return SqlSession.selectOne("board.select_vo", vo);
	}
	
	public int update_viewcnt(BoardVO vo) throws Exception {
		return SqlSession.update("board.update_viewcnt",vo);
	}
	
	public int modify(BoardVO vo) throws Exception {
		return SqlSession.update("board.update",vo);
	}
	
	public int delete(BoardVO vo) throws Exception {
		return SqlSession.delete("board.delete",vo);
	}
	
	public int list_count(BoardVO vo) throws Exception {
		return SqlSession.selectOne("board.list_count",vo);
	}
}
