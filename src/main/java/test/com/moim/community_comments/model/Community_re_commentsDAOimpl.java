package test.com.moim.community_comments.model;

import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Slf4j
@Repository
public class Community_re_commentsDAOimpl implements Community_re_commentsDAO {

	@Autowired
	SqlSession sqlsession;


	public Community_re_commentsDAOimpl() {
		log.info("Community_commentsDAOimpl()...constructor");
		
	
	}
	@Override
	public int insert(Community_re_commentsVO vo) {
		log.info(" dao.inserct().... {}", vo );
		
		return sqlsession.update("COMMUNITY_RE_C_INSERT",vo);
	}

	@Override
	public int update(Community_re_commentsVO vo) {
		log.info("대댓글()...{}",vo);
		return sqlsession.update("COMMUNITY_RE_C_UPDATE",vo);
	}

	@Override
	public int delete(Community_re_commentsVO vo) {
		log.info("delete()...{}",vo);
		return sqlsession.delete("COMMUNITY_RE_C_DELETE",vo);
	}

	@Override
	public List<Community_re_commentsVO> selectAll(Community_re_commentsVO vo) {
		log.info("selectAll()...{}",vo);
		return sqlsession.selectList("COMMUNITY_RE_C_SELECT_ALL", vo);
	}
	@Override
	public void good_count_up(Community_re_commentsVO vo) {
//		log.info("vcountUp()....{}",vo);
//		sqlSession.update("B_VCOUNT_UP",vo);
		
	}


}