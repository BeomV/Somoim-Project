package test.com.moim.community_comments.model;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Date;
import java.sql.Timestamp;

@Data
public class Community_commentsVO {

	private int num;
	private String user_id;
	private String content;
	private Date write_date;
	private int good_count;
	private int board_num;
	private int parent_com;
	private String save_name;

}
