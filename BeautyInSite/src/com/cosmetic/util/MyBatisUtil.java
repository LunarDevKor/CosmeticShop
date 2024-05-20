package com.cosmetic.util;

import java.io.IOException;
import java.io.Reader;
import java.nio.charset.Charset;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
public class MyBatisUtil {
	private static SqlSessionFactory sessionFactory; // 객체 변수 선언
	
	static {
		
		try {
			Charset charset = Charset.forName("UTF-8"); // 설정파일에 한글이 있는경우 깨짐을 방지하기 위함
					
			Resources.setCharset(charset);
			Reader rd = Resources.getResourceAsReader("config/mybatis-config.xml");
					
			sessionFactory = new SqlSessionFactoryBuilder().build(rd);
			
			rd.close();
			
		}catch(IOException ex) {
			ex.printStackTrace();
		}
			
	}
	public static SqlSession getInstance() {
		return sessionFactory.openSession(); // 기본값 : autoCommit => false
	}
	public static SqlSession getInstance(boolean autoCommit) {
		return sessionFactory.openSession(autoCommit); 
	}
	
}
