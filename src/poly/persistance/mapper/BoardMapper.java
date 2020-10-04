package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.BoardDTO;
import poly.dto.CommentDTO;


@Mapper("BoardMapper")
public interface BoardMapper {
	
	int insertBoardInfo(BoardDTO bDTO)throws Exception;
	
	//게시글 리스트
	List<BoardDTO> getBoardList(BoardDTO bDTO) throws Exception;

	//게시글 상세
	BoardDTO getBoardDetail(String seq) throws Exception;
	
	//게시글 수정
	BoardDTO getBoardModify(String seq) throws Exception;

	int updateBoard(BoardDTO bDTO) throws Exception;

	//게시글 삭제
	int deleteBoard(String seq) throws Exception;

	//게시글 조회수
	int updateBoardReadCnt(BoardDTO bDTO) throws Exception;
	
	//총리스트 개수
	int listall() throws Exception;

	/* BoardDTO UserBoardDelete(BoardDTO pDTO)throws Exception; */
	
	// 댓글 작성 
	int insertComment(CommentDTO bDTO) throws Exception;
	
	//댓글 리스트
	List<BoardDTO> getCommentList(CommentDTO bDTO) throws Exception;
}
