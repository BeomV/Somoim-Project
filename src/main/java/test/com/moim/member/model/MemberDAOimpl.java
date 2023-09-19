package test.com.moim.member.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class MemberDAOimpl implements MemberDAO {
	
	@Autowired
	SqlSession session;

	@Override
	public int insert(MemberVO vo) {
		log.info("insert()...{}", vo);
		log.info("======={}", vo.getUser_id());
		log.info("======={}", vo.getNum());
		
		MemberVO vo2 = session.selectOne("MEMBER_CHECK", vo);
		
		if(vo2==null) {
			log.info("가입가능함");
			return session.insert("MEMBER_INSERT", vo);
		}
		else
			return 0;
	}

	@Override
	public int delete(MemberVO vo) {
		log.info("delete()...{}", vo);
		return session.delete("MEMBER_DELETE", vo);
	}

	@Override
	public List<MemberVO> selectAll() {
		log.info("selectAll()...");
		return session.selectList("MEMBER_SELECT_ALL");
	}

	@Override
	public List<MemberVO> searchList(String searchKey, String searchWord) {
		log.info("searchList()...{}, {}", searchKey, searchWord);
		
		if(searchKey.equals("user_id"))
			return session.selectList("MEMBER_SEARCH_LIST_USERID", "%"+searchWord+"%");
		else
			return session.selectList("MEMBER_SEARCH_LIST_SOMTITLE", "%"+searchWord+"%");
	}

	@Override
	public List<MemberVO> profileCheck(MemberVO vo) {
		log.info("this.....{}", vo);
		return session.selectList("PROFILE_CHECK", vo);
	}

	@Override
	public List<MemberVO> searchSavename(String somoim_master) {
		log.info("searchSavename...{}", somoim_master);
		
		return session.selectList("SEARCH_SAVE_NAME", somoim_master);
	}

	@Override
	public int mypage_update_member(MemberVO vo2) {
		log.info("오로지 somoim_member 테이블의 save_name을 바꾸기 위한 메서드....{}", vo2.getSave_name());
		return session.update("MYPAGE_UPDATE_MEMBER", vo2);
	}

	@Override
	public int som_maxmember_check(MemberVO vo) {
		log.info("som_maxmember_check....som_title:{}", vo.getSom_title());
		return session.selectOne("SOM_MAXMEMBER_CHECK", vo);
	}

}
