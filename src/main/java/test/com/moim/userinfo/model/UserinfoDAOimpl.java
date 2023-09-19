package test.com.moim.userinfo.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class UserinfoDAOimpl implements UserinfoDAO {

	@Autowired
	SqlSession sqlSession;

	public UserinfoDAOimpl() {
		log.info("UserinfoDAOimpl()..");
	}
	
	@Override
	public List<UserinfoVO> selectAll(){
		log.info("selectAll()..");
		
		return sqlSession.selectList("U_SELECT_ALL");
	}
	
	@Override
	public UserinfoVO selectOne(UserinfoVO vo) {
		log.info("selectOne()...{}",vo);
		
		return sqlSession.selectOne("U_SELECT_ONE",vo);
	}
	
	@Override
	public int insert(UserinfoVO vo) {
		log.info("insert()..{}",vo);
		
		return sqlSession.insert("U_INSERT",vo);
	}
	
	@Override
	public int userhome(UserinfoVO vo) {
		log.info("userhome()..{}",vo);
		
		return sqlSession.insert("userhome",vo);
	}
	
	
	
	
	@Override
	public UserinfoVO login(UserinfoVO vo) {
		log.info("login()..{}",vo);
		return sqlSession.selectOne("LOGIN",vo);
	}

	@Override
	public UserinfoVO idCheck(UserinfoVO vo) {
		log.info("idCheck()..{}",vo);
		return sqlSession.selectOne("U_ID_CHECK",vo);
	}

	@Override
	public UserinfoVO mypageSelectOne(UserinfoVO vo) {
		log.info("mypageSelectOne....{}", vo);
		return sqlSession.selectOne("U_SELECT_ID", vo);
	}

	@Override
	public UserinfoVO findId(String email) throws Exception {
		log.info("find_id()...{}", email);
	    Map<String, String> map = new HashMap<String, String>();
	    map.put("email", email);
		return sqlSession.selectOne("U_FindId", map);
	}
	
	@Override
	public UserinfoVO findPassword2(String email) {
		log.info("find_password()...{}", email);
	    Map<String, String> map = new HashMap<String, String>();
	    map.put("email", email);
		return sqlSession.selectOne("U_FindPassword2", map);
	}

	@Override
	public UserinfoVO resetPassword(String email) throws Exception {
		log.info("find_password()...{}", email);
	    Map<String, String> map = new HashMap<String, String>();
	    map.put("user_id", email);
		return sqlSession.selectOne("U_resetPassword", map);
	}
	

	@Override
	public int resetPassword_update(UserinfoVO vo) {
		log.info("resetPassword_update....{}", vo);
		return sqlSession.update("U_resetPassword", vo);
	}
	
	@Override			
	public UserinfoVO selectUser(UserinfoVO vo2) {
		log.info("selectUserID....{}", vo2);
		return sqlSession.selectOne("UPDATE_USER", vo2);
	}

	@Override
	public int mypage_update(UserinfoVO vo) {
		log.info("mypage_update....{}", vo);
		return sqlSession.update("MYPAGE_UPDATE_OK", vo);
	}



		
}
