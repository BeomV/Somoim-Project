package test.com.moim.board.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import test.com.moim.board.model.*;
import test.com.moim.board.service.BoardService;
import test.com.moim.com_comments.model.som_comm_commentsVO;
import test.com.moim.com_comments.service.som_comm_comments_Service;
import test.com.moim.comments.model.som_commentsVO;
import test.com.moim.comments.service.som_comments_Service;
import test.com.moim.somoim.model.SomoimVO;
import test.com.moim.somoim.service.SomoimService;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * Handles requests for the application home page.
 */

@Slf4j
@Controller


public class BoardController {

    @Autowired
    BoardService service;

    @Autowired
    HttpSession session;

    @Autowired
    ServletContext sContext;

    @Autowired
    SomoimService Somservice;

    @Autowired
    som_comm_comments_Service c_commService;
    @Autowired
    som_comments_Service commService;


//    @RequestMapping(value = "/som_selectAll.do", method = RequestMethod.GET)
//    public String som_selectAll(Model model) {
//        log.info("som_selectAll.do().....{}");
//
//        List<BoardVO> vos = service.selectAll();
//
//        for (BoardVO vo : vos) {
//            log.info(vo.toString());
//        }
//
//        model.addAttribute("vos",vos);
//
//        return "board/som_selectAll";
//    }
//
//    @RequestMapping(value = "/som_insert.do", method = RequestMethod.GET)
//    public String som_insert() {
//        log.info("som_insert.do().....");
//
//
//        return "board/som_insert";
//    }
//
//    @RequestMapping(value = "/som_insertOK.do", method = RequestMethod.POST)
//    public String som_insertOK(BoardVO vo) {
//        log.info("som_insertOK.do().....");
//
//        int result = service.insert(vo);
//        log.info("insertOK...{}",vo);
//        return "board/som_insert";
//    }
//
//    @RequestMapping(value = "/som_selectOne.do", method = RequestMethod.GET)
//    public String som_selectOne(BoardVO vo, Model model) {
//        log.info("som_selectOne.do().....");
//
//        BoardVO vo2 = service.selectOne(vo);
//        log.info("test...{}",vo2);
//
//        model.addAttribute("vo2",vo2);
//
//        session.setAttribute("num",vo.getNum());
//        session.setAttribute("Board_num", vo.getNum());
//        log.info(String.valueOf(vo.getNum()));
//
//
//        return "board/som_selectOne";
//    }

    @RequestMapping(value = "/join_selectAll.do", method = RequestMethod.GET)
    public String join_selectAll(
            @RequestParam(defaultValue = "1") int pageNo,
            @RequestParam(defaultValue = "5") int pageSize,
            Model model, Somoim_BoardVO vo, Somoim_Question_VoteVO Vote_vos, SomoimVO somoimVO) {

        int startRow = (pageNo - 1) * pageSize + 1;
        int endRow = pageNo * pageSize;

        vo.setStartRow(startRow);
        vo.setEndRow(endRow);


        int totalPosts = service.Join_Count(vo);
        int totalPage = (int) Math.ceil((double) totalPosts / pageSize);

        System.out.println("vo입니당깔깔깔깎ㄹ깔깔깔깔깎ㄹ깔깔깔깔깎ㄹ깔"+vo);
        System.out.println("somoimVO깔깔갈깔깔깔깔깔깔"+somoimVO);

        somoimVO.setNum(vo.getSomoim_num());
        SomoimVO somoimVO2 = Somservice.selectOne(somoimVO);

        System.out.println("somoimVO깔깔갈깔깔깔깔깔깔"+somoimVO2);
        model.addAttribute("somoim_top_pic", somoimVO2);
        log.info("join_selectAll().....", vo);

        List<Somoim_BoardVO> vos = service.selectList(vo);

        List<SomoimDto> dtos = new ArrayList<>();  // dto 리스트를 생성

        for(Somoim_BoardVO vo2 : vos){










            log.info(vo2.toString());
            int vo2Num = vo2.getNum();

            SomoimDto dto = new SomoimDto();  // 새로운 dto를 생성
            dto.setBoardVo(vo2);  // dto에 Somoim_BoardVO를 설정

            if (vo2.getVote_num() != 0){
                log.info(String.valueOf(vo2Num));
                Vote_vos.setNum2(vo2Num);

                List<Somoim_Question_VoteVO> vote_vos = service.vote_selectList(Vote_vos);
                for(Somoim_Question_VoteVO vo3 : vote_vos) {
                    log.info("TEST!! :    "+vo3.toString());
                }

                dto.setVoteVos(vote_vos);  // dto에 List<Somoim_Question_VoteVO>를 설정
            }

            List<Somoim_BoardVO> infos = service.select_user_info();
            for (Somoim_BoardVO info : infos) {
                log.info("인포 값"+ info.toString());
                log.info("vo2값"+ vo2.toString());

                if(vo2.getUser_id().equals(info.getUser_id())){
                    vo2.setSave_name(info.getSave_name());
                }

            }

            dtos.add(dto);  // dto 리스트에 dto를 추가
        }

        model.addAttribute("totalPage", totalPage);
        model.addAttribute("dtos", dtos);
        // 모델에 dto 리스트를 추가

        return "board/join_selectAll";
    }


