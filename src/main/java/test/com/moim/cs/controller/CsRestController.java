package test.com.moim.cs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import test.com.moim.cs.Service.CsService;
import test.com.moim.cs.model.CsVO;
@Slf4j
@Controller
public class CsRestController {
	@Autowired
	CsService service;
	@RequestMapping(value = "/json_selectAll.do", method = RequestMethod.GET)
	@ResponseBody
	public List<CsVO> json_selectAll() {
		log.info("/json_selectAll.do");

		// selectOne
		List<CsVO> vos = service.selectAll();

		
		log.info("{}", vos);

		return vos;
	}

}
