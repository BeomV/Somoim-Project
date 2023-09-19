package test.com.moim.myfeed.model;

import lombok.Data;

@Data
public class MyfeedVO {

	private int num;
	private String user_id;
	private String save_name;
	private int good_count;
	private int hate_count;
	private String introduce;

}