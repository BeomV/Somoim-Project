package test.com.moim.point.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import test.com.moim.point.model.PointDAO;
import test.com.moim.point.model.PointVO;
import test.com.moim.userinfo.model.UserinfoVO;

import java.util.List;

@Service
public class PointService {

    @Autowired
    PointDAO dao;
    public List<PointVO> selectList(PointVO vo) {
        return dao.selectList(vo);
    }

    public int purchase(UserinfoVO uvo) {
        return dao.purchase(uvo);
    }

    public UserinfoVO POINT_SELECT_ONE(UserinfoVO uvo) {
        return dao.POINT_SELECT_ONE(uvo);
    }
}
