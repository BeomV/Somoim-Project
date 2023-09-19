package test.com.moim.myfeed.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import test.com.moim.myfeed.model.MyfeedDAO;
import test.com.moim.myfeed.model.MyfeedVO;

@Slf4j
@Service
public class MyfeedService {

	@Autowired
	MyfeedDAO dao;


	public int update(MyfeedVO vo) {
		log.info("myfeed_update....{}", vo.getUser_id());
		return dao.update(vo);
	}


	public MyfeedVO selectOne(MyfeedVO vo4) {
		log.info("feed_selectOne....{}", vo4);
		return dao.selectOne(vo4);
	}


	public int insert(String user_id) {
		log.info("first myfeed insert....{}", user_id);
		return dao.insert(user_id);
	}


	public int imginsert(MyfeedVO vo) {
		log.info("imginsert....{}", vo);
		return dao.imginsert(vo);
	}

}