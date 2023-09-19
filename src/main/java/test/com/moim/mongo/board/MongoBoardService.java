package test.com.moim.mongo.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MongoBoardService {

    @Autowired
    MongoBoardDAO dao;

    public List<MongoBoardVO> findAll(MongoBoardVO vo, int pageNo) {
        return dao.findAll(vo, pageNo);
    }

    public int insert(MongoBoardVO vo) { return dao.insert(vo);
    }

    public MongoBoardVO findOne(MongoBoardVO vo) { return dao.findOne(vo);
    }

    public int delete(MongoBoardVO vo) { return dao.delete(vo);
    }

    public long countAll(MongoBoardVO vo) {
        return dao.countAll(vo);
    }
}
