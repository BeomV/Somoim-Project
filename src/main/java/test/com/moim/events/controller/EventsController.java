package test.com.moim.events.controller;

import lombok.extern.slf4j.Slf4j;
import lombok.extern.slf4j.XSlf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import test.com.moim.events.model.EventsVO;
import test.com.moim.events.service.EventsService;

import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
public class EventsController {

    @Autowired
    EventsService service;

    @Autowired
    HttpSession session;

    @RequestMapping(value = "/events_main.do", method = RequestMethod.GET)
    public String events_main() {

        log.info("events_main.do()......");

        return "event/event_List";
    }
    @RequestMapping(value = "/eventSelectAll.do", method = RequestMethod.GET)
    public String eventSelectAll(Model model){
        String userId = (String) session.getAttribute("user_id");

        model.addAttribute("user_id", userId);
        log.info("userId..{}", userId);

        List<EventsVO> vos = service.selectAll();
        log.info("vos...{}", vos);
        model.addAttribute("vos", vos);
        return "event/event_List";
    }

    @RequestMapping(value = "/eventsSelctOne.do", method = RequestMethod.GET)
    public String eventsSelectOne(EventsVO vo, Model model){
        log.info("EvnetsVO...{}", vo);
        EventsVO vo2 = service.selectOne(vo);
        log.info("vo2...{}", vo2);
        model.addAttribute("vo2", vo2);
        return "event/event";
    }

    @RequestMapping(value = "/InsertEvents.do", method = RequestMethod.GET)
    public String InsertEvents(EventsVO vo, Model model){
        String userId = (String) session.getAttribute("user_id");

        model.addAttribute("user_id", userId);
        log.info("userId..{}", userId);


        return "event/InsertEvents";
    }


    @RequestMapping(value = "/InsertOKEvents.do", method = RequestMethod.POST)
    public String InsertOKEvents(EventsVO vo, Model model){
        String userId = (String) session.getAttribute("user_id");

        model.addAttribute("user_id", userId);
        log.info("userId..{}", userId);
        log.info("vovovovovovovovovo..{}", vo);
        int result = service.insert(vo);

        if(result==1){
            log.info("작성완 ㅋ");
            return "redirect:eventSelectAll.do";

        }else{
            return "redirect:InsertEvents.do";
        }

    }
    @RequestMapping(value = "/updateEvents.do", method = RequestMethod.GET)
    public String updateEvents(EventsVO vo, Model model){
        log.info("update********* vo..{}", vo);
        String userId = (String) session.getAttribute("user_id");
        model.addAttribute("user_id", userId);

        log.info("userId..{}", userId);

        EventsVO vo2 =new EventsVO();
        vo2 = service.selectOne(vo);
model.addAttribute("vo2", vo2);
log.info("new vo2!!!!!!!!!!..{}", vo2);

        return "event/updateEvents";
    }



    @RequestMapping(value = "/updateOKEvents.do", method = RequestMethod.GET)
    public String updateOKEvents(EventsVO vo, Model model){
        String userId = (String) session.getAttribute("user_id");

        model.addAttribute("user_id", userId);
        log.info("userId..{}", userId);
        log.info("update vovovovo..{}", vo);

        EventsVO vo2 = new EventsVO();
        vo2.setNum(vo.getNum());
        vo2 = service.selectOne(vo2);
        log.info("new vo2 vo2 vo2..{}",vo2 );
        if (vo.getSave_name() == null || vo.getSave_name().equals("")) {
            vo.setSave_name(vo2.getSave_name());
        }
log.info("vo..{}", vo);
        int result = service.update(vo);

        if(result==1){
            log.info("작성완 ㅋ");
            return "redirect:eventSelectAll.do";

        }else{
            return "redirect:updateEvents.do?num="+vo.getNum();
        }

    }

    @RequestMapping(value = "/deleteOKEvents.do", method = RequestMethod.GET)
    public String deleteOKEvents(EventsVO vo, Model model){
        String userId = (String) session.getAttribute("user_id");

        model.addAttribute("user_id", userId);
        log.info("userId..{}", userId);
        log.info("update vovovovo..{}", vo);
        int result = service.delete(vo);

        if(result==1){
            log.info("삭제완 ㅋ");
            return "redirect:eventSelectAll.do";

        }else{
            return "redirect:eventSelectAll.do?num="+vo.getNum();
        }

    }

}