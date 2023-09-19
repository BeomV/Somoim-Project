package test.com.moim.userinfo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import test.com.moim.userinfo.model.UserinfoDAO;
import test.com.moim.userinfo.model.UserinfoVO;
import test.com.moim.userinfo.model.UserinfoVO;

@Slf4j
@Service
public class UserinfoService {

	@Autowired
	UserinfoDAO dao;

	public List<UserinfoVO> selectAll(){
		return dao.selectAll();	
	}
	
	public UserinfoVO selectOne(UserinfoVO vo) {
		return dao.selectOne(vo);
	}
	
	public int insert(UserinfoVO vo) {
		return dao.insert(vo);
	}
	
	public int userhome(UserinfoVO vo) {
		return dao.userhome(vo);
	}
	
	
	public UserinfoVO login(UserinfoVO vo) {
		return dao.login(vo);
	}
	
	public UserinfoVO idCheck(UserinfoVO vo) {
		return dao.idCheck(vo);
	}
	
	public UserinfoVO findId(String email) throws Exception {
	    log.info("findId()... email: {}", email);
	    if (email == null || email.trim().isEmpty()) {
	        throw new IllegalArgumentException("이메일을 입력해주세요.");
	    }

	    return dao.findId(email);
	}

	public UserinfoVO findPassword(String user_id) throws Exception{
		log.info("findPassword()...user_id:{}", user_id);
		return dao.resetPassword(user_id);
	}


	public UserinfoVO selectUser(UserinfoVO vo2) {
		log.info("selectUserID...{}", vo2);
		return dao.selectUser(vo2);
	}

	public UserinfoVO findPassword2(String email) {
		log.info("findPassword()...email:{}", email);
		return dao.findPassword2(email);
	}
	public int resetPassword_update(UserinfoVO vo) {
		return dao.resetPassword_update(vo);
	}

}
