package com.tariq.config;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisConfiguration {
	
	private static SqlSessionFactory factory;

	public MyBatisConfiguration() {
	}

	static {
		try (Reader reader = Resources.getResourceAsReader("myBatisConfig.xml")) {
			factory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			throw new RuntimeException(e.getMessage());
		}
	}

	public static SqlSessionFactory fetchSqlSessionFactory() {
		return factory;
	}

}
