package com.web.database;

import com.mongodb.client.MongoCollection;
import com.web.entity.MailDetail;

@SuppressWarnings("unchecked")
public class MailStore {

	private final MongoCollection<MailDetail> mail;

	private static final String coll_name = "mail_collection";

	Connection connection;

	public MailStore() {
		connection = new Connection();
		mail = (MongoCollection<MailDetail>) connection.getCollection(coll_name, MailDetail.class);
	}

	public void send(MailDetail detail) {
		mail.insertOne(detail);
		connection.close();
	}

}
