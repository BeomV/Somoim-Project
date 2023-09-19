package test.com.moim.mongo.board;

import com.mongodb.MongoClientURI;
import org.bson.Document;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Configuration
public class MongoBoardConfig {

    @Bean
    public MongoDatabase mongoDatabase_ncp() {
        String connectionString = "mongodb://back11_01:hi123456!@h8rgi.pub-vpc.mg.naverncp.com:17017/admin?readPreference=primary&directConnection=true";

        MongoClientURI uri = new MongoClientURI(connectionString);
        MongoClient client = new MongoClient(uri);
        MongoDatabase db = client.getDatabase("admin");//db name
        log.info("Create Bean MongoDatabase...admin");
        return db;
    }

    @Bean
    public MongoCollection<Document> gallery() {
//		MongoCollection<Document> collection = mongoDatabase().getCollection("member");
        MongoCollection<Document> collection = mongoDatabase_ncp().getCollection("gallery");
        log.info("Create Bean member...");
        return collection;
    }

}
