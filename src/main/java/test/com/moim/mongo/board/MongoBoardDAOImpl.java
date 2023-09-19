package test.com.moim.mongo.board;

import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.model.Filters;
import com.mongodb.client.result.DeleteResult;
import lombok.extern.slf4j.Slf4j;
import org.bson.Document;
import org.bson.conversions.Bson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import static com.mongodb.client.model.Sorts.descending;


import java.util.ArrayList;
import java.util.List;

@Slf4j
@Repository
public class MongoBoardDAOImpl implements MongoBoardDAO {
    @Autowired
    MongoCollection<Document> gallery;

    @Override
    public List<MongoBoardVO> findAll(MongoBoardVO vo, int pageNo) {
        log.info("findAll()...");
        List<MongoBoardVO> list = new ArrayList<MongoBoardVO>();

        int skip = (pageNo - 1) * 9;

        Bson filter = Filters.eq("somoim_num", vo.getSomoim_num());
        Bson sort = new Document("num", -1);
        FindIterable<Document> docs = gallery.find(filter).sort(sort).skip(skip).limit(9);
        for (Document doc : docs){
            MongoBoardVO vo2 = new MongoBoardVO();
            vo2.set_id(doc.get("_id").toString());
            vo2.setNum(doc.getInteger("num",0));
            vo2.setImage_name(doc.getString("image_name"));
            vo2.setUpload_date(doc.getString("upload_date"));
            vo2.setSomoim_num(doc.getInteger("somoim_num",0));
            vo2.setUser_id(doc.getString("user_id"));
            list.add(vo2);
        }

        return list;
    }


    @Override
    public int insert(MongoBoardVO vo) {

        log.info("insert()...");
        int flag=0;

        try{
            Document doc = new Document();
            doc.put("num", vo.getNum());
            doc.put("image_name", vo.getImage_name());
            doc.put("upload_date", vo.getUpload_date());
            doc.put("somoim_num", vo.getSomoim_num());
            doc.put("user_id", vo.getUser_id());
            gallery.insertOne(doc);
            flag = 1;


        }catch (Exception e){
            e.printStackTrace();
        }

        return flag;
    }

    @Override
    public MongoBoardVO findOne(MongoBoardVO vo) {
        log.info("findOne()...");

        MongoBoardVO vo2 = new MongoBoardVO();

        Document doc = gallery.find().sort(descending("num")).first();

        if(doc != null) {
            vo2.setNum(doc.getInteger("num"));
        } else {
            vo2.setNum(0);
        }

        return vo2;

    }

    @Override
    public int delete(MongoBoardVO vo) {
        log.info("delete()....{}", vo);
        int flag = 0;

        try {
            Bson filter = new Document("num",vo.getNum());
//			Bson filter = new Document("_id",vo.getMid()==null?"":new ObjectId(vo.getMid()));

            DeleteResult result =  gallery.deleteOne(filter);

            log.info("getDeletedCount():{}",result.getDeletedCount());

            flag = (int)result.getDeletedCount();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;
    }

    @Override
    public long countAll(MongoBoardVO vo) {
        Bson filter = Filters.eq("somoim_num", vo.getSomoim_num());
        long count = gallery.count(filter);
        return count;
    }


}



