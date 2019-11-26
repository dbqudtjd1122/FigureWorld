package com.sol.service;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.nio.ByteBuffer;
import java.security.AlgorithmParameters;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Map;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sol.dao.IDaoUser;
import com.sol.model.ModelLogin_Log;
import com.sol.model.ModelUser;

@Repository("serviceuser")
public class ServiceUser implements IServiceUser {

	// SLF4J Logging
	private static Logger logger = LoggerFactory.getLogger(ServiceUser.class);

	@Autowired
	IDaoUser dao;

	@Override
	public int InsertUser(ModelUser user) {
		int result = -1;
		try {
			String str = encryptAES256(user.getPW().toString(), "z1m4b63v");
			user.setPW(str);
			result = dao.InsertUser(user);
		} catch (Exception e) {
			logger.error("InsertUser" + e.getMessage());
		}
		return result;
	}

	@Override
	public int SelectOverlap(String ID) {
		int result = -1;
		try {
			result = dao.SelectOverlap(ID);
		} catch (Exception e) {
			logger.error("InsertUser" + e.getMessage());
			throw e;
		}
		return result;
	}

	@Override
	public ModelUser Connectivity(ModelUser user) {
		ModelUser result = new ModelUser();
		try {
			result = SelectPW(user); // 암호가져와서  복호화
			
			if(result != null) {
				// 복호화한 비밀번호와 로그인시도한 비밀번호가 일치하면 개인정보 가져오기.
				if(result.getPW().toString().equals(user.getPW().toString())) {
					result = dao.Connectivity(user);
				} else {
					result = null;
				}
			}
		} catch (Exception e) {
			logger.error("Connectivity" + e.getMessage());
		}
		return result;
	}

	@Override
	public int Login_log(ModelLogin_Log log) {
		int result = -1;
		try {
			log.setIP(ipAddress());
			result = dao.Login_log(log);
		} catch (Exception e) {
			logger.error("Login_log" + e.getMessage());
		}
		return result;
	}
	
	@Override
	public ModelUser SelectPW(ModelUser user) {
		try {
			user = dao.SelectPW(user);
			if(user != null) {
				String str = decryptAES256(user.getPW(), "z1m4b63v"); // 복호화
				user.setPW(str);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public List<Map<String, Object>> SelectMyShopping(Integer User_NM) {
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		try {
			result = dao.SelectMyShopping(User_NM);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public String ipAddress() { // ip주소 가져오기
		try {
			return InetAddress.getLocalHost().getHostAddress();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		return "";
	}
	
	// 암호화
	public static String encryptAES256(String msg, String key) throws Exception {
		SecureRandom random = new SecureRandom();
		byte bytes[] = new byte[20];
		random.nextBytes(bytes);
		byte[] saltBytes = bytes;
		// Password-Based Key Derivation function 2
		SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
		// 70000번 해시하여 256 bit 길이의 키를 만든다.
		PBEKeySpec spec = new PBEKeySpec(key.toCharArray(), saltBytes, 70000, 256);
		SecretKey secretKey = factory.generateSecret(spec);
		SecretKeySpec secret = new SecretKeySpec(secretKey.getEncoded(), "AES");
		// 알고리즘/모드/패딩
		// CBC : Cipher Block Chaining Mode
		Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
		cipher.init(Cipher.ENCRYPT_MODE, secret);
		AlgorithmParameters params = cipher.getParameters();
		// Initial Vector(1단계 암호화 블록용)
		byte[] ivBytes = params.getParameterSpec(IvParameterSpec.class).getIV();
		byte[] encryptedTextBytes = cipher.doFinal(msg.getBytes("UTF-8"));
		byte[] buffer = new byte[saltBytes.length + ivBytes.length + encryptedTextBytes.length];
		System.arraycopy(saltBytes, 0, buffer, 0, saltBytes.length);
		System.arraycopy(ivBytes, 0, buffer, saltBytes.length, ivBytes.length);
		System.arraycopy(encryptedTextBytes, 0, buffer, saltBytes.length + ivBytes.length, encryptedTextBytes.length);
		return Base64.getEncoder().encodeToString(buffer);
	}

	// 복호화
	public static String decryptAES256(String msg, String key) throws Exception {
		Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
		ByteBuffer buffer = ByteBuffer.wrap(Base64.getDecoder().decode(msg));
		byte[] saltBytes = new byte[20];
		buffer.get(saltBytes, 0, saltBytes.length);
		byte[] ivBytes = new byte[cipher.getBlockSize()];
		buffer.get(ivBytes, 0, ivBytes.length);
		byte[] encryoptedTextBytes = new byte[buffer.capacity() - saltBytes.length - ivBytes.length];
		buffer.get(encryoptedTextBytes);
		SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
		PBEKeySpec spec = new PBEKeySpec(key.toCharArray(), saltBytes, 70000, 256);
		SecretKey secretKey = factory.generateSecret(spec);
		SecretKeySpec secret = new SecretKeySpec(secretKey.getEncoded(), "AES");
		cipher.init(Cipher.DECRYPT_MODE, secret, new IvParameterSpec(ivBytes));
		byte[] decryptedTextBytes = cipher.doFinal(encryoptedTextBytes);
		return new String(decryptedTextBytes);
	}
}
