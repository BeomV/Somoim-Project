package test.com.moim.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import test.com.moim.member.model.MemberDAO;
import test.com.moim.member.model.MemberVO;

@Service
@Slf4j
public class MemberService {
	
	@Autowired
	MemberDAO dao;

	public int insert(MemberVO vo) {
		log.info("insert()....{}", vo);
		
		return dao.insert(vo);
	}
	public int delete(MemberVO vo) {
		log.info("delete()....{}", vo);
		return dao.delete(vo);
	}
	public List<MemberVO> selectAll() {
		log.info("selectAll()...");
		return dao.selectAll();
	}
	public List<MemberVO> searchList(String searchKey, String searchWord) {
		log.info("searchList...{},{}", searchKey, searchWord);
		return dao.searchList(searchKey, searchWord);
	}
	public List<MemberVO> profileCheck(MemberVO vo) {
		log.info("this is ... : {}", vo.getNum());
		return dao.profileCheck(vo);
	}
	public List<MemberVO> searchSavename(String somoim_master) {
		log.info("searchSave_name ....{}", somoim_master);
		return dao.searchSavename(somoim_master);
	}
	public int som_maxmember_check(MemberVO vo) {
		log.info("som_maxmember_check....som_title:{}", vo.getSom_title());
		return dao.som_maxmember_check(vo);
	}
//	public List<MemberVO> mysomoim_selectAll(MemberVO vo) {
//		log.info("mysomoim_selectAll()...{}", vo);
//		return dao.mysomoim_selectAll(vo);
//	}
}
