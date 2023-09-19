package test.com.moim.somoim.model;

import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class SomoimVO {

	private int num;
	private String som_title;
	private String category;
	private int max_member;
	private Date create_date;
	private String area;
	private String som_content;
	private String somoim_img;
	private MultipartFile file;
	private String somoim_master;
	private String user_id;

}