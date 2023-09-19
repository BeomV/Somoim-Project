package test.com.moim.com_comments.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
import test.com.moim.com_comments.model.som_comm_commentsVO;
import test.com.moim.com_comments.service.som_comm_comments_Service;

@Slf4j
@Controller
public class som_com_comments_controller {
	
	@Autowired
	som_comm_comments_Service commService;
	
	@RequestMapping(value = "/som_dcomm_updateOK.do", method = RequestMethod.GET)
	public String som_dcomm_updateOK(som_comm_commentsVO vo) {
		log.info("/som_dcomm_updateOK.do...{}", vo);
		log.info("/parent.do...{}", vo.getParent_com());
		log.info("/num.do...{}", vo.getNum());
		log.info("/getContentgetContentgetContentgetContent.do...{}", vo.getContent());

		int result = commService.update(vo);
		log.info("result...{}", result);
		
		return "redirect:join_selectOne.do?num="+vo.getSom_board_num();
		
	}
	
	@RequestMapping(value = "/som_dcomm_deleteOK.do", method = RequestMethod.GET)
	public String som_dcomm_deleteOK(som_comm_commentsVO vo) {
		log.info("/som_comm_deleteOK.do...{}", vo);
		int result = commService.delete(vo);

		log.info("result...{}", result);

		return "redirect:join_selectOne.do?num="+vo.getSom_board_num();
	}
	
	@RequestMapping(value = "/som_dcomm_insertOK.do", method = RequestMethod.GET)
	public String som_dcomm_insertOK(som_comm_commentsVO vo) {
		log.info("som_dcomm_insertOK!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!", vo);
		
		log.info("VOVOVOVOVOOVOVOVOVO....{}", vo);
		int result = commService.insert(vo);
		
		log.info("result...{}", result);
		
		return "redirect:join_selectOne.do?num="+vo.getSom_board_num();
		
	}
	

}