    @RequestMapping(value = "/join_selectOne.do", method = RequestMethod.GET)
    public String join_selectOne(Somoim_BoardVO vo, Model model,Somoim_Question_VoteVO qvo,Somoim_Choice_Vote ch_vo) {
        log.info("join_selectOne.do().....{}", vo);
        List<Somoim_BoardVO> infos = service.select_user_info();
        log.info("infos..{}", infos);


                String userId = (String)session.getAttribute("user_id");
                Somoim_BoardVO user_profile= new Somoim_BoardVO();
                user_profile.setUser_id(userId);

                Somoim_BoardVO User_save_name = service.LOGIN_ID_PROFILE(user_profile);

                model.addAttribute("User_save_name", User_save_name);





        Somoim_BoardVO vo2 = service.selectJoin(vo);
        log.info("test...{}", vo2);
        for (Somoim_BoardVO info : infos) {
            if (vo2.getUser_id().equals(info.getUser_id())) {
                vo2.setSave_name(info.getSave_name());
            }
        }
        log.info("바뀐 test...{}", vo2);


        model.addAttribute("vo2", vo2);


        if(vo2.getVote_num() != 0){

            log.info("getVoteNum..."+vo2.getVote_num());
            qvo.setNum(vo2.getVote_num());

            Somoim_Question_VoteVO qvo2 = service.SELECT_VOTE_NUM(qvo);
            log.info("qvo2_test...{}",qvo2);

            model.addAttribute("qvo2", qvo2);

            ch_vo.setSom_qvote_num(qvo2.getNum());
            List<Somoim_Choice_Vote> ch_vo2 = service.SELECT_CHOICE_ITEM(ch_vo);
            for(Somoim_Choice_Vote vo3 : ch_vo2){
                log.info("여긴가?"+vo3.toString());

            }

            model.addAttribute("ch_vo2",ch_vo2);




        }





        som_commentsVO cvo = new som_commentsVO();
        cvo.setSom_board_num(vo2.getNum());
        cvo.setSave_name(vo2.getSave_name());
        System.out.println("vo2.getNum!!!!!!!!!!!!:" + vo2.getNum());
        cvo.setSomoim_num(vo2.getSomoim_num());
        System.out.println("cvo:" + cvo.toString());
        List<som_commentsVO> coms = commService.selectAll(cvo);


        for (som_commentsVO com : coms) {
            for (Somoim_BoardVO info : infos) {
                log.info("검사 vo 아이디...{}", com.getUser_id());
                log.info("검사 info 저장된 이름...{}", info.getUser_id());
                if (com.getUser_id().equals(info.getUser_id())) {
                    log.info("vo2 저장된 아이디...{}", vo2.getUser_id());
                    log.info("info 저장된 이름...{}", info.getUser_id());
                    if (!com.getSave_name().equals(info.getSave_name())) {
                        log.info("보드에 저장된 아이디...{}", vo2.getUser_id());
                        log.info("보드에 저장된 이름...{}", vo2.getSave_name());
                        log.info("처음 가입 이미지 이름...{}", info.getSave_name());
                        com.setSave_name(info.getSave_name());
                        log.info("바뀐거 ::: vo2.getSave_name...{}", com.getSave_name());
                    }
                }
            }
            log.info(com.toString());

        }


        System.out.println("coms:" + coms.toString());


        som_comm_commentsVO c_cvo = new som_comm_commentsVO();
        c_cvo.setSom_board_num(cvo.getSom_board_num());
        c_cvo.setSomoim_num(cvo.getSomoim_num());
        log.info("cvo.getnum..{}", cvo.getNum());
        List<som_comm_commentsVO> c_coms = new ArrayList<som_comm_commentsVO>();
        c_coms = c_commService.selectAll(c_cvo);


        System.out.println("c_cvo:" + c_cvo);


        System.out.println("c_cvo.getSom_board_num:" + c_cvo.getSom_board_num());
        System.out.println("c_coms:" + c_coms.toString());


        model.addAttribute("coms", coms);
        model.addAttribute("c_coms", c_coms);
        service.vvcountup(vo);



		System.out.println("완료:::");
//
//		System.out.println("c_coms:::"+c_coms);
        String user_id = (String) session.getAttribute("user_id");

        vo.setUser_id(user_id);
        Somoim_BoardVO good_count_mem= service.select_all_goodList(vo);
        log.info("user_id..{}", user_id);
        model.addAttribute("good_count_mem", good_count_mem);
        log.info("good_count_mem..{}", good_count_mem);


        return "board/join_selectOne";
    }

