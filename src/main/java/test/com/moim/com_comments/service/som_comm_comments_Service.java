package test.com.moim.com_comments.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.com.moim.com_comments.model.som_comm_commentsDAO;
import test.com.moim.com_comments.model.som_comm_commentsVO;


@Service
public class som_comm_comments_Service {
	
	
	@Autowired
	som_comm_commentsDAO dao;
	
	
	public int insert(som_comm_commentsVO vo) {
		return dao.insert(vo);
	}

	public int update(som_comm_commentsVO vo){
		return dao.update(vo);
	}

	public int delete(som_comm_commentsVO vo){
		return dao.delete(vo);
	}

	public List<som_comm_commentsVO> selectAll(som_comm_commentsVO vo){
		return dao.selectAll(vo);
	}
	
	public void good_count_up(som_comm_commentsVO vo) {
		
	}
	public void som_board_num_down(som_comm_commentsVO vo) {
		
	}


//	public List<SomoimVO> searchList(int searchKey, int searchWord) {
//
//		return dao.searchList(searchKey, searchWord);
//	}



	

}
