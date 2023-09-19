package test.com.moim.cs.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.com.moim.cs.model.CsDAO;
import test.com.moim.cs.model.CsVO;

@Service
public class CsService {
	
	@Autowired
	CsDAO dao;
	
	
	
    public int insert(CsVO vo) {
    	return dao.insert(vo);
    }
    public int update(CsVO vo){
    	return dao.update(vo);
    }
    public int delete(CsVO vo){
    	return dao.delete(vo);
    }

    public CsVO selectOne(CsVO vo){
    	return dao.selectOne(vo);
    	
    }
	public List<CsVO> selectAll(){
		return dao.selectAll();
	}

    
}
