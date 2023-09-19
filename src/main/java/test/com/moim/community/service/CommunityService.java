package test.com.moim.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import test.com.moim.board.model.Somoim_BoardVO;
import test.com.moim.community.model.CommunityDAO;
import test.com.moim.community.model.CommunityVO;
import test.com.moim.somoim.model.SomoimVO;
import test.com.moim.userinfo.model.UserinfoVO;

@Service
@Slf4j
public class CommunityService {

    @Autowired
    CommunityDAO dao;

    public CommunityService() {
        log.info("CommunityService...");
    }


    public int insert(CommunityVO vo) {
        log.info("insert()....{}", vo);
        return dao.insert(vo);
    }

    public int update(CommunityVO vo) {
        return dao.update(vo);
    }

    public int delete(CommunityVO vo) {
        return dao.delete(vo);
    }

    public List<CommunityVO> selectAll() {
        return dao.selectAll();
    }

    public CommunityVO selectOne(CommunityVO vo) {
        return dao.selectOne(vo);
    }

    public List<CommunityVO> searchList(String searchKey, String searchWord) {
        return dao.searchList(searchKey, searchWord);
    }

    public List<CommunityVO> select_user_info() { return dao.select_user_info();}


    public void good_count_up(CommunityVO vo){
        log.info("good count up 정상 작동");
        dao.good_count_up(vo);
    }

    public int good_count_down(CommunityVO vo){
        return dao.good_count_down(vo);
    }

    public  CommunityVO select_all_goodList(CommunityVO vo){
        log.info("전체 좋아요 목록을 불러옵니다.");
        return dao.select_all_goodList(vo);
    }
    public void adding_good_count_list(CommunityVO vo){
        log.info("완료...{}", vo);
        dao.adding_good_count_list(vo);
    }
    public void del_good_count_list(CommunityVO vo){
        log.info("완료...{}", vo);
        dao.del_good_count_list(vo);
    }

    public UserinfoVO user_list(UserinfoVO vo) {
        return dao.user_list(vo);
    }
}