    @RequestMapping(value = "/join_insert.do", method = RequestMethod.GET)
    public String join_insert(@RequestParam("somoim_img") String somoim_img, Model model) {
        log.info("join_insert.do().....");
        log.info("somoim_img: " + somoim_img); // 파라미터 값 확인
        model.addAttribute("somoim_img", somoim_img);
        return "board/join_insert";
    }

    @RequestMapping(value = "/join_insertOK.do", method = RequestMethod.POST)
    public String join_insertOK(Somoim_BoardVO vo, HttpServletRequest request) throws IllegalStateException, IOException {
        log.info("join_insert.do().....{}", vo);

        if (vo.getFile() != null && !vo.getFile().isEmpty()) {
            String getOriginalFileName = vo.getFile().getOriginalFilename();
            int fileNameLength = getOriginalFileName.length();

            log.info("getOriginalFilename : {}", getOriginalFileName);
            log.info("fileNameLength : {}", fileNameLength);

            if (fileNameLength == 0) {
                vo.setSave_image(getOriginalFileName);
            } else {
                vo.setSave_image(getOriginalFileName);
                String realPath = sContext.getRealPath("resources/uploadimg");

                log.info("realPath : {}", realPath);

                File f = new File(realPath + "/" + vo.getSave_image());
                vo.getFile().transferTo(f);
            }
        } else {
            vo.setSave_image(null); // file이 null인 경우에 save_image도 null로 설정합니다.
        }

        int result = service.join_insert(vo);

        if (result == 1) {
            log.info("됐냐?");

            return "redirect:join_selectAll.do?somoim_num=" + vo.getSomoim_num();
        } else {
            return "redirect:join_selectAll.do?somoim_num=" + vo.getSomoim_num();
        }
    }



