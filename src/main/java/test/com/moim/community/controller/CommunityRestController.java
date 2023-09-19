package test.com.moim.community.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import test.com.moim.community.model.CommunityVO;
import test.com.moim.community.service.CommunityService;
import test.com.moim.cs.Service.CsService;
import test.com.moim.cs.model.CsVO;

import java.util.List;

@Slf4j
@Controller
public class CommunityRestController {

	@Autowired
	CommunityService service;
	@RequestMapping(value = "/json_community_selectAll.do", method = RequestMethod.GET)
	@ResponseBody
	public List<CommunityVO> json_community_selectAll() {
		log.info("/json_community_selectAll.do");

		// selectOne
		List<CommunityVO> c_vos = service.selectAll();


		log.info("{}", c_vos);

		return c_vos;
	}
}
