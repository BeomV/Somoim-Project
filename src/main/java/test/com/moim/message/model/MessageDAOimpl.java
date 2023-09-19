package test.com.moim.message.model;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MessageDAOimpl implements MessageDAO {


    @Autowired
    SqlSession sqlSession;


    @Override
    public List<MessageVO> message_selectAll(MessageVO vo) {
        return sqlSession.selectList("SELECT_ALL_MESSAGE", vo) ;
    }

    @Override
    public MessageVO message_selectOne(MessageVO vo) {
        return null;
    }

    @Override
    public int mes_insert(MessageVO vo) {
        return sqlSession.insert("MESSAGE_INSERT", vo);
    }

    @Override
    public int mes_update(MessageVO vo) {
        return 0;
    }

    @Override
    public int mes_delete(MessageVO vo) {
        return sqlSession.delete("MESSAGE_DELETE", vo );
    }
}
