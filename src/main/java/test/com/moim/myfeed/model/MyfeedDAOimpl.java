package test.com.moim.myfeed.model;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class MyfeedDAOimpl implements MyfeedDAO {

	@Autowired
	SqlSession session;

	@Override
	public int update(MyfeedVO vo) {
		log.info("myfeed_update....{}", vo.getUser_id());
		return session.update("MYFEED_UPDATE", vo);
	}

	@Override
	public MyfeedVO selectOne(MyfeedVO vo4) {
		log.info("myfeed_SelectOne....{}", vo4.getUser_id());
		return session.selectOne("MYFEED_SELECTONE", vo4);
	}

	@Override
	public int insert(String user_id) {
		log.info("first myfeed insert....{}", user_id);
		return session.insert("MYFEED_INSERT", user_id);
	}

	@Override
	public int imginsert(MyfeedVO vo) {
		log.info("myfeed imginsert....{}", vo);
		return session.update("MYFEED_IMGINSERT", vo);
	}


}