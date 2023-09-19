package test.com.moim.events.model;

import lombok.Data;

import java.sql.Date;

@Data
public class EventsVO {

    private int num;
    private String user_id;
    private String title;
    private String content;
    private Date event_wdate;
    private String save_name;
    private Date start_events;
    private Date end_date;
    private int winner;
    private String event_target;
    private String present;
}
