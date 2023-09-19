package test.com.moim.cs.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class CsDAOimpl implements CsDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public CsDAOimpl() {
		log.info("CsDAOimpl().....");
	}
	
	
	@Override
	public List<CsVO> selectAll() {
		   log.info(" CS_selectAll()...");
	        return sqlSession.selectList("CS_SELECT_ALL");
	}

	@Override
	public int insert(CsVO vo) {
		log.info("insert()...{}", vo);
		return sqlSession.update("CS_INSERT",vo);
	}

	@Override
	public int update(CsVO vo) {
		log.info("update");
		return sqlSession.update("CS_UPDATE",vo);
	}

	@Override
	public int delete(CsVO vo) {
		log.info("delete");
		return sqlSession.delete("CS_DELETE", vo);
	}

	@Override
	public CsVO selectOne(CsVO vo) {
		log.info("selectOne impl....{}", vo);
		return sqlSession.selectOne("CS_SELECT_ONE", vo);
	}

}
