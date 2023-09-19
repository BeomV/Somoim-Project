package test.com.moim.message.controller;


import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import test.com.moim.community.model.CommunityVO;
import test.com.moim.message.model.MessageVO;
import test.com.moim.message.service.MessageService;
import test.com.moim.userinfo.model.UserinfoVO;
import test.com.moim.userinfo.service.UserinfoService;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@Slf4j
public class MessageController {

    @Autowired
    MessageService service;

    @Autowired
    HttpSession session;

    @Autowired
    UserinfoService user_service;
    @ResponseBody
    @RequestMapping(value = "/josn_message.do" ,method = RequestMethod.GET)
    public List<MessageVO> josn_message(Model model, MessageVO vo) {

        log.info("josn_message.do()......");
        String user_id = (String)session.getAttribute("user_id");
        vo.setUser_id((String)session.getAttribute("user_id"));
        log.info("vo입니다. 제이슨!..{}", vo );
        List<MessageVO> vos = service.message_selectAll(vo);
        log.info("vos는 impl을 다녀온 값입니다!...{}", vos);

        return vos;


    }


    @RequestMapping(value = "/message_selectAll.do" ,method = RequestMethod.GET)
    public String message_selectAll(Model model, MessageVO vo, UserinfoVO user_vo) {
        log.info("josn_message_insertOK...vo...{}", vo);
        log.info("josn_message_insertOK.do()......");
        vo.setUser_id((String) session.getAttribute("user_id"));
        List<MessageVO> mes_selectAll = service.message_selectAll(vo);
        System.out.println("mes_selectAll : " + mes_selectAll);
        model.addAttribute("mes_selectAll", mes_selectAll);
        List<UserinfoVO> unser_vos = user_service.selectAll();
        model.addAttribute("unser_vos", unser_vos);

        return "mypage/mypage";
    }


    @RequestMapping(value = "/message_insertOK.do" ,method = RequestMethod.GET)
    public String josn_message_insertOK(Model model, MessageVO vo) {
        log.info("josn_message_insertOK...vo...{}", vo);
        log.info("josn_message_insertOK.do()......");
        int result = service.mes_insert(vo);


        return "redirect:mypage.do";


    }

    @RequestMapping(value = "/popup_message_sedningOK.do" ,method = RequestMethod.POST)
    public String popup_message_sedningOK(Model model, MessageVO vo) {
        log.info("popup_message_sedningOK...vo...{}", vo);
        log.info("popup_message_sedningOK.do()......");
        int result = service.mes_insert(vo);

        if (result > 0) {
            return "closeWindow";
        } else {
            return "redirect:mypage.do";
        }
    }




    @RequestMapping(value = "/message_deleteOK.do" ,method = RequestMethod.GET)
    public String message_deleteOK(Model model, MessageVO vo) {

        log.info("message_deleteOK.do()......");
        int result = service.mes_delete(vo);

        return "redirect:mypage.do";


    }

    @RequestMapping(value = "/josn_message_update.do" ,method = RequestMethod.GET)
    public String josn_message_update(Model model, MessageVO vo) {

        log.info("josn_message_insertOK.do()......");
        int result = service.mes_delete(vo);

        return "redirect:mypage.do";


    }

}
