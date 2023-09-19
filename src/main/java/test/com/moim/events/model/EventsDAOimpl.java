package test.com.moim.events.model;


import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Slf4j
@Repository
public class EventsDAOimpl implements EventsDAO {

    @Autowired
    SqlSession sqlSession;


    public EventsDAOimpl(){
        log.info("EventsDAOimpl()....");
    }

    @Override
    public List<EventsVO> selectAll() {
        return sqlSession.selectList("E_SELECT_ALL");
    }

    @Override
    public EventsVO selectOne(EventsVO vo) {
        return sqlSession.selectOne("E_SELECT_ONE", vo);
    }

    @Override
    public int insert(EventsVO vo) {
        return sqlSession.insert("E_INSERT", vo);
    }



    @Override
    public int delete(EventsVO vo) {
        return sqlSession.delete("E_DELETE", vo);
    }

    @Override
    public int update(EventsVO vo) {
        return sqlSession.update("E_UPDATE", vo);
    }
}