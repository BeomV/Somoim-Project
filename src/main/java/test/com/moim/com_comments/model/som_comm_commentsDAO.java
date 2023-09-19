package test.com.moim.com_comments.model;

import java.util.List;


public interface som_comm_commentsDAO {
	public int insert(som_comm_commentsVO vo);

	public int update(som_comm_commentsVO vo);

	public int delete(som_comm_commentsVO vo);

	public List<som_comm_commentsVO> selectAll(som_comm_commentsVO vo);
	
	public void good_count_up(som_comm_commentsVO vo) ;
	public void som_board_num_down(som_comm_commentsVO vo) ;

//	public List<SomoimVO> searchList(int searchKey, int searchWord);

}
