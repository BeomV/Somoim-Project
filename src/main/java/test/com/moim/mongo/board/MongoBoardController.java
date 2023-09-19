package test.com.moim.mongo.board;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
public class MongoBoardController {

    @Autowired
    MongoBoardService service;

    @Autowired
    ServletContext sContext;


    @RequestMapping(value = "/join_gallery.do", method = RequestMethod.GET)
    public String Mongo_join_gallery(
            @RequestParam(defaultValue = "1") int pageNo,
            Model model,
            MongoBoardVO vo
    ) {
        log.info("join_gallery()......");

        List<MongoBoardVO> list = service.findAll(vo, pageNo);
        model.addAttribute("list", list);

        long totalPosts = service.countAll(vo);
        int totalPage = (int) Math.ceil((double) totalPosts / 9);
        model.addAttribute("totalPage", totalPage);

        return "board/join_gallery";
    }



    @RequestMapping(value = "/join_gallery_insert.do", method = RequestMethod.GET)
    public String join_gallery_insert(HttpServletRequest request) {
        log.info("join_gallery_insert()......");

        String userId = (String) request.getSession().getAttribute("user_id");
        log.info(userId);

        return "board/join_gallery_insert";
    }

    @RequestMapping(value = "/join_gallery_insertOK.do", method = RequestMethod.POST)
    public String join_gallery_insertOk(MongoBoardVO vo, HttpServletRequest request) throws IllegalStateException, IOException {
        log.info("join_gallery_insertOk()......");

        Map<String, Integer> map = new HashMap<String, Integer>();

        MongoBoardVO vo2 = service.findOne(vo);
        log.info("현재 Num 값" + vo2.toString());

        vo.setNum(vo2.getNum() + 1);

        String date = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm").format(new java.util.Date());
        log.info(date);

        vo.setUpload_date(date);

        String userId = (String) request.getSession().getAttribute("user_id");
        log.info(userId);

        vo.setUser_id(userId);


        int fileNameLength = vo.getFile().getOriginalFilename().length();
        String getOriginalFileName = vo.getFile().getOriginalFilename();

        log.info("getOriginalFilename : {}", getOriginalFileName);
        log.info("fileNameLength : {}", fileNameLength);

        vo.setImage_name(getOriginalFileName.length() == 0 ? "아이유.png" : getOriginalFileName);

        if (getOriginalFileName.length() == 0) {
            vo.setImage_name("아이유.png");

        } else {
            vo.setImage_name(getOriginalFileName);
            // 웹 어플리케이션이 갖는 실제 경로 : 이미지를 업로드할 대상 경로를 찾아서 파일 저장
            String realPath = sContext.getRealPath("resources/uploadimg");

            log.info("realPath : {}", realPath);

            File f = new File(realPath + "/" + vo.getImage_name());

            vo.getFile().transferTo(f);

            //// create thumbnail image/////////
            BufferedImage original_buffer_img = ImageIO.read(f);
            BufferedImage thumb_buffer_img = new BufferedImage(50, 50, BufferedImage.TYPE_3BYTE_BGR);
            Graphics2D graphic = thumb_buffer_img.createGraphics();
            graphic.drawImage(original_buffer_img, 0, 0, 50, 50, null);
            File thumb_file = new File(realPath + "/thumb_" + vo.getImage_name());
            String formatName = vo.getImage_name().substring(vo.getImage_name().lastIndexOf(".") + 1);
            log.info("formatName : {}", formatName);
            ImageIO.write(thumb_buffer_img, formatName, thumb_file);

        } // end else
        int result = service.insert(vo);

        map.put("result", result);

        return "redirect:/join_gallery.do?somoim_num=" + vo.getSomoim_num();
    }

    @RequestMapping(value = "/join_gallery_deleteOK.do", method = RequestMethod.GET)
    public String join_gallery_deleteOK(HttpServletRequest request, MongoBoardVO vo, RedirectAttributes attributes) {
        log.info("join_gallery_deleteOK()......{}",vo);

        String userId = (String) request.getSession().getAttribute("user_id");
        log.info(userId);



        if(userId.equals(vo.getUser_id())){
            int result = service.delete(vo);
            if(result ==1){
                return "redirect:join_gallery.do?somoim_num=" + vo.getSomoim_num();
            }

        }
        else
        {
            attributes.addAttribute("message","권한이 거부 되었습니다.");

        }
        return "redirect:/join_gallery.do?somoim_num=" + vo.getSomoim_num();
    }


}

