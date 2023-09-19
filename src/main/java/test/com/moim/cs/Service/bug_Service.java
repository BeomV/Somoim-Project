package test.com.moim.cs.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.com.moim.cs.model.BugDAO;
import test.com.moim.cs.model.BugVO;

@Service
public class bug_Service {

	@Autowired
	BugDAO dao;
	
	public List<BugVO> selectAll(){
		return dao.selectAll();
	}
	
	public int insert(BugVO vo) {
		return dao.insert(vo);
	}
}
