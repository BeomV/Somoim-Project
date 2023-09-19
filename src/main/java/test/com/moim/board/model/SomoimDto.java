package test.com.moim.board.model;

import lombok.Data;

import java.util.List;

@Data
public class SomoimDto {
    private Somoim_BoardVO boardVo;
    private List<Somoim_Question_VoteVO> voteVos;

}
