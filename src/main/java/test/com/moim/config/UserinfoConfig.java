package test.com.moim.config;

import org.bson.Document;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Configuration
public class UserinfoConfig {

	@Bean
	public MongoDatabase mongoDatabase() {
		MongoClient client = new MongoClient("localhost",27017);
		MongoDatabase db = client.getDatabase("onandoff");//db name
		log.info("Create Bean MongoDatabase...onandoff");
		return db;
	}
	
	@Bean
	public MongoCollection<Document> member() {
		MongoCollection<Document> collection = mongoDatabase().getCollection("member");
		log.info("Create Bean member...");
		return collection;
	}
	
}