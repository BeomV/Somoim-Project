package test.com.moim.total_searching.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import test.com.moim.community.model.CommunityVO;
import test.com.moim.community.service.CommunityService;
import test.com.moim.cs.Service.CsService;
import test.com.moim.cs.model.CsVO;
import test.com.moim.somoim.model.SomoimVO;
import test.com.moim.somoim.service.SomoimService;
import test.com.moim.total_searching.service.total_searchingService;

import java.util.List;
@Controller
@Slf4j
public class total_searchingController {
    // 단순 검색을 위한 서비스 오토 와이어드 근데 의미가 있나?
    @Autowired
    total_searchingService service;

    @RequestMapping(value = "/searching_all.do", method = RequestMethod.GET)
    public String home(Model model, SomoimVO som_vo, CommunityVO com_vo, CsVO cs_vo, String searchKey) {

        log.info("searchKey.do()......{}", searchKey);

        List<SomoimVO> som_vos = service.SearchList_som(searchKey);
        List<CommunityVO> com_vos = service.SearchList_com(searchKey);
        List<CsVO> cs_vos = service.SearchList_cs(searchKey);

        log.info("som_vos.do()......{}",som_vos);
        log.info("com_vos.do()......{}",com_vos);
        log.info("cs_vos.do()......{}",cs_vos);

        model.addAttribute("som_vos", som_vos);
        model.addAttribute("com_vos", com_vos);
        model.addAttribute("cs_vos", cs_vos);



        return "total_search";


    }

}
