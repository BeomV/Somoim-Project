package test.com.moim.community_comments.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import test.com.moim.comments.model.som_commentsDAO;
import test.com.moim.comments.model.som_commentsVO;
import test.com.moim.community_comments.model.Community_commentsDAO;
import test.com.moim.community_comments.model.Community_commentsVO;
import test.com.moim.community_comments.model.Community_re_commentsVO;

import java.util.List;

@Service
public class Community_commentsService {
	
	
	@Autowired
    Community_commentsDAO dao;
	
	
	public int insert(Community_commentsVO vo) {
		return dao.insert(vo);
	}

	public int update(Community_commentsVO vo){
		return dao.update(vo);
	}

	public int delete(Community_commentsVO vo){
		return dao.delete(vo);
	}

	public List<Community_commentsVO> selectAll(Community_commentsVO vo){
		return dao.selectAll(vo);
	}
	
	public void good_count_up(Community_commentsVO vo) {
		
	}


}
