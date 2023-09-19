package test.com.moim.total_searching.model;

import test.com.moim.community.model.CommunityVO;
import test.com.moim.cs.model.CsVO;
import test.com.moim.somoim.model.SomoimVO;

import java.util.List;

public interface total_searchingDAO {
    public List<SomoimVO> SearchList_som(String searchKey);
    public List<CommunityVO> SearchList_com(String searchKey);
    public List<CsVO> SearchList_cs(String searchKey);
}
