package test.com.moim;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
import test.com.moim.community.model.CommunityVO;
import test.com.moim.community.service.CommunityService;
import test.com.moim.somoim.model.SomoimVO;
import test.com.moim.somoim.service.SomoimService;

import java.util.List;

@Slf4j
@Controller
public class HomeController {
	@Autowired
	SomoimService service;

	@Autowired
	CommunityService comu_service;

	@RequestMapping(value = {"/","home.do"}, method = RequestMethod.GET)
	public String home(Model model, SomoimVO vo) {
		
		log.info("home.do()......");


		List<SomoimVO> vos = service.selectAll(vo);
		model.addAttribute("vos",vos);
		List<CommunityVO> comu_vos = comu_service.selectAll();
		model.addAttribute("comu_vos",comu_vos);
		return "home";


	}

	
}
