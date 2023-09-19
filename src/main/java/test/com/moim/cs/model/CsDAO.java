package test.com.moim.cs.model;

import java.util.List;


public interface CsDAO {
	public List<CsVO> selectAll();

    public int insert(CsVO vo);
    public int update(CsVO vo);
    public int delete(CsVO vo);

    public CsVO selectOne(CsVO vo);
    
    


  }
