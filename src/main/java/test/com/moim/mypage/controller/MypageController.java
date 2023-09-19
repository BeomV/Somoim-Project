package test.com.moim.mypage.controller;


import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import test.com.moim.board.model.Somoim_BoardVO;
import test.com.moim.comments.model.som_commentsVO;
import test.com.moim.community.model.CommunityVO;
import test.com.moim.member.model.MemberVO;
import test.com.moim.mypage.service.MypageService;
import test.com.moim.somoim.model.SomoimVO;
import test.com.moim.userinfo.model.UserinfoVO;
import test.com.moim.userinfo.service.UserinfoService;


@Slf4j
@Controller
public class MypageController {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	MypageService service;
	
	@Autowired
	UserinfoService userService;
	
	@Autowired
	ServletContext sContext;

	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public String mypage(Model model) {
		log.info("mypage open....");
		UserinfoVO vo = new UserinfoVO();
		String user_id = (String)session.getAttribute("user_id");
		vo.setUser_id(user_id);
		log.info(vo.getUser_id());
		
		UserinfoVO vo2 = service.mypageSelectOne(vo);
		
		log.info(vo2.getSave_name());
		log.info(vo2.getName());
		log.info(vo2.getEmail());
		log.info(vo2.getSom_title());
		
		Date mypageBirth =  vo2.getBirthday();
		vo2.setBirthday(mypageBirth);
		
//		SomoimVO vo3 = new SomoimVO();
//		vo3.setSom_title(vo2.getSom_title());
//		
//		String som_title = vo3.getSom_title();
//		for(int i=0; i<som_title.length(); i++) {
//			if(som_title.charAt(i)=='/') {
//				log.info("몇번쨰? :{}", i);
//				
//			}
//		}

		Map<String, Object> map = new HashMap<>();
		map.put("vo2", vo2);
		
		model.addAllAttributes(map);

		return "mypage/mypage";
	}
	
	@RequestMapping(value = "/mypage_update.do", method = RequestMethod.GET)
	public String mypage_update(UserinfoVO vo, Model model) {
		log.info("mypage_update open....{}", vo);
		String user_id =(String) session.getAttribute("user_id");
		vo.setUser_id(user_id);
		
		UserinfoVO vo2 = service.mypageSelectOne(vo);
		log.info("편집할 유저의 정보입니다.....{}", vo2);
		
		model.addAttribute("vo2", vo2);
		
		return "mypage/mypage_update";
	}
	
	@RequestMapping(value = "/mypage_updateOK.do", method = RequestMethod.POST)
	public String mypage_updateOK(UserinfoVO vo) throws IllegalStateException, IOException {
		log.info("mypage_updateOK.do....{}", vo);
		
		
		
		log.info("변경사항.....{}", vo.getName());
		log.info("프로필사진 변경...{}", vo.getFile());
		
		
		int fileNameLength = vo.getFile().getOriginalFilename().length();
		String getOriginalFileName = vo.getFile().getOriginalFilename();

		log.info("getOriginalFilename : {}", getOriginalFileName);
		log.info("fileNameLength : {}", fileNameLength);
		
		vo.setSave_name(getOriginalFileName.length() == 0 ? vo.getSave_name() : getOriginalFileName);
		
		if (getOriginalFileName.length() != 0) {
			vo.setSave_name(getOriginalFileName);
			// 웹 어플리케이션이 갖는 실제 경로 : 이미지를 업로드할 대상 경로를 찾아서 파일 저장
			String realPath = sContext.getRealPath("resources/uploadimg");
			
			log.info("realPath : {}", realPath);

			File f = new File(realPath + "/" + vo.getSave_name());

			vo.getFile().transferTo(f);

		} 
			

		log.info("최종 변경 : {}", vo.getSave_name());
		
		int result = service.mypage_update(vo);
		MemberVO vo2 = new MemberVO();
		vo2.setSave_name(vo.getSave_name());
		vo2.setUser_id((String)session.getAttribute("user_id"));
		
		int result2 = service.mypage_update_member(vo2);
		
		log.info("result : {}", result);
		log.info("모든 save_name 바뀌었는지....{}", result2);
		
		return "redirect:mypage.do";
	}
	
	@ResponseBody
	@RequestMapping(value = "/mypageSelectSomoim.do", method = RequestMethod.GET)
	public List<SomoimVO> mypageSelectSomoim(Model model) {
		log.info("mypageSelectSomoim.do....{}");
		
		String user_id = (String) session.getAttribute("user_id");
		
		List<SomoimVO> vos = service.mypageSelectSomoim(user_id);
		log.info("vo....!!{}", vos);
		
		return vos;
	}
	
