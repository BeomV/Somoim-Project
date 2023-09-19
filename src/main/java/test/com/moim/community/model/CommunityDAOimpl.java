package test.com.moim.community.model;

import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import test.com.moim.userinfo.model.UserinfoVO;

import java.util.List;

@Slf4j
@Repository
public class CommunityDAOimpl implements CommunityDAO{

    @Autowired
    SqlSession sqlSession;

    public CommunityDAOimpl() {
		log.info("CommunityDAOimpl....");
	}

	@Override
	public int insert(CommunityVO vo) {
		log.info("insert()....{}",vo);
		return sqlSession.insert("CB_INSERT",vo);
	}

	@Override
	public int update(CommunityVO vo) {
		log.info("update()....{}",vo);
		return sqlSession.update("CB_UPDATE",vo);
	}

	@Override
	public int delete(CommunityVO vo) {
		log.info("delete()....{}",vo);
		return sqlSession.delete("CB_DELETE",vo);
	}

	@Override
	public List<CommunityVO> selectAll() {
		log.info("selectAll()....");
		return sqlSession.selectList("CB_SELECT_ALL");
	}

	@Override
	public CommunityVO selectOne(CommunityVO vo) {
		log.info("selectOne()....{}",vo);
		
		return sqlSession.selectOne("CB_SELECT_ONE",vo);
	}

	@Override
	public List<CommunityVO> searchList(String searchKey, String searchWord) {
		log.info("searchList()....searchKey:{}",searchKey);
		log.info("searchList()....searchWord:{}",searchWord);
		String key = "";
		if(searchKey.equals("title")) {
			key = "CB_SEARCH_LIST_TITLE";
		}else if(searchKey.equals("content")) {
			key = "CB_SEARCH_LIST_CONTENT";
			
		}else {
			key = "CB_SEARCH_LIST_WRITER";
			
		}
		return sqlSession.selectList(key,"%"+searchWord+"%");
	}

	public List<CommunityVO> select_user_info() {
		return sqlSession.selectList("CB_SELECT_SAVE_NAME");
	}

	//section  좋아요 좋아요 취소
	@Override
	public CommunityVO select_all_goodList(CommunityVO vo) {
		return sqlSession.selectOne("CB_SELECT_ALL_GOOD_LIST", vo);
	}

	@Override
	public int adding_good_count_list(CommunityVO vo) {
		return sqlSession.insert("CB_ADDING_GOOD_COUNT_LIST", vo);
	}

	@Override

	public List<CommunityVO> mypageMyactivity_communitybyme(CommunityVO vo) {
		log.info("mypageMyactivity_communitybyme....{}", vo);
		return sqlSession.selectList("MYPAGE_COMMUNITYBYME", vo);
	}

	public int del_good_count_list(CommunityVO vo) {
		return sqlSession.delete("CB_DEL_GOOD_COUNT_LIST", vo);
	}

	@Override
	public int good_count_up(CommunityVO vo) {
		return sqlSession.update("CB_GOOD_COUNT_UP", vo);
	}

	@Override
	public int good_count_down(CommunityVO vo) {
		return sqlSession.update("CB_GOOD_COUNT_DOWN", vo);
	}

	@Override
	public List<CommunityVO> mypageMyactivity_good(CommunityVO vo) {
		return sqlSession.selectList("MYPAGE_GOOD", vo);
	}


	@Override
	public UserinfoVO user_list(UserinfoVO vo) {
		return sqlSession.selectOne("ELEMENTS_IN_USERINFO", vo);
	}

}