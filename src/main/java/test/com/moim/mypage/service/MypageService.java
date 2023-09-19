package test.com.moim.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import test.com.moim.board.model.BoardDAO;
import test.com.moim.board.model.Somoim_BoardVO;
import test.com.moim.comments.model.som_commentsDAO;
import test.com.moim.comments.model.som_commentsVO;
import test.com.moim.community.model.CommunityDAO;
import test.com.moim.community.model.CommunityVO;
import test.com.moim.member.model.MemberDAO;
import test.com.moim.member.model.MemberVO;
import test.com.moim.somoim.model.SomoimDAO;
import test.com.moim.somoim.model.SomoimVO;
import test.com.moim.userinfo.model.UserinfoDAO;
import test.com.moim.userinfo.model.UserinfoVO;

@Slf4j
@Service
public class MypageService {

	@Autowired
	UserinfoDAO dao;
	
	@Autowired
	SomoimDAO dao2;
	
	@Autowired
	BoardDAO boardDao;
	
	@Autowired
	som_commentsDAO commDao;
	
	@Autowired
	MemberDAO memberDao;
	
	@Autowired
	CommunityDAO communityDao;


	public UserinfoVO mypageSelectOne(UserinfoVO vo) {
		log.info("mypageSelectOne....{}", vo);
		return dao.mypageSelectOne(vo);
	}


	public List<SomoimVO> mypageSelectSomoim(String user_id) {
		log.info("mypageSelectSomoim...{}", user_id);
		return dao2.mypageSelectSomoim(user_id);
	}


	public int mypage_update(UserinfoVO vo) {
		log.info("update.....{}", vo);
		return dao.mypage_update(vo);
	}


	public List<Somoim_BoardVO> mypageMyactivity_boardbyme(Somoim_BoardVO vo) {
		log.info("나의활동..내가 쓴 게시글 모아보기 : {}", vo.getUser_id());
		return boardDao.mypageMyactivity_boardbyme(vo);
	}


	public List<som_commentsVO> mypageMyactivity_commbyme(som_commentsVO vo) {
		log.info("나의활동..내가 쓴 댓글 모아보기 : {}", vo.getUser_id());
		return commDao.mypageMyactivity_commbyme(vo);
	}


	public int mypage_update_member(MemberVO vo2) {
		log.info("somoim_member 테이블의 save_name 도 update ...{}", vo2.getSave_name());
		log.info("구분하기 위한 user_id : {}", vo2.getUser_id());
		return memberDao.mypage_update_member(vo2);
	}


	public List<CommunityVO> mypageMyactivity_communitybyme(CommunityVO vo) {
		log.info("mypageMyactivity_communitybyme...{}", vo);
		return communityDao.mypageMyactivity_communitybyme(vo);
	}


	public List<Somoim_BoardVO> mypageMyactivity_likedboard(Somoim_BoardVO vo) {
		log.info("mypageMyactivity_likedboard....{}", vo.getUser_id());
		return boardDao.mypageMyactivity_likedboard(vo);
	}


	public List<CommunityVO> mypageMyactivity_good(CommunityVO vo) {
		log.info("mypageMyactivity_good....{}", vo);
		return communityDao.mypageMyactivity_good(vo);
	}





}
