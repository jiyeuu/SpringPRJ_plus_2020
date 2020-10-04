package poly.service;

import java.util.List;

import poly.dto.BoardDTO;
import poly.dto.CommentDTO;


public interface IBoardService {
	
	int insertBoardInfo(BoardDTO bDTO)throws Exception;
	
	//글 리스트
	List<BoardDTO> getBoardList(BoardDTO bDTO)throws Exception;
	
	//글 상세
	BoardDTO getBoardDetail(String seq) throws Exception;

	//글 수성
	BoardDTO getBoardModify(String seq) throws Exception;

	//글 작성
	int updateBoard(BoardDTO bDTO)  throws Exception;

	//글 삭제
	int deleteBoard(String seq) throws Exception;
	
	//글 조회
	int updateBoardReadCnt(BoardDTO bDTO) throws Exception;
	
	//총리스트 개수
	int listall() throws Exception;
	
	// 댓글 작성 
	int insertComment(CommentDTO bDTO) throws Exception;
	
	//댓글 리스트
	List<BoardDTO> getCommentList(CommentDTO bDTO) throws Exception;

}
