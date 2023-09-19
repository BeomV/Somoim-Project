package test.com.moim.member.model;

import java.util.List;

import test.com.moim.board.model.Somoim_BoardVO;

public interface MemberDAO {
	
	public int insert(MemberVO vo);
	public int delete(MemberVO vo);
	public List<MemberVO> selectAll();
	public List<MemberVO> searchList(String searchKey, String searchWord);
	public List<MemberVO> profileCheck(MemberVO vo);
	public List<MemberVO> searchSavename(String user_id);
	public int mypage_update_member(MemberVO vo2);
	public int som_maxmember_check(MemberVO vo);
	

}
