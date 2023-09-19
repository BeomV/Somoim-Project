package test.com.moim.comments.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Data;
import test.com.moim.comments.model.som_commentsDAO;
import test.com.moim.comments.model.som_commentsVO;

@Service
public class som_comments_Service {
	
	
	@Autowired
	som_commentsDAO dao;
	
	
	public int insert(som_commentsVO vo) {
		return dao.insert(vo);
	}

	public int update(som_commentsVO vo){
		return dao.update(vo);
	}

	public int delete(som_commentsVO vo){
		return dao.delete(vo);
	}

	public List<som_commentsVO> selectAll(som_commentsVO vo){
		return dao.selectAll(vo);
	}
	
	public void good_count_up(som_commentsVO vo) {
		
	}
	public void som_board_num_down(som_commentsVO vo) {
		
	}
	

}