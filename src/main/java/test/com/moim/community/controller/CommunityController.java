package test.com.moim.community.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import test.com.moim.community.model.CommunityVO;
import test.com.moim.community.service.CommunityService;
import test.com.moim.community_comments.model.Community_commentsVO;
import test.com.moim.community_comments.model.Community_re_commentsVO;
import test.com.moim.community_comments.service.Community_commentsService;
import test.com.moim.community_comments.service.Community_re_commentsService;
import test.com.moim.userinfo.model.UserinfoVO;
import test.com.moim.userinfo.service.UserinfoService;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Handles requests for the application home page.
 */

@Slf4j
@Controller


public class CommunityController {

    @Autowired
    HttpSession session;

    @Autowired
    ServletContext sContext;

    @Autowired
    CommunityService service;

    @Autowired
    Community_commentsService community_comservice;

    @Autowired
    Community_re_commentsService community_re_comservice;

    @Autowired
    UserinfoService userinfoService;


    @RequestMapping(value = "/community_selectAll.do", method = RequestMethod.GET)
    public String community_selectAll(Model model) {
        log.info("community_selectAll.do().....{}");

        List<CommunityVO> vos = service.selectAll();

        for (CommunityVO vo : vos) {
            log.info(vo.toString());
        }

        model.addAttribute("vos", vos);

        return "community/selectAll";
    }

    @RequestMapping(value = "/community_selectOne.do", method = RequestMethod.GET)
    public String community_selectOne(CommunityVO vo, Model model, RedirectAttributes redirectAttributes) {
        log.info("community_selectOne.do().....");

        // 로그인 상태를 확인하는 로직
        String userId = (String) session.getAttribute("user_id");
        if (userId == null) {
            // 로그인되지 않은 경우, 로그인 페이지로 리디렉션
            redirectAttributes.addFlashAttribute("message", "로그인이 필요합니다.");
            return "redirect:/login.do";  // 로그인 페이지 URL로 변경해야 함
        }

        List<CommunityVO> infos = service.select_user_info();
        log.info("infos..{}", infos);


        CommunityVO vo2 = service.selectOne(vo);
        log.info("test...{}", vo2);
        for (CommunityVO info : infos) {
            if (vo2.getUser_id().equals(info.getUser_id())) {
                vo2.setSave_name(info.getSave_name());
            }
        }
        log.info("프로필수정...{}", vo2);


        model.addAttribute("vo2", vo2);

        Community_commentsVO vo3 = new Community_commentsVO();
        vo3.setBoard_num(vo2.getNum());
        /*vo3.setSave_name(vo2.getSave_name());*/
        System.out.println("vo2.getNum!!!!!!!!!!!!:" + vo2.getNum());
        log.info("vo3..{}", vo3);
        List<Community_commentsVO> ccoms = community_comservice.selectAll(vo3);


        for (Community_commentsVO com : ccoms) {
            for (CommunityVO info : infos) {
//                log.info("검사 vo 아이디...{}", com.getUser_id());
//                log.info("검사 info 저장된 이름...{}", info.getUser_id());
                if (com.getUser_id().equals(info.getUser_id())) {
//                    log.info("vo2 저장된 아이디...{}", vo2.getUser_id());
//                    log.info("info 저장된 이름...{}", info.getUser_id());
//                    log.info("vo2 저장된 getSave_name...{}", vo2.getSave_name());
//                    log.info("info 저장된 getSave_name...{}", info.getSave_name());
                    if (!com.getSave_name().equals(info.getSave_name())) {
//                        log.info("보드에 저장된 아이디...{}", vo2.getUser_id());
//                        log.info("보드에 저장된 이름...{}", vo2.getSave_name());
//                        log.info("처음 가입 이미지 이름...{}", info.getSave_name());
                        com.setSave_name(info.getSave_name());
//                        log.info("바뀐거 ::: vo2.getSave_name...{}", com.getSave_name());
                    }
                }
            }
            log.info(com.toString());

        }




		/*Community_commentsVO vo3 = new Community_commentsVO();
		vo3.setSave_name(vo2.getSave_name());
		vo3.setBoard_num(vo2.getNum());
		log.info("vo3...!!!!!!!!!!!!!!!!{}", vo3);

		List<Community_commentsVO> ccoms = community_comservice.selectAll(vo3);*/
        List<Community_commentsVO> filteredCcoms = new ArrayList<>();

        for (Community_commentsVO ccom : ccoms) {
            if (ccom.getParent_com() == 0) {
                filteredCcoms.add(ccom);
            }
        }
        log.info("filteredCcoms...{}", filteredCcoms);
        model.addAttribute("ccoms", filteredCcoms);
        model.addAttribute("vo3", vo3);

        Community_re_commentsVO c_cvo = new Community_re_commentsVO();
        c_cvo.setBoard_num(vo3.getBoard_num());
//        log.info("vo3.getnum..{}", vo3.getNum());
        List<Community_re_commentsVO> filteredcoms = new ArrayList<>();
        List<Community_re_commentsVO> c_coms = new ArrayList<Community_re_commentsVO>();
        c_coms = community_re_comservice.selectAll(c_cvo);
        for (Community_re_commentsVO dcom : c_coms) {
            if (dcom.getParent_com() != 0) {
                filteredcoms.add(dcom);
            }
        }
        log.info("filteredcoms@@@@@@@@@@@@@@@@...{}", filteredcoms);

        model.addAttribute("c_coms", filteredcoms);

        // 1. 로그인 유저 PK 얻기.
//        int loginUserNum = (int)session.getAttribute("num");
//
//        log.info("loginUserNum...{}",loginUserNum );
//
////        수정 부분
//        // 2. 로그인 유저 PK로, 로그인 유저 정보 다 가져오기.
//        UserinfoVO loginUserInfo = new UserinfoVO();
//        loginUserInfo.setNum(loginUserNum);
//        loginUserInfo = userinfoService.selectOne(loginUserInfo);
//
//        // 3. 로그인 유저 정보를, 화면에 보여주게 설정.
//        log.info("user_id..{}", loginUserInfo.getUser_id());
//        log.info("save_name..{}", loginUserInfo.getSave_name());
//
//        model.addAttribute("loginUserInfo", loginUserInfo);
//        //        수정 부분

//        // 아래꺼 지우면 에러날수도있음.
//        vo.setUser_id(loginUserInfo.getUser_id());
//        vo.setSave_name(loginUserInfo.getSave_name());

        String id = (String) session.getAttribute("user_id");
        log.info("user_id ★★★★★★ ...{}", id);
        UserinfoVO User_id_ses = new UserinfoVO();
        User_id_ses.setUser_id(id);

        UserinfoVO User_id_sesession = service.user_list(User_id_ses);
        log.info("User_id_sesession...{}",User_id_sesession );
        model.addAttribute("loginUserInfo", User_id_sesession);

        log.info("!!!vo!!!!..{}", vo);

        vo.setUser_id((String)session.getAttribute("user_id"));
        CommunityVO good_count_mem = service.select_all_goodList(vo);

        model.addAttribute("good_count_mem", good_count_mem);
        log.info("good_count_mem..{}", good_count_mem);

        return "community/selectOne";
    }

    @RequestMapping(value = "/community_insert.do", method = RequestMethod.GET)
    public String community_insert(RedirectAttributes redirectAttributes) {
        log.info("community_insert.do().....");

// 로그인 상태를 확인하는 로직
        String userId = (String) session.getAttribute("user_id");
        if (userId == null) {
            // 로그인되지 않은 경우, 로그인 페이지로 리디렉션
            redirectAttributes.addFlashAttribute("message", "로그인이 필요합니다.");
            return "redirect:/login.do";  // 로그인 페이지 URL로 변경해야 함
        }

        return "community/insert";
    }

    @RequestMapping(value = "/community_insertOK.do", method = RequestMethod.POST)
    public String community_insertOK(CommunityVO vo) throws IllegalStateException, IOException {

        log.info("community_insertOK.do().....{}", vo);

        int fileNameLength = vo.getFile().getOriginalFilename().length();
        String getOriginalFileName = vo.getFile().getOriginalFilename();

        log.info("getOriginalFilename : {}", getOriginalFileName);
        log.info("fileNameLength : {}", fileNameLength);

        vo.setSave_img(getOriginalFileName.length() == 0 ? "아이유.png" : getOriginalFileName);

        if (getOriginalFileName.length() == 0) {
            vo.setSave_img("아이유.png");

        } else {
            vo.setSave_img(getOriginalFileName);
            // 웹 어플리케이션이 갖는 실제 경로 : 이미지를 업로드할 대상 경로를 찾아서 파일 저장
            String realPath = sContext.getRealPath("resources/uploadimg");

            log.info("realPath : {}", realPath);

            File f = new File(realPath + "/" + vo.getSave_img());

            vo.getFile().transferTo(f);

            //// create thumbnail image/////////
			/*BufferedImage original_buffer_img = ImageIO.read(f);
			BufferedImage thumb_buffer_img = new BufferedImage(50, 50, BufferedImage.TYPE_3BYTE_BGR);
			Graphics2D graphic = thumb_buffer_img.createGraphics();
			graphic.drawImage(original_buffer_img, 0, 0, 50, 50, null);
			File thumb_file = new File(realPath + "/thumb_" + vo.getSave_img());
			String formatName = vo.getSave_img().substring(vo.getSave_img().lastIndexOf(".")+1);
			log.info("formatName : {}", formatName);
			ImageIO.write(thumb_buffer_img, formatName, thumb_file);*/

        } // end else

        log.info("{}", vo);
        int result = service.insert(vo);

        log.info("result : {}", result);
        if (result == 1)
            return "redirect:community_selectAll.do";
        else
            return "redirect:community_insert.do";
    }
	/*@RequestMapping(value = "/community_insertOK.do", method = RequestMethod.POST)
	public String community_insertOK(CommunityVO vo){

		log.info("/community_insertOK.do...{}", vo);
		
		int result = service.insert(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			return "redirect:community_selectAll.do";
		}else {
			return "redirect:community_insert.do";
		}
		
	}*/

