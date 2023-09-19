package test.com.moim.mongo.board;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class MongoBoardVO {

    private String _id;
    private int num;
    private String image_name;
    private String upload_date;
    private int somoim_num;
    private String user_id;
    private MultipartFile file;

}