	@RequestMapping(value = "/Mypage_myactivity_boardbyme.do", method = RequestMethod.GET)
	public String Mypage_myactivity_boardbyme(Model model, HttpServletRequest request) {
		log.info("Mypage_myactivity_boardbyme.do....{}");
		
		return "mypage/Mypage_myactivity_boardbyme";
	}
	
	@RequestMapping(value = "/Mypage_myactivity_communitybyme.do", method = RequestMethod.GET)
	public String Mypage_myactivity_communitybyme(Model model, HttpServletRequest request) {
		log.info("Mypage_myactivity_boardbyme.do....{}");
		
		return "mypage/Mypage_myactivity_communitybyme";
	}
	
	@ResponseBody
	@RequestMapping(value = "/Rest_Mypage_myactivity_boardbyme.do", method = RequestMethod.GET)
	public List<Somoim_BoardVO> Rest_Mypage_myactivity_boardbyme(HttpServletRequest request) {
		log.info("Mypage_myactivity_boardbyme.do....{}");
		String user_id= request.getParameter("user_id");
		Somoim_BoardVO vo = new Somoim_BoardVO();
		vo.setUser_id(user_id);
		
		List<Somoim_BoardVO> vos = service.mypageMyactivity_boardbyme(vo);
			
		return vos;
	}
	
	@ResponseBody
	@RequestMapping(value = "/Rest_Mypage_myactivity_communitybyme.do", method = RequestMethod.GET)
	public List<CommunityVO> Rest_Mypage_myactivity_communitybyme(HttpServletRequest request) {
		log.info("Rest_Mypage_myactivity_communitybyme.do....{}");
		String user_id= request.getParameter("user_id");
		CommunityVO vo = new CommunityVO();
		vo.setUser_id(user_id);
		
		List<CommunityVO> vos = service.mypageMyactivity_communitybyme(vo);
		
		return vos;
	}
	
	@RequestMapping(value = "/Mypage_myactivity_commbyme.do", method = RequestMethod.GET)
	public String Mypage_myactivity_commbyme() {
		log.info("Mypage_myactivity_commbyme.do().....");
		
		
		
		return "mypage/Mypage_myactivity_commbyme";
	}
	
	@ResponseBody
	@RequestMapping(value = "/Rest_Mypage_myactivity_commbyme.do", method = RequestMethod.GET)
	public List<som_commentsVO> Rest_Mypage_myactivity_commbyme(HttpServletRequest request) {
		log.info("Rest_Mypage_myactivity_commbyme.do().....");
		log.info("Mypage_myactivity_boardbyme.do....{}");
		String user_id= request.getParameter("user_id");
		
		som_commentsVO vo = new som_commentsVO();
		vo.setUser_id(user_id);
		
		List<som_commentsVO> vos = service.mypageMyactivity_commbyme(vo);
		
		return vos;
	}
	
	@RequestMapping(value = "/mypage_myactivity_good.do", method = RequestMethod.GET)
	public String mypage_myactivity_good() {
		log.info("mypage_myactivity_good.do().....");
		return "mypage/mypage_myactivity_good";
	}
	
	@ResponseBody
	@RequestMapping(value = "/Rest_mypage_myactivity_good.do", method = RequestMethod.GET)
	public List<CommunityVO> Rest_mypage_myactivity_good(String user_id) {
		log.info("Rest_Mypage_myactivity_commbyme.do....{}", user_id);
		
		CommunityVO vo = new CommunityVO();
		vo.setUser_id(user_id);
		
		List<CommunityVO> vos = service.mypageMyactivity_good(vo);
		
		return vos;
	}
	
	@RequestMapping(value = "/Mypage_myactivity_likedboard.do", method = RequestMethod.GET)
	public String Mypage_myactivity_likedboard(String user_id, Model model) {
		log.info("Mypage_myactivity_likedboard.do().....");
		log.info("user_id : {}", user_id);
		
		Somoim_BoardVO vo = new Somoim_BoardVO();
		vo.setUser_id(user_id);
		
		List<Somoim_BoardVO> vos = service.mypageMyactivity_likedboard(vo);
			
		model.addAttribute("vos", vos);
		
		return "mypage/Mypage_myactivity_likedboard";
	}
	
	
	
}