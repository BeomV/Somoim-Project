package test.com.moim.userinfo.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class UserinfoVO {

	private int num;
	private String user_id;
	private String pw;
	private String name;
	private String email;
	private Date birthday;
	private String birthday_year;
	private String birthday_month;
	private String birthday_day;
	private String som_title;
	private String interest;
	
	private String save_name;
	private MultipartFile file;

	private String msg;
	private String alert;
	private int point;
	private String item_list;

}
