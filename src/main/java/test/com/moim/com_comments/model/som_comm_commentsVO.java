package test.com.moim.com_comments.model;

import java.sql.Date;

import lombok.Data;


@Data
public class som_comm_commentsVO {
	private int num;
	private int som_member_num;
	private String content;
	private Date write_date;
	private String good_count;
	private int som_board_num;
	private int som_comment_depth;
	private int parent_com;
	private String user_id;
	private int somoim_num;
	private String save_name;
}

