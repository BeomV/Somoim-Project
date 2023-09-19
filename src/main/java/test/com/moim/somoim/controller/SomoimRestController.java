package test.com.moim.somoim.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import test.com.moim.board.model.Somoim_BoardVO;
import test.com.moim.member.service.MemberService;
import test.com.moim.somoim.model.SomoimVO;
import test.com.moim.somoim.service.SomoimService;
import test.com.moim.userinfo.service.UserinfoService;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.util.List;


@Slf4j
@Controller
public class SomoimRestController {

    @Autowired
    SomoimService service;

    @Autowired
    MemberService memberService;

    @Autowired
    UserinfoService userinfoService;

    @Autowired
    ServletContext sContext;

    @Autowired
    HttpSession session;

    @ResponseBody
    @RequestMapping(value = "/json_somoim_selectAll.do", method = RequestMethod.GET)
    public List<SomoimVO> json_join_selectAll(SomoimVO vo){
        log.info("SomoimVO..{}", vo);
        List<SomoimVO> jsonsomoim= service.selectAll(vo);
        log.info("SomoimVO..{}", jsonsomoim);
        return jsonsomoim;
    }

    @ResponseBody
    @RequestMapping(value = "/mysomoim_selectAll.do", method = RequestMethod.GET)
    public List<SomoimVO> mysomoim_selectAll(String user_id){
    	log.info("user_id : {}", user_id);

    	List<SomoimVO> vos = service.mysomoim_selectAll(user_id);
    	for (SomoimVO x : vos) {
			log.info(x.getSom_title());
			log.info(x.getSomoim_img());
			log.info("{}", x.getNum());
		}

    	return vos;
    }

    @ResponseBody
    @RequestMapping(value = "/somoimbyme_selectAll.do", method = RequestMethod.GET)
    public List<SomoimVO> somoimbyme_selectAll(String user_id){
    	log.info("user_id : {}", user_id);

    	List<SomoimVO> vos = service.somoimbyme_selectAll(user_id);
    	for (SomoimVO x : vos) {
    		log.info(x.getSom_title());
    		log.info(x.getSomoim_img());
    		log.info("{}", x.getNum());
    	}

    	return vos;
    }

    @ResponseBody
    @RequestMapping(value = "/somtitleCheck.do", method = RequestMethod.GET)
    public int somtitleCheck(String som_title){
        log.info("넘어온 som_title : {}", som_title);

        SomoimVO vo = service.somtitleCheck(som_title);
        if(vo==null) {
            return 1;
        } else
            return 0;
    }




}
