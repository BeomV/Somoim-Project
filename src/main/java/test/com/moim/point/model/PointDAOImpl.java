package test.com.moim.point.model;

import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import test.com.moim.userinfo.model.UserinfoVO;

import java.util.List;

@Slf4j
@Repository
public class PointDAOImpl implements PointDAO {

    @Autowired
    SqlSession sqlSession;

    @Override
    public List<PointVO> selectList(PointVO vo) {
        return sqlSession.selectList("POINT_SELECT_LIST", vo);
    }

    @Override
    public int purchase(UserinfoVO uvo) {
        return sqlSession.update("POINT_PURCHASE", uvo);
    }

    @Override
    public UserinfoVO POINT_SELECT_ONE(UserinfoVO uvo) {
        return sqlSession.selectOne("POINT_SELECT_ONE", uvo);
    }
}
