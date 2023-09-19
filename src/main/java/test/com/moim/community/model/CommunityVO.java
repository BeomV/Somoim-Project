package test.com.moim.community.model;

import lombok.Data;

import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

@Data
public class CommunityVO {

	private int num;
	private String title;
	private String user_id;
	private String content;
	private String save_name;
	private Date write_date;
	private int view_count;
	private int good_count;
	private MultipartFile file;
	private String save_img;

}
