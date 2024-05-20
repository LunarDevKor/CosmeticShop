package com.cosmetic.util;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.Part;

public class OthersUtil {

	public static void main(String[] args) {
		System.out.println(SHA256Encryption("1"));
	}

	public static String SHA256Encryption(String pw) {

		StringBuilder sb = null;

		try {

			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] hash = digest.digest(pw.getBytes());

			sb = new StringBuilder();

			for (byte b : hash) {
				String hex = Integer.toHexString(0xff & b);

				if (hex.length() == 1) {
					sb.append('0');
				}

				sb.append(hex);
			}

		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return sb.toString();
	}

	public static String Base64Encode(Part part) throws IOException {
		String fileName = part.getSubmittedFileName();
		String img = "";

		if (fileName != null && !fileName.equals("")) {
			try (InputStream is = part.getInputStream()) {

				byte[] imageData = readImageData(is);
				img = Base64.getEncoder().encodeToString(imageData);

			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return img;
	}

	public static byte[] readImageData(InputStream is) throws IOException {

		ByteArrayOutputStream buffer = new ByteArrayOutputStream();
		int nRead;
		byte[] data = new byte[1024];

		while ((nRead = is.read(data, 0, data.length)) != -1) {
			buffer.write(data, 0, nRead);
		}

		buffer.flush();
		return buffer.toByteArray();
	}
}
