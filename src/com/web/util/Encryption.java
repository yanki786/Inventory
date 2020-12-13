package com.web.util;

import java.security.MessageDigest;

public class Encryption {

	public static String encrypt(String passwordToHash) {
		String generatedPassword = null;
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(passwordToHash.getBytes());
			byte[] bytes = md.digest();
			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < bytes.length; i++)
				sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
			generatedPassword = sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return generatedPassword;
	}
}
