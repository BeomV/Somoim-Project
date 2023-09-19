package test.com.moim.somoim.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import test.com.moim.member.model.MemberVO;
import test.com.moim.member.service.MemberService;
import test.com.moim.paging.model.PagingVO;
import test.com.moim.somoim.model.SomoimVO;
import test.com.moim.somoim.service.SomoimService;
import test.com.moim.userinfo.model.UserinfoVO;
import test.com.moim.userinfo.service.UserinfoService;


@Slf4j
@Controller
public class SomoimController {

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


	@RequestMapping(value = "/somz_selectAll.do", method = RequestMethod.GET)
	public String som_selectAll(SomoimVO vo, Model model) {
		log.info("som_selectAll.do().....");
		log.info("-------");

		List<SomoimVO> vos = service.selectAll(vo);
//		int total = service.countSomoim();

		model.addAttribute("viewAll",vos);

		return "board/som_selectAll2";
	}

	@RequestMapping(value = "/som_selectOne.do", method = RequestMethod.GET)
	public String som_selectOne(SomoimVO vo, Model model) {
		log.info("som_selectOne.do().....{}", vo);

		SomoimVO vo2 = service.selectOne(vo);
		log.info("user_id...{}", (String)session.getAttribute("user_id"));

		String user_id = (String) session.getAttribute("user_id");
		if (user_id == null) {
			return "redirect:/login.do"; // 로그인 페이지 경로로 변경해주세요.
		}
		model.addAttribute("user_id", user_id);
		log.info("vo2..{}",vo2);
		log.info("user_id : {}", user_id);



		UserinfoVO uvo = new UserinfoVO();
		uvo.setUser_id(user_id);

		log.info("이걸확인해!!{}", uvo.getUser_id());
		UserinfoVO uvo2 = service.searchSavename(uvo);
		log.info("uvo2..{}", uvo);

		log.info("이것도{}", uvo2.getSave_name());
		log.info("profile!!!:{}", uvo2.getSave_name());

		session.setAttribute("num",vo.getNum());


		List<SomoimVO> somoimUser_id = service.selectSomoim_user_id(vo2);
		log.info("somoimUser_id)..{}", somoimUser_id);

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String formattedDate = dateFormat.format(vo2.getCreate_date());
//		MemberVO vo3 = new MemberVO();
//		vo3.setNum((Integer)session.getAttribute("num"));
//		log.info("......여기의 num 은 : {}", vo3.getNum());
//		
//		List<MemberVO> vos = memberService.profileCheck(vo3);
//		for (MemberVO y : vos) {
//			log.info("...확인!!!!!!!!!!!!!!!!!!!!!!!!!!!{}", y.getSave_name());
//		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("vo2", vo2);
		map.put("uvo2", uvo2);
		map.put("somoimUser_id", somoimUser_id);
		map.put("formattedDate", formattedDate);
		model.addAllAttributes(map);

		return "board/som_selectOne";
	}

	@RequestMapping(value = "/som_searchList.do", method = RequestMethod.GET)
	public String som_searchList(String searchKey, String searchWord, String category, Model model) {
		log.info("som_searchList.do().....{}, {}", searchKey, searchWord);
		log.info("------------{}", category);


		List<SomoimVO> vos = service.searchList(searchKey, searchWord, category);

		model.addAttribute("viewAll", vos);

		return "board/som_selectAll2";
	}

	@RequestMapping(value = "/som_insert.do", method = RequestMethod.GET)
	public String som_insert() {


		log.info("som_insert.do().....");

		return "board/som_insert";
	}

	@RequestMapping(value = "/som_insertOK.do", method = RequestMethod.POST)
	public String som_insertOK(SomoimVO vo) throws IllegalStateException, IOException {

		log.info("som_insertOK.do().....{}", vo);

		int fileNameLength = vo.getFile().getOriginalFilename().length();
		String getOriginalFileName = vo.getFile().getOriginalFilename();

		log.info("getOriginalFilename : {}", getOriginalFileName);
		log.info("fileNameLength : {}", fileNameLength);

		vo.setSomoim_img(getOriginalFileName.length() == 0 ? "아이유.png" : getOriginalFileName);

		if (getOriginalFileName.length() == 0) {
			vo.setSomoim_img("아이유.png");

		} else {
			vo.setSomoim_img(getOriginalFileName);
			// 웹 어플리케이션이 갖는 실제 경로 : 이미지를 업로드할 대상 경로를 찾아서 파일 저장
			String realPath = sContext.getRealPath("resources/uploadimg");

			log.info("realPath : {}", realPath);

			File f = new File(realPath + "/" + vo.getSomoim_img());

			vo.getFile().transferTo(f);

			//// create thumbnail image/////////
//			BufferedImage original_buffer_img = ImageIO.read(f);
//			BufferedImage thumb_buffer_img = new BufferedImage(50, 50, BufferedImage.TYPE_3BYTE_BGR);
//			Graphics2D graphic = thumb_buffer_img.createGraphics();
//			graphic.drawImage(original_buffer_img, 0, 0, 50, 50, null);
//			File thumb_file = new File(realPath + "/thumb_" + vo.getSomoim_img());
//			String formatName = vo.getSomoim_img().substring(vo.getSomoim_img().lastIndexOf(".")+1);
//			log.info("formatName : {}", formatName);
//			ImageIO.write(thumb_buffer_img, formatName, thumb_file);

		} // end else

		log.info("{}", vo);
		int result = service.insert(vo);

//		MemberVO vo2 = new MemberVO();
//		vo2.setUser_id(vo.getSomoim_master());
//		vo2.setSom_title(vo.getSom_title());
//		vo2.setSomoim_num(vo.getNum());
//		log.info("==========================={}", vo.getNum());
//
//		List<MemberVO> vos = memberService.searchSavename(vo.getSomoim_master());
//		log.info(".....save_name!!!!!!!!!!!!!!!!!!!{}", vos.get(0));
//
//
////		vo2.setSave_name(vo3.getSave_name());
//
//		int result2 = memberService.insert(vo2);
//		if(result2==1) {
//			log.info("완료!");
//		} else
//			log.info("실패....");

		log.info("result : {}", result);
		if (result==1)
			return "redirect:som_selectAll.do";
		else
			return "redirect:som_insert.do";

	}

