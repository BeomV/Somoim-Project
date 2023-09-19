package test.com.moim.total_searching.model;

import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import test.com.moim.community.model.CommunityVO;
import test.com.moim.cs.model.CsVO;
import test.com.moim.somoim.model.SomoimVO;

import java.util.List;

@Repository
@Slf4j
public class total_searchingDAOimpl implements total_searchingDAO {

    @Autowired
    SqlSession sqlSession;
    @Override
    public List<SomoimVO> SearchList_som(String searchKey) {
        return sqlSession.selectList("SOMOIM_TOTAL_SEARCHING",searchKey);
    }

    @Override
    public List<CommunityVO> SearchList_com(String searchKey) {
        return sqlSession.selectList("COM_TOTAL_SEARCHING",searchKey);
    }

    @Override
    public List<CsVO> SearchList_cs(String searchKey) {
        return sqlSession.selectList("CS_TOTAL_SEARCHING",searchKey);
    }
}
