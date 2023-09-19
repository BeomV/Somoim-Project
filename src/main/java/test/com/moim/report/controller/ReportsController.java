package test.com.moim.report.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import test.com.moim.board.model.Somoim_BoardVO;
import test.com.moim.report.model.ReportsVO;
import test.com.moim.report.service.ReportsService;

@Slf4j
@Controller
public class ReportsController {

    @Autowired
    ReportsService service;
    @RequestMapping(value = "/reportsInsert.do", method = RequestMethod.POST)
    public String reportsInsertOk(ReportsVO vo) {
        log.info("reportsInsertOk.do...{}", vo);
        service.insert(vo);


        return "redirect:join_selectOne.do?num="+vo.getNum();


    }
}
