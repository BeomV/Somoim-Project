package test.com.moim.cs.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class BugDAOimpl implements BugDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<BugVO> selectAll() {
		log.info("selectAll");
		return sqlSession.selectList("BUG_SELECT_ALL");
	}

	@Override
	public int insert(BugVO vo) {
		log.info("insert");
		return sqlSession.update("BUG_INSERT",vo);
	}

}
