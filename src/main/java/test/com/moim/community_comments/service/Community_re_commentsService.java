package test.com.moim.community_comments.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import test.com.moim.community_comments.model.Community_commentsDAO;
import test.com.moim.community_comments.model.Community_commentsVO;
import test.com.moim.community_comments.model.Community_re_commentsDAO;
import test.com.moim.community_comments.model.Community_re_commentsVO;

import java.util.List;

@Service
public class Community_re_commentsService {
	
	
	@Autowired
    Community_re_commentsDAO dao;
	
	
	public int insert(Community_re_commentsVO vo) {
		return dao.insert(vo);
	}

	public int update(Community_re_commentsVO vo){
		return dao.update(vo);
	}

	public int delete(Community_re_commentsVO vo){
		return dao.delete(vo);
	}

	public List<Community_re_commentsVO> selectAll(Community_re_commentsVO vo){
		return dao.selectAll(vo);
	}
	
	public void good_count_up(Community_re_commentsVO vo) {
		
	}
	

}
