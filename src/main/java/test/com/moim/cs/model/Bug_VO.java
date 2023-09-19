package test.com.moim.cs.model;

import lombok.Data;

import java.sql.Date;

@Data
public class Bug_VO {
	private int num;
	private String user_id;
	private String title;
	private String content;
	private Date write_date;
	private String save_name;
}
