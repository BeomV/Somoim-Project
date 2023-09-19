package test.com.moim.comments.model;

import java.util.List;


public interface som_commentsDAO {
	public int insert(som_commentsVO vo);

	public int update(som_commentsVO vo);

	public int delete(som_commentsVO vo);

	public List<som_commentsVO> selectAll(som_commentsVO vo);

	public void good_count_up(som_commentsVO vo) ;
	public void som_board_num_down(som_commentsVO vo) ;

	public List<som_commentsVO> mypageMyactivity_commbyme(som_commentsVO vo);


}