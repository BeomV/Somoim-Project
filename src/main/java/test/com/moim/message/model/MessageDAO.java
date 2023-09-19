package test.com.moim.message.model;

import java.util.List;

public interface MessageDAO {
    public List<MessageVO> message_selectAll(MessageVO vo);
    public MessageVO message_selectOne(MessageVO vo);
    public int mes_insert(MessageVO vo);
    public int mes_update(MessageVO vo);
    public int mes_delete(MessageVO vo);
}
