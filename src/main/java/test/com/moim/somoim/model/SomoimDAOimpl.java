package test.com.moim.somoim.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;
import test.com.moim.paging.model.PagingVO;
import test.com.moim.userinfo.model.UserinfoVO;

@Slf4j
@Repository
public class SomoimDAOimpl implements SomoimDAO {

	@Autowired
	SqlSession session;

	@Override
	public List<SomoimVO> selectAll(SomoimVO vo) {
		return session.selectList("SOMOIM_SELECT_ALL", vo);
	}

	@Override
	public SomoimVO selectOne(SomoimVO vo) {
		log.info("selectOne()...{}", vo);
		return session.selectOne("SOMOIM_SELECT_ONE", vo);
	}

	@Override
	public List<SomoimVO> searchList(String searchKey, String searchWord, String category) {
		log.info("searchList()...{}, {}", searchKey, searchWord);
		log.info("searchList()...category : {}", category);

		log.info("====이거확인{}", category=="");


		Map<String, String> map = new HashMap<String, String>();
		map.put("searchWord",  "%"+searchWord+"%");
		map.put("category", category);

		if(searchKey.equals("소모임 이름")) {
			if(category=="") {
				return session.selectList("SOMOIM_SEARCH_LIST_TITLE2", "%"+searchWord+"%");
			}
			return session.selectList("SOMOIM_SEARCH_LIST_TITLE",map);
		}
		else {
			if(category=="")
				return session.selectList("SOMOIM_SEARCH_LIST_AREA2", "%"+searchWord+"%");
			return session.selectList("SOMOIM_SEARCH_LIST_AREA",map);
		}
	}

	@Override
	public int insert(SomoimVO vo) {
		log.info("insert()...{}", vo);
		return session.insert("SOMOIM_INSERT", vo);
	}

	@Override
	public int update(SomoimVO vo) {
		log.info("update()...{}", vo);
		return session.update("SOMOIM_UPDATE", vo);
	}

	@Override
	public int delete(SomoimVO vo) {
		log.info("delete()...{}", vo);
		return session.delete("SOMOIM_DELETE", vo);
	}

	public UserinfoVO searchSavename(UserinfoVO uvo) {
		log.info("searchSavename...{}", uvo.getUser_id());
		return session.selectOne("SEARCH_SAVENAME", uvo);
	}

	@Override
	public List<SomoimVO> mypageSelectSomoim(String user_id) {
		log.info("mypageSelectSomoim....user_id:{}", user_id);
		return session.selectList("SELECT_MYPAGE", user_id);
	}

	@Override
	public int countSomoim() {
		log.info("countSomoim....");
		return session.selectOne("COUNT_SOMOIM");
	}
	
	@Override
	public List<SomoimVO> selectSomoim(PagingVO vo) {
		log.info("selectSomoim....{}", vo);
		return session.selectList("PAGING_SOMOIM", vo);
	}

	@Override
	public List<SomoimVO> selectSomoim_user_id(SomoimVO vo) {
		log.info("selectSomoim_user_id....{}", vo);

		return session.selectList("SOMOIM_NUM_USER_ID", vo);
	}

	@Override
	public List<SomoimVO>mysomoim_selectAll(String user_id) {
		log.info("mypage mysomoim_selectAll...{}", user_id);
		return session.selectList("MYSOMOIM_SELECT_ALL", user_id);
	}

	@Override
	public List<SomoimVO> somoimbyme_selectAll(String user_id) {
		log.info("somoimbyme_selectAll...{}", user_id);
		return session.selectList("SOMOIMBYME_SELECT_ALL", user_id);
	}

	@Override
	public SomoimVO somtitleCheck(String som_title) {
		log.info("somtitleCheck...{}", som_title);
		return session.selectOne("SOMOIMTITLE_CHECK", som_title);
	}

//	public UserinfoVO selectprofileOne(UserinfoVO uvo) {
//		log.info("profilesearch()....{}", uvo);
//		log.info("이건  mapper 에 있음");
//
//		return session.selectOne("PROFILE_SEARCH", uvo);
//	}

}