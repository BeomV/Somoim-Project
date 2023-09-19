package test.com.moim.community_comments.model;

import test.com.moim.comments.model.som_commentsVO;
import test.com.moim.userinfo.model.UserinfoVO;

import java.util.List;


public interface Community_commentsDAO {
	public int insert(Community_commentsVO vo);

	public int update(Community_commentsVO vo);

	public int delete(Community_commentsVO vo);

	public List<Community_commentsVO> selectAll(Community_commentsVO vo);

	public void good_count_up(Community_commentsVO vo) ;




}
