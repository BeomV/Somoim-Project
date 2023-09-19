package test.com.moim.somoim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import test.com.moim.paging.model.PagingVO;
import test.com.moim.somoim.model.SomoimDAO;
import test.com.moim.somoim.model.SomoimVO;
import test.com.moim.userinfo.model.UserinfoVO;

@Service
@Slf4j
public class SomoimService {
	
	@Autowired
	SomoimDAO dao;
	
	
	public List<SomoimVO> selectAll(SomoimVO vo) {
		log.info("somoim_selectAll().....");
		return dao.selectAll(vo);
	}


	public SomoimVO selectOne(SomoimVO vo) {
		log.info("somoim_selectOne()....{}", vo);
		return dao.selectOne(vo);
	}


	public List<SomoimVO> searchList(String searchKey, String searchWord, String category) {
		log.info("searchList()....{},{}", searchKey, searchWord);
		log.info("searchList()....{}", category);
		return dao.searchList(searchKey, searchWord, category);
	}


	public int insert(SomoimVO vo) {
		log.info("insert()....{}", vo);
		return dao.insert(vo);
	}


	public int update(SomoimVO vo) {
		log.info("update()....{}", vo);
		return dao.update(vo);
	}


	public int delete(SomoimVO vo) {
		log.info("delete().....{}", vo);
		return dao.delete(vo);
	}


	public UserinfoVO searchSavename(UserinfoVO uvo) {
		log.info("searchSavename...{}", uvo);
		return dao.searchSavename(uvo);
	}


	public int countSomoim() {
		log.info("countSomoim....");
		return dao.countSomoim();
	}


	public List<SomoimVO> selectSomoim(PagingVO vo) {
		log.info("selectSomoim...{}", vo);
		return dao.selectSomoim(vo);
	}
	public List<SomoimVO> selectSomoim_user_id(SomoimVO vo) {
		log.info("selectSomoim_user_id....{}", vo);

		return dao.selectSomoim_user_id(vo);
	}


	public List<SomoimVO> mysomoim_selectAll(String user_id) {
		log.info("mypage mysomoim_selectAll....{}", user_id);
		return dao.mysomoim_selectAll(user_id);
	}


	public List<SomoimVO> somoimbyme_selectAll(String user_id) {
		log.info("somoimbyme_selectAll...{}", user_id);
		return dao.somoimbyme_selectAll(user_id);
	}

	public SomoimVO somtitleCheck(String som_title) {
		log.info("somtitleCheck...{}", som_title);
		return dao.somtitleCheck(som_title);
	}


//	public UserinfoVO selectprofileOne(UserinfoVO uvo) {
//		log.info(".....!!{}", uvo);
//		return dao.selectprofileOne(uvo);
//	}

	
	
}