	@RequestMapping(value = "/som_selectAll.do", method = RequestMethod.GET)
	public String somoimPaging(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {

		int total = service.countSomoim();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "12";
		} else if(nowPage == null) {
			nowPage = "1";
		} else if(cntPerPage == null) {
			cntPerPage = "12";
		}

		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

		log.info("이거 확인하기...{}", vo);

		SomoimVO vo2 = new SomoimVO();
		List<SomoimVO> vos = service.selectAll(vo2);

//		for (SomoimVO x : vos) {
//			log.info("얘도 확인....{}", x);
//		}

		model.addAttribute("vos",vos);
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", service.selectSomoim(vo));


		return "board/som_selectAll";
	}

	@RequestMapping(value = "/som_update.do", method = RequestMethod.GET)
	public String som_update(SomoimVO vo, Model model) {
		log.info("som_update.do().....{}", vo);
		log.info("update 할 소모임의 번호 : {}", vo.getNum());

		SomoimVO vo2 = service.selectOne(vo);
		log.info("...{}", vo2.getSom_title());
		log.info("...{}", vo2.getSom_content());

		model.addAttribute("vo2", vo2);

		return "board/som_update";
	}

	@RequestMapping(value = "/som_updateOK.do", method = RequestMethod.POST)
	public String som_updateOK(SomoimVO vo) throws IllegalStateException, IOException {
		log.info("som_update.do().....바뀐 내역 : {}", vo);

		int fileNameLength = vo.getFile().getOriginalFilename().length();
		String getOriginalFileName = vo.getFile().getOriginalFilename();

		log.info("getOriginalFilename : {}", getOriginalFileName);
		log.info("fileNameLength : {}", fileNameLength);

		vo.setSomoim_img(getOriginalFileName.length() == 0 ? "아이유.png" : getOriginalFileName);

		if (getOriginalFileName.length() == 0) {
			vo.setSomoim_img("아이유.png");

		} else {
			vo.setSomoim_img(getOriginalFileName);
			// 웹 어플리케이션이 갖는 실제 경로 : 이미지를 업로드할 대상 경로를 찾아서 파일 저장
			String realPath = sContext.getRealPath("resources/uploadimg");

			log.info("realPath : {}", realPath);

			File f = new File(realPath + "/" + vo.getSomoim_img());

			vo.getFile().transferTo(f);


		} // end else
		log.info("somoim_img : {}", vo.getSomoim_img());
		log.info("somoim_content : {}", vo.getSom_content());
		log.info("바뀐 somoim_ :{}", vo.getArea());
		log.info("바뀐 카테고리....:{}", vo.getCategory());

		int result = service.update(vo);

		if(result==1)
			return "redirect:som_selectOne.do?num="+vo.getNum()+"&message=success";
		else
			return "redirect:home.do?message=fail";
	}

	@RequestMapping(value = "/som_delete.do", method = RequestMethod.GET)
	public String som_delete(String message, Model model, SomoimVO vo, HttpServletRequest request) {
		log.info("som_delete.do().....");
		log.info("소모임 번호 잘 넘어오나? {}", vo.getNum());
		String num = request.getParameter("num");
		log.info("파라미터는 넘어 오나? {}", num);

//		session.invalidate();

		Map<String, String> map = new HashMap<String, String>();
		map.put("message", message);
		map.put("num", num);

		if (message != null)
			message = "아이디/비밀번호를 확인하세요";
		model.addAllAttributes(map);

		return "board/deletebeforelogin";
	}

	@RequestMapping(value = "/som_deleteOK.do", method = RequestMethod.POST)
	public String som_deleteOK(UserinfoVO vo, HttpServletRequest request, SomoimVO somoim) {
		log.info("som_delete.do().....{}", vo);
		String num = request.getParameter("num");
		String user_id = (String) session.getAttribute("user_id");
		UserinfoVO vo2 = userinfoService.login(vo);


		log.info("vo2..... 로그인 성공?{}", vo2);
		log.info("num : {}", num);
		log.info("somoim....{}", somoim.getNum());


		int result = service.delete(somoim);
		String path = "";
		if(vo2==null) {
			log.info("로그인 실패");
			return "redirect:som_delete.do?num="+num+"&user_id="+user_id;

		}
		else {
			log.info("로그인 성공");
			return "redirect:som_selectAll.do";

		}


	}




}