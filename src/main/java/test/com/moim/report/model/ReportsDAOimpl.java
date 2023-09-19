package test.com.moim.report.model;


import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Slf4j
public class ReportsDAOimpl implements ReportsDAO{
    @Autowired
    SqlSession sqlSession;
    @Override
    public int insert(ReportsVO vo) {
        return sqlSession.insert("REPORTS_INSERT", vo );
    }
}
