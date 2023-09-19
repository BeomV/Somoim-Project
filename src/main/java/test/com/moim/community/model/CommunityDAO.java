package test.com.moim.community.model;

import test.com.moim.userinfo.model.UserinfoVO;

import java.util.List;

public interface CommunityDAO {

	public int insert(CommunityVO vo);

	public int update(CommunityVO vo);

	public int delete(CommunityVO vo);

	public List<CommunityVO> selectAll();

	public CommunityVO selectOne(CommunityVO vo);

	public List<CommunityVO> searchList(String searchKey, String searchWord);

	List<CommunityVO> select_user_info();



	CommunityVO select_all_goodList(CommunityVO vo);
	int adding_good_count_list(CommunityVO vo);
	int del_good_count_list(CommunityVO vo);

	int good_count_up(CommunityVO vo);
	int good_count_down(CommunityVO vo);


	public List<CommunityVO> mypageMyactivity_communitybyme(CommunityVO vo);

	public List<CommunityVO> mypageMyactivity_good(CommunityVO vo);

	public UserinfoVO user_list(UserinfoVO vo);



}