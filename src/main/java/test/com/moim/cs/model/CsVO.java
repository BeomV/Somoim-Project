package test.com.moim.cs.model;

import java.sql.Date;

import lombok.Data;

@Data
public class CsVO {
	private int num;
	private String user_id;
	private String title;
	private String content;
	private Date write_date;
	private String save_name;
}