    @RequestMapping(value = "/join_schedule.do", method = RequestMethod.GET)
    public String join_schedule(
            @RequestParam(defaultValue = "1") int pageNo,
            @RequestParam(defaultValue = "5") int pageSize,
            Model model, Somoim_ScheduleVO vo,
            HttpServletRequest request) {

            int startRow = (pageNo - 1) * pageSize + 1;
            int endRow = pageNo * pageSize;

            vo.setStartRow(startRow);
            vo.setEndRow(endRow);


            int totalPosts = service.Sch_Count(vo);
            int totalPage = (int) Math.ceil((double) totalPosts / pageSize);


        log.info("join_schedule.do().....{}", vo);


        List<Somoim_ScheduleVO> vos = service.sch_selelctList(vo);

        Map<String, Somoim_ScheduleVO> saveNamesMap = new HashMap<>(); // Save name을 담을 Map을 생성합니다.
        Set<String> participantSet = new HashSet<>(); // 중복되는 participant를 제거하기 위한 Set을 생성합니다.

        for (Somoim_ScheduleVO vo2 : vos) {
            log.info("각자의 vos 값" + vo2.toString());

            String[] Splits = vo2.getParticipant().split("/");

            for (String s : Splits) {
                participantSet.add(s); // 중복되는 participant를 제거하기 위해 Set에 추가합니다.
            }
        }

        for (String participant : participantSet) { // 중복을 제거한 participant에 대해 반복합니다.
            log.info("스플릿한 값" + participant);
            vo.setUser_id(participant);

            List<Somoim_ScheduleVO> vos2 = service.sch_selectList_part(vo);
            if (!vos2.isEmpty()) {
                saveNamesMap.put(participant, vos2.get(0)); // Save name을 담습니다.
            }

            for (Somoim_ScheduleVO t : vos2) {
                log.info("저장된 세이브 네임" + t.getSave_name());
            }
        }

        model.addAttribute("totalPage", totalPage);
        model.addAttribute("vos", vos);
        model.addAttribute("saveNamesMap", saveNamesMap); // Model에 saveNamesMap을 추가합니다.

        return "board/join_schedule";
    }


    @RequestMapping(value = "/join_update.do", method = RequestMethod.GET)
    public String join_update(Model model, Somoim_BoardVO vo) {
        log.info("join_update.do().....{}",vo);

        Somoim_BoardVO vo2 = service.selectJoin(vo);
        log.info("test...{}", vo2);

        model.addAttribute("vo2", vo2);


        return "board/join_update";
    }

    @RequestMapping(value = "/join_updateOK.do", method = RequestMethod.POST)
    public String join_updateOK(Somoim_BoardVO vo) {
        log.info("join_updateOK.do().....{}",vo);

        int result = service.update(vo);

        if (result == 1) {

            return "redirect:join_selectAll.do?somoim_num=" + vo.getSomoim_num();
        } else {
            return "redirect:join_update.do?num=" + vo.getNum();
        }

    }

    @RequestMapping(value = "/join_deleteOK.do", method = RequestMethod.GET)
    public String join_deleteOK(Somoim_BoardVO vo) {
        log.info("join_deleteOK.do().....");
        int result = service.delete(vo);


        if (result == 1) {
            return "redirect:join_selectAll.do?somoim_num=" + vo.getSomoim_num();
        } else {
            return "redirect:join_selectAll.do?somoim_num=" + vo.getSomoim_num();
        }


    }

    @RequestMapping(value = "/join_schedule_insert.do", method = RequestMethod.GET)
    public String join_schedule_insert() {
        log.info("join_schedule_insert.do().....");


        return "board/join_schedule_insert";


    }

    @RequestMapping(value = "/join_schedule_insertOK.do", method = RequestMethod.POST)
    public String join_schedule_insertOK(Somoim_ScheduleVO vo,HttpServletRequest request) {
        log.info("join_schedule_insertOK.do().....{}", vo);

        String userId = (String) request.getSession().getAttribute("user_id");

        vo.setUser_id(userId);

        int result = service.Sch_insert(vo);


        return "board/join_schedule_insert";


    }

    @RequestMapping(value = "/join_schedule_update.do", method = RequestMethod.GET)
    public String join_schedule_update(Somoim_ScheduleVO vo, Model model) {
        log.info("join_schedule_update.do().....");

        Somoim_ScheduleVO vo2 = service.selectOne_schedule(vo);

        model.addAttribute("vo2", vo2);
        return "board/join_schedule_update";


    }

    @RequestMapping(value = "/join_schedule_updateOK.do", method = RequestMethod.POST)
    public String join_schedule_updateOK(Somoim_ScheduleVO vo) {
        log.info("join_schedule_update.do().....{}", vo);

        int result = service.Sch_update(vo);


        return "board/join_schedule_update";


    }

    @RequestMapping(value = "/join_schedule_deleteOK.do", method = RequestMethod.POST)
    public String join_schedule_deleteOK(Somoim_ScheduleVO vo) {
        log.info("join_schedule_deleteOK.do().....{}", vo);

        int result = service.Sch_delete(vo);

        if (result == 1) {
            return "redirect:join_schedule.do?somoim_num=" + vo.getSomoim_num();
        } else {
            return "redirect:join_schedule.do?somoim_num=" + vo.getSomoim_num();
        }


    }

