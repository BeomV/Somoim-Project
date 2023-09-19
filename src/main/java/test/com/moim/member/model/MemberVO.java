package test.com.moim.member.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberVO {

	private int num;
	private String user_id;
	private Timestamp join_date;
	private String position;
	private String som_title;
	private String save_name;
	private int somoim_num;
}
