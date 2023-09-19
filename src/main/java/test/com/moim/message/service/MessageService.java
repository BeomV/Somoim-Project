package test.com.moim.message.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import test.com.moim.message.model.MessageDAO;
import test.com.moim.message.model.MessageVO;

import java.util.List;

@Service
@Slf4j
public class MessageService {

    @Autowired
    MessageDAO dao;

    public List<MessageVO> message_selectAll(MessageVO vo) {
        return dao.message_selectAll(vo);
    }

    public MessageVO message_selectOne(MessageVO vo) {
        return dao.message_selectOne(vo);
    }

    public int mes_insert(MessageVO vo) {
        return dao.mes_insert(vo);
    }

    public int mes_update(MessageVO vo){
        return dao.mes_update(vo);
    }

    public int mes_delete(MessageVO vo){
        return dao.mes_delete(vo);
    }
}
