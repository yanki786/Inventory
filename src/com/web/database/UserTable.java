package com.web.database;

import com.mongodb.client.MongoCollection;
import com.web.entity.User;

import static com.mongodb.client.model.Filters.and;
import static com.mongodb.client.model.Filters.eq;

@SuppressWarnings("unchecked")
public class UserTable {

	private static final String coll_name = "user_collection";
	private final MongoCollection<User> users;

	UserTable(Connection connection) {
		users = (MongoCollection<User>) connection.getCollection(coll_name, User.class);
	}

	public long getCount() {
		return users.countDocuments();
	}

	public void newUser(User user) {
		if (user != null)
			users.insertOne(user);
	}

	public boolean exist(String username) {
		return users.find(eq("username", username)).first() != null;
	}

	public User getUser(long userId, String password) {
		return users.find(and(eq("_id", userId), eq("password", password))).first();
	}

	public User getUser(String username, String password) {
		return users.find(and(eq("username", username), eq("password", password))).first();
	}

	public User getUserByMail(String mailId, String password) {
		return users.find(and(eq("mailId", mailId), eq("password", password))).first();
	}

	public void updateUserDetail(User user) {
		deleteUser(user.getId());
		newUser(user);
	}

	public User deleteUser(long userId) {
		return users.findOneAndDelete(eq("_id", userId));
	}

}
