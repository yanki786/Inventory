package com.web.controller;

import com.web.database.MailStore;
import com.web.entity.MailDetail;

public class ContactUsController {

	public void sendEmail(MailDetail detail) {
		new MailStore().send(detail);
	}
}
