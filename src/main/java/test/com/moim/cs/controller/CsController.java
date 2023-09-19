package test.com.moim.cs.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import test.com.moim.cs.Service.CsService;
import test.com.moim.cs.model.CsVO;

import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
public class CsController {
	
	@Autowired
	CsService service;
	
	@Autowired
	HttpSession session;
	

	@RequestMapping(value = "/cs_notice.do", method = RequestMethod.GET)
	public String cs_notice(Model model) {
		log.info("cs_notice.do().....{}");
		String userId = (String) session.getAttribute("user_id");
		model.addAttribute("user_id", userId);
		log.info("user_id().....{}", userId);

		
		List<CsVO> vos = service.selectAll();
		log.info("join_selectAll().....");

		for (CsVO vo : vos) {
			log.info(vo.toString());
		}
		model.addAttribute("vos",vos);
	

		return "cs/CS_notice_selectAll";

	
}
	@RequestMapping(value = "/cs_notice_insert.do", method = RequestMethod.GET)
	public String cs_notice_insert(Model model) {
		log.info("cs_notice_insert.do().....{}");
		String userId = (String) session.getAttribute("user_id");

	     model.addAttribute("user_id", userId);
		return "cs/Cs_insert";
	}

	@RequestMapping(value = "/cs_notice_insertOK.do", method = RequestMethod.GET)
	public String cs_notice_insertOK(Model model, CsVO vo) {
		log.info("cs_notice_insertOK.do().....{}", vo);
		String userId = (String) session.getAttribute("user_id");

	     model.addAttribute("user_id", userId);
		int result = service.insert(vo);
		return "redirect:cs_notice.do";
	}

	@RequestMapping(value = "/cs_notice_selectOne.do", method = RequestMethod.GET)
	public String cs_notice_selectOne(CsVO vo, Model model) {
		log.info("cs_notice_selectOne.do().....");

		log.info("vo.getnum..{}", vo.getNum());
		CsVO vo2 = service.selectOne(vo);

		log.info("test...{}",vo2);

		model.addAttribute("vo2",vo2);

		return "cs/Cs_selectOne";
	}
	
	@RequestMapping(value = "/notice.do", method = RequestMethod.GET)
	
	public String home() {
		log.info("home.do().....");
		return "cs/notice";

}

	@RequestMapping(value = "/cs_notice_deleteOK.do", method = RequestMethod.GET)
	public String cs_notice_deleteOK(Model model, CsVO vo) {
		log.info("cs_notice_deleteOK.do().....{}", vo);
		String userId = (String) session.getAttribute("user_id");

		model.addAttribute("user_id", userId);
		int result = service.delete(vo);
		return "redirect:cs_notice.do";
	}


	@RequestMapping(value = "/cs_notice_update.do", method = RequestMethod.GET)
	public String cs_notice_update(Model model, CsVO vo) {
		log.info("cs_notice_update.do().....{}", vo);
		String userId = (String) session.getAttribute("user_id");
		log.info("update num...{}", vo.getNum());
		model.addAttribute("user_id", userId);
		model.addAttribute("vo", vo);
		return "cs/Cs_update";
	}




	@RequestMapping(value = "/cs_notice_updateOK.do", method = RequestMethod.GET)
	public String cs_notice_updateOK(Model model, CsVO vo) {
		log.info("cs_notice_updateOK.do().....{}", vo);
		String userId = (String) session.getAttribute("user_id");
		log.info("update num...{}", vo.getNum());
		model.addAttribute("user_id", userId);
		int result = service.update(vo);
		return "redirect:cs_notice.do";
	}



}
