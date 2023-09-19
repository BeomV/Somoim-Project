package test.com.moim.community_comments.model;

import java.util.List;


public interface Community_re_commentsDAO {
	public int insert(Community_re_commentsVO vo);

	public int update(Community_re_commentsVO vo);

	public int delete(Community_re_commentsVO vo);

	public List<Community_re_commentsVO> selectAll(Community_re_commentsVO vo);

	public void good_count_up(Community_re_commentsVO vo) ;



}
