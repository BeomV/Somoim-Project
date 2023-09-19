package test.com.moim.cs.model;

import java.util.List;

public interface BugDAO {
	public List<BugVO> selectAll();
	public int insert(BugVO vo);
}
