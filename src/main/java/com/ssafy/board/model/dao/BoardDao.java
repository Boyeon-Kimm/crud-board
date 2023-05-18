package com.ssafy.board.model.dao;

import java.util.List;

import com.ssafy.board.model.dto.Board;
import com.ssafy.board.model.dto.SearchCondition;

public interface BoardDao {

	int insert(Board board);

	int update(Board board);

	int delete(int no);
	
	Board selectByNo(int no);

	List<Board> selectByUserId(String userId);

	List<Board> selectExceptNotice();
	
	List<Board> selectAll();
	
	List<Board> searchByCondition(SearchCondition con);

}
