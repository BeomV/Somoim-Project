package test.com.moim.board.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import test.com.moim.board.model.Somoim_BoardVO;
import test.com.moim.board.service.BoardService;

import java.util.List;

@Slf4j
@Controller
public class BoardRestController {
    @Autowired
    BoardService service;

    @ResponseBody
    @RequestMapping(value = "/json_join_selectAll.do", method = RequestMethod.GET)
    public List<Somoim_BoardVO> json_join_selectAll(Somoim_BoardVO vo){
        log.info("Somoim_BoardVOSomoim_BoardVOSomoim_BoardVO..{}", vo);
        List<Somoim_BoardVO> jsonVO= service.selectList(vo);
        log.info("json_join_selectAll..{}", jsonVO);
        System.out.println("jsonVO"+jsonVO);
        return jsonVO;
    }
}
