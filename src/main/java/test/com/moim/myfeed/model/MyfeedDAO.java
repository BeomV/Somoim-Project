package test.com.moim.myfeed.model;

public interface MyfeedDAO {

	public int update(MyfeedVO vo);

	public MyfeedVO selectOne(MyfeedVO vo4);

	public int insert(String user_id);

	public int imginsert(MyfeedVO vo);

}