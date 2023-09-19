package test.com.moim.events.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import test.com.moim.events.model.EventsDAO;
import test.com.moim.events.model.EventsVO;

import java.util.List;

@Service
public class EventsService {


    @Autowired
    EventsDAO dao;
    public List<EventsVO> selectAll(){
        return dao.selectAll();
    }
    public EventsVO selectOne(EventsVO vo){
        return dao.selectOne(vo);
    }
    public int insert(EventsVO vo){
        return dao.insert(vo);
    }
    public int delete(EventsVO vo){
        return dao.delete(vo);
    }
    public int update(EventsVO vo){
        return dao.update(vo);
    }
}