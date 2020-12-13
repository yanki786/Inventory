package com.web.controller;

import com.web.database.Connection;
import com.web.database.Database;
import com.web.entity.User;
import com.web.util.Encryption;

public class AuthController {

	private User user;
	private final Connection con = new Connection();

	public boolean sigup(User user) {
		this.user = null;
		Database db = new Database(con);
		if (db.getUser().exist(user.getUsername()))
			return false;
		var pass = Encryption.encrypt(user.getPassword());
		user.setPassword(pass);
		user.setId(db.getUser().getCount() + 1);
		db.getUser().newUser(user);
		this.user = user;
		return true;
	}

	public long login(User user) {
		this.user = null;
		Database db = new Database(con);
		if (!db.getUser().exist(user.getUsername()))
			return -2;
		var pass = Encryption.encrypt(user.getPassword());
		var u = db.getUser().getUser(user.getUsername(), pass);
		this.user = u;
		return u == null ? -1 : u.getId();
	}

	public User getUser() {
		return user;
	}

	public Connection getCon() {
		return con;
	}

}