    @RequestMapping(value = "/community_update.do", method = RequestMethod.GET)
    public String community_update(CommunityVO vo, Model model) {
        log.info("/community_update.do...{}", vo);

        CommunityVO vo2 = service.selectOne(vo);

        model.addAttribute("vo2", vo2);
        log.info("vo2...{}", vo2);

        return "community/update";
    }

    @RequestMapping(value = "/community_updateOK.do", method = RequestMethod.POST)
    public String community_updateOK(CommunityVO vo) throws IllegalStateException, IOException {
        log.info("community_updateOK.do....{}", vo);

        log.info("사진 변경...{}", vo.getFile());
        int fileNameLength = vo.getFile().getOriginalFilename().length();
        String getOriginalFileName = vo.getFile().getOriginalFilename();
        log.info("getOriginalFilename : {}", getOriginalFileName);
        log.info("fileNameLength : {}", fileNameLength);
        vo.setSave_img(getOriginalFileName.length() == 0 ? vo.getSave_img() : getOriginalFileName);

        CommunityVO vo2 = new CommunityVO();
        vo2.setNum(vo.getNum());
        vo2 = service.selectOne(vo2);
        log.info("new vo2 vo2 vo2..{}", vo2);
        if (vo.getSave_img() == null || vo.getSave_img().equals("")) {
            vo.setSave_img(vo2.getSave_img());
        }

        if (getOriginalFileName.length() != 0) {
            vo.setSave_img(getOriginalFileName);
            // 웹 어플리케이션이 갖는 실제 경로 : 이미지를 업로드할 대상 경로를 찾아서 파일 저장
            String realPath = sContext.getRealPath("resources/uploadimg");
            log.info("realPath : {}", realPath);
            File f = new File(realPath + "/" + vo.getSave_img());
            vo.getFile().transferTo(f);
        }
        log.info("최종 변경 : {}", vo.getSave_img());

        int result = service.update(vo);
        log.info("result...{}", result);

        if (result == 1) {
            return "redirect:community_selectOne.do?num=" + vo.getNum();
        } else {
            return "redirect:community_update.do?num=" + vo.getNum();
        }
    }

    @RequestMapping(value = "/community_deleteOK.do", method = RequestMethod.GET)
    public String community_deleteOK(CommunityVO vo) {
        log.info("/community_deleteOK.do...{}", vo);

        int result = service.delete(vo);
        log.info("result...{}", result);

        if (result == 1) {
            return "redirect:community_selectAll.do";
        } else {
            return "redirect:community_selectOne.do?num=" + vo.getNum();
        }

    }

    @RequestMapping(value = "/community_good_count_up.do", method = RequestMethod.GET)
    public String good_count_up(CommunityVO vo) {
        log.info("community_good_count_up.do...{}", vo);
        service.good_count_up(vo);
        service.adding_good_count_list(vo);


        return "redirect:community_selectOne.do?num=" + vo.getNum();


    }

    @RequestMapping(value = "/community_good_count_down.do", method = RequestMethod.GET)
    public String good_count_down(CommunityVO vo) {
        log.info("community_good_count_down.do...{}", vo);
        service.good_count_down(vo);
        service.del_good_count_list(vo);


        return "redirect:community_selectOne.do?num=" + vo.getNum();


    }

}
