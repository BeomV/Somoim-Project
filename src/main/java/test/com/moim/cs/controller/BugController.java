package test.com.moim.cs.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import test.com.moim.cs.Service.bug_Service;
import test.com.moim.cs.model.BugVO;

import javax.servlet.http.HttpSession;


@Slf4j
@Controller
public class BugController {
	
	@Autowired
	bug_Service bugservice;
	
	@Autowired
	HttpSession session;
	
	

	@RequestMapping(value = "/bug_notice_insert.do", method = RequestMethod.GET)
	public String bug_notice_insert(Model model) {
		log.info("bug_notice_insert.do().....{}");
		String userId = (String) session.getAttribute("user_id");
	     model.addAttribute("user_id", userId);

		return "cs/bug";
	}

	@RequestMapping(value = "/bug_notice_insertOK.do", method = RequestMethod.GET)
	public String bug_notice_insertOK(Model model, BugVO vo) {
		String userId = (String) session.getAttribute("user_id");
		log.info("bug_notice_insertOK.do().....{}", vo);
	     model.addAttribute("user_id", userId);
		int result = bugservice.insert(vo);
		return "cs/bug_result";
	}

}
