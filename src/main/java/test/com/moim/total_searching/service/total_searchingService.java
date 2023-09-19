package test.com.moim.total_searching.service;

import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import test.com.moim.community.model.CommunityVO;
import test.com.moim.cs.model.CsVO;
import test.com.moim.somoim.model.SomoimVO;
import test.com.moim.total_searching.model.total_searchingDAO;

import java.util.List;

@Service
@Slf4j
public class total_searchingService {

    @Autowired
    total_searchingDAO dao;

    public List<SomoimVO> SearchList_som(String searchKey) {
        return dao.SearchList_som(searchKey);
    }

    public List<CommunityVO> SearchList_com(String searchKey) {
        return dao.SearchList_com(searchKey);
    }

    public List<CsVO> SearchList_cs(String searchKey) {
        return dao.SearchList_cs(searchKey);
    }

}