    @RequestMapping(value = "/Participant_UpdateOK.do", method = RequestMethod.POST)
    public String Participant_UpdateOk(Somoim_ScheduleVO vo, Model model) {
        log.info("Participant_UpdateOk.do().....{}", vo);

        int result = service.SCH_Part_Update(vo);

        if (result == 1) {
            log.info("업데이트 완료");
            return "redirect:join_schedule.do?somoim_num=" + vo.getSomoim_num();

        } else {
            log.info("업데이트 X");
            return "redirect:join_schedule.do?somoim_num=" + vo.getSomoim_num();
        }


    }

    @RequestMapping(value = "/Participant_CancleOK.do", method = RequestMethod.POST)
    public String Participant_CancleOK(Somoim_ScheduleVO vo) {
        log.info("Participant_CancleOK.do().....{}", vo);

        int result = service.SCH_Part_Cancle(vo);

        if (result == 1) {
            log.info("업데이트 완료");
            return "redirect:join_schedule.do?somoim_num=" + vo.getSomoim_num();

        } else {
            log.info("업데이트 X");
            return "redirect:join_schedule.do?somoim_num=" + vo.getSomoim_num();
        }
    }

    @RequestMapping(value = "/join_pay.do", method = RequestMethod.GET)
    public String join_pay(
            @RequestParam(defaultValue = "1") int pageNo,
            @RequestParam(defaultValue = "5") int pageSize,
            Somoim_ScheduleVO vo,Model model) {

        int startRow = (pageNo - 1) * pageSize + 1;
        int endRow = pageNo * pageSize;

        vo.setStartRow(startRow);
        vo.setEndRow(endRow);


        int totalPosts = service.Sch_Count(vo);
        int totalPage = (int) Math.ceil((double) totalPosts / pageSize);




        List<Somoim_ScheduleVO> vos = service.sch_selelctList(vo);

        Map<String, Somoim_ScheduleVO> saveNamesMap = new HashMap<>(); // Save name을 담을 Map을 생성합니다.
        Set<String> participantSet = new HashSet<>(); // 중복되는 participant를 제거하기 위한 Set을 생성합니다.

        for (Somoim_ScheduleVO vo2 : vos) {
            log.info(vo2.toString());

            String[] Splits = vo2.getParticipant().split("/");

            for (String s : Splits) {
                participantSet.add(s); // 중복되는 participant를 제거하기 위해 Set에 추가합니다.
            }
        }

        for (String participant : participantSet) { // 중복을 제거한 participant에 대해 반복합니다.

            vo.setUser_id(participant);

            List<Somoim_ScheduleVO> vos2 = service.sch_selectList_part(vo);
            if (!vos2.isEmpty()) {
                saveNamesMap.put(participant, vos2.get(0)); // Save name을 담습니다.
            }

            for (Somoim_ScheduleVO t : vos2) {

            }
        }



        model.addAttribute("totalPage", totalPage);
        model.addAttribute("vos", vos);
        model.addAttribute("saveNamesMap", saveNamesMap); // Model에 saveNamesMap을 추가합니다.

        return "board/join_pay";
    }


    @RequestMapping(value = "/schedule_payment.do", method = RequestMethod.POST)
    public String schedule_payment(Somoim_ScheduleVO vo, Somoim_MemberVO mvo) {

        log.info("schedule_payment.do().....{}", vo);

//        String userId = (String) request.getSession().getAttribute("user_id");



        log.info("세션 아이디" + vo.getSomoim_num());

        Somoim_ScheduleVO vo2 = service.selectPay(vo);

        Somoim_MemberVO mvo2 = service.selectMember(mvo);


        log.info("vo2 스트링" + vo2.toString());

        log.info("mvo2 스트링" + mvo2.toString());

        if (vo2.getSom_member_num() == mvo2.getNum()) {
            log.info("같음");
            return "redirect:join_pay.do?somoium_num=" + vo.getSomoim_num();
        } else {
            log.info("다름");
            return "redirect:join_pay.do?somoium_num=" + vo.getSomoim_num();
        }

    }

