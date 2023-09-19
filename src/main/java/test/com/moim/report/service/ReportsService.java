package test.com.moim.report.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import test.com.moim.board.model.Somoim_BoardVO;
import test.com.moim.report.model.ReportsDAO;
import test.com.moim.report.model.ReportsVO;

@Service
public class ReportsService {

    @Autowired
    ReportsDAO dao;
    public int insert(ReportsVO vo){
        return dao.insert(vo);
    }
}
