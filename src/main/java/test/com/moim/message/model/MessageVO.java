package test.com.moim.message.model;

import lombok.Data;

import java.sql.Date;

@Data
public class MessageVO {

private int num;
private String receiver;
private int send_receive;
private Date sending_date;
private String content;
private String sender;
private String user_id;
private String save_name;
private int read_or_not;
}