    @RequestMapping(value = "/vote_insertOK.do", method = RequestMethod.POST)
    public ResponseEntity<Integer> vote_insertOK(Somoim_Question_VoteVO vo, HttpServletRequest request) {
        log.info("vote_insertOK.do().....{}", vo);

        Somoim_Question_VoteVO vo2 = service.vote_num(vo);

        vo.setNum(vo2.getNum()+1);
        service.vote_insert(vo);
        int num = vo.getNum();


        // HTTP 상태 코드 200(OK)와 함께 num 값을 응답 본문에 담아 반환합니다.
        return new ResponseEntity<>(num, HttpStatus.OK);
    }

    @RequestMapping(value = "/choice_insertOK.do", method = RequestMethod.POST)
    public String choice_insertOK(Somoim_Choice_Vote vo) {
        log.info("choice_insertOK.do().....{}", vo);

        service.choice_insert(vo);


        // HTTP 상태 코드 200(OK)와 함께 num 값을 응답 본문에 담아 반환합니다.
        return "SUCCESS";
    }

    @RequestMapping(value = "/vote_UpdateOK.do", method = RequestMethod.POST)
    public ResponseEntity<String> vote_update(Somoim_Choice_Vote vo, HttpServletRequest request) {
        log.info("vote_insertOK.do().....{}", vo);

        String userId = (String) request.getSession().getAttribute("user_id");

        vo.setSom_vote_user_id(userId);
        log.info(vo.getSom_vote_user_id());

        int result = service.vote_update(vo);


        if (result == 1) {
            // HTTP 상태 코드 200(OK)와 함께 num 값을 응답 본문에 담아 반환합니다.
            return new ResponseEntity<>("Success!", HttpStatus.OK);

        }else{
            return new ResponseEntity<>("Fail!", HttpStatus.OK);
        }

    }

    @RequestMapping(value = "/vote_CancleOK.do", method = RequestMethod.POST)
    public ResponseEntity<String> vote_CancleOK(Somoim_Choice_Vote vo, HttpServletRequest request) {
        log.info("vote_insertOK.do().....{}", vo);

        String userId = (String) request.getSession().getAttribute("user_id");

        vo.setSom_vote_user_id(userId);
        log.info(vo.getSom_vote_user_id());

        int result = service.vote_cancle(vo);


        if (result == 1) {
            // HTTP 상태 코드 200(OK)와 함께 num 값을 응답 본문에 담아 반환합니다.
            return new ResponseEntity<>("Success!", HttpStatus.OK);

        }else{
            return new ResponseEntity<>("Fail!", HttpStatus.OK);
        }

    }

    @RequestMapping(value = "/good_count_up.do", method = RequestMethod.GET)
    public String good_count_up(Somoim_BoardVO vo) {
        log.info("good_count_up.do...{}", vo);
        service.good_count_up(vo);
        service.adding_good_count_list(vo);


        return "redirect:join_selectOne.do?num="+vo.getNum();


    }

    @RequestMapping(value = "/good_count_down.do", method = RequestMethod.GET)
    public String good_count_down(Somoim_BoardVO vo) {
        log.info("good_count_down.do...{}", vo);
        service.good_count_down(vo);
        service.del_good_count_list(vo);


        return "redirect:join_selectOne.do?num="+vo.getNum();


    }
    
    @ResponseBody
    @RequestMapping(value = "/som_schedule_selectOne.do", method = RequestMethod.GET)
    public List<Somoim_ScheduleVO> som_schedule_SelectOne(Integer somoim_num, Model model) {
    	log.info("som_schedule_SelectOne.do().....somoim_num:{}", somoim_num);
    	Somoim_ScheduleVO vo = new Somoim_ScheduleVO();
    	vo.setSomoim_num(somoim_num);
    	
    	List<Somoim_ScheduleVO> vos = service.som_schedule_selectOne(vo);
    	log.info("======={}", vos);
    	
    	for (Somoim_ScheduleVO x : vos) {
			log.info("place : {}",x.getPlace());
			log.info(x.getSchedule_title());
		}
    	
    	model.addAttribute("vos", vos);
    	return vos;
    }








}