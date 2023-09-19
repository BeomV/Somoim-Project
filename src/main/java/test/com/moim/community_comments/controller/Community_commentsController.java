package test.com.moim.community_comments.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import test.com.moim.comments.model.som_commentsVO;
import test.com.moim.comments.service.som_comments_Service;
import test.com.moim.community_comments.model.Community_commentsVO;
import test.com.moim.community_comments.service.Community_commentsService;

@Slf4j
@Controller
public class Community_commentsController {
	
	@Autowired
	Community_commentsService commService;



	
	@RequestMapping(value = "/Community_comments_updateOK.do", method = RequestMethod.GET)
	public String Community_comments_updateOK(Community_commentsVO vo) {
		log.info("/Community_comments_updateOK.do...{}", vo);
		
		int result = commService.update(vo);
		log.info("result...{}", result);
		
		return "redirect:community_selectOne.do?num="+vo.getBoard_num();
		
	}
	
	@RequestMapping(value = "/Community_comments_deleteOK.do", method = RequestMethod.GET)
	public String Community_comments_deleteOK(Community_commentsVO vo) {
		log.info("/-------------------------Community_comments_deleteOK.-----------------o...{}", vo);
		log.info("vo.getNum()....{}", vo.getNum());
		Community_commentsVO vo2 = new Community_commentsVO();
		vo2.setNum(vo.getNum());
		vo2.setBoard_num(vo.getBoard_num());
		log.info("vo2", vo2);
		int result = commService.delete(vo2);

		log.info("result...{}", result);

			return "redirect:community_selectOne.do?num="+vo.getBoard_num();

	}

	@RequestMapping(value = "/Community_comments_insertOK.do", method = RequestMethod.GET)
	public String Community_comments_insertOK(Community_commentsVO vo) {

		log.info("community_comments_insertOK...{}", vo);

		// "CONTENT" 컬럼이 NULL 또는 빈 값인지 확인하는 유효성 검사
		if (vo.getContent() == null || vo.getContent().trim().isEmpty()) {
			// 경고 메시지를 추가하거나, 사용자에게 알리는 논리를 추가할 수 있습니다.
			// 여기서는 간단히 로그에 경고 메시지를 출력하도록 하겠습니다.
			log.warn("댓글 내용이 비어있습니다!");
			// 경고 메시지를 뷰로 전달하거나, 뷰에서 자바스크립트 등을 이용하여 경고 팝업을 띄울 수 있습니다.
			// 이 예제에서는 다시 해당 게시물로 리다이렉트합니다.
			return "redirect:community_selectOne.do?num=" + vo.getBoard_num();
		}

		int result = commService.insert(vo);
		log.info("result...{}", result);

		return "redirect:community_selectOne.do?num=" + vo.getBoard_num();
	}
	

}
