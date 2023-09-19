package test.com.moim.point.model;

import test.com.moim.userinfo.model.UserinfoVO;

import java.util.List;

public interface PointDAO {
    public List<PointVO> selectList(PointVO vo);

    int purchase(UserinfoVO uvo);

    UserinfoVO POINT_SELECT_ONE(UserinfoVO uvo);
}
