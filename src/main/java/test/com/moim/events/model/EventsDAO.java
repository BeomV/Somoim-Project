package test.com.moim.events.model;

import java.util.List;

public interface EventsDAO {
    public List<EventsVO> selectAll();
    public EventsVO selectOne(EventsVO vo);
    public int insert(EventsVO vo);
    public int delete(EventsVO vo);
    public int update(EventsVO vo);

}
