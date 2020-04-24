package com.tariq.shiro;

import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.tariq.config.MyBatisConfiguration;
import com.tariq.dao.UserMapper;
import com.tariq.entity.User;

@Service
public class UserService {

	public Set<String> getRoles(String username) {
		Set<String> rolesSet = new HashSet<String>();
		SqlSession sqlSession = com.tariq.config.MyBatisConfiguration.fetchSqlSessionFactory().openSession();
		try {
			ShiroMapper shiroMapper = sqlSession.getMapper(ShiroMapper.class);
			rolesSet = shiroMapper.getUserRoleList(username);
		} finally {
			sqlSession.close();
		}
		return rolesSet;
	}
	
	public Set<String> getPermissions(String roleName) {
		Set<String> permission=new LinkedHashSet<String>();
		SqlSession sqlSession = com.tariq.config.MyBatisConfiguration.fetchSqlSessionFactory().openSession();
		try{
			ShiroMapper shiroMapper = sqlSession.getMapper(ShiroMapper.class);
			permission = shiroMapper.getPermissionList(roleName);
		}finally{
			sqlSession.close();
		}
		return permission;
	}

	public AuthUser getUserFromDB(String username) {
		SqlSession sqlSession = MyBatisConfiguration.fetchSqlSessionFactory().openSession();
		String passFromDB = null;
		try {
			ShiroMapper shiroMapper = sqlSession.getMapper(ShiroMapper.class);
			passFromDB = shiroMapper.authenticateUserPassword(username);
		} finally {
			sqlSession.close();
		}
		if (passFromDB != null && passFromDB.length() > 1) {
			return new AuthUser(username, passFromDB);
		}
		return null;
	}

	public List<User> allUser() {
		SqlSession sqlSession = MyBatisConfiguration.fetchSqlSessionFactory().openSession();
		List<User> list = null;
		try {
			UserMapper map=sqlSession.getMapper(UserMapper.class);
			list=map.getAllUser();
		} catch(Exception e) {
			System.out.println("error:::"+e);
		} finally {
			sqlSession.close();
		}
		return list;
	}
	
	public boolean delete(int id) {
		SqlSession sqlSession = MyBatisConfiguration.fetchSqlSessionFactory().openSession();
		try {
			UserMapper map=sqlSession.getMapper(UserMapper.class);
			map.deleteUserByID(id);
			sqlSession.commit();
			return true;
		} catch(Exception e) {
			System.out.println("error:::"+e);
			return false;
		} finally {
			sqlSession.close();
		}
	}
	
	public User update(int id) {
		SqlSession sqlSession = MyBatisConfiguration.fetchSqlSessionFactory().openSession();
		try {
			UserMapper map=sqlSession.getMapper(UserMapper.class);
			User user = map.getUserByID(id);
			return user;
		} catch(Exception e) {
			System.out.println("error:::"+e);
			return null;
		} finally {
			sqlSession.close();
		}
	}
	
	public void updateData(User user) {
		SqlSession sqlSession = MyBatisConfiguration.fetchSqlSessionFactory().openSession();
		try {
			UserMapper map=sqlSession.getMapper(UserMapper.class);
			map.updateBlog(user);
			sqlSession.commit();
		} catch(Exception e) {
			System.out.println("error:::"+e);
		} finally {
			sqlSession.close();
		}
	}
	
	public void save(User user) {
		SqlSession sqlSession = MyBatisConfiguration.fetchSqlSessionFactory().openSession();
		try {
			UserMapper map=sqlSession.getMapper(UserMapper.class);
			int t= map.insert(user);
			sqlSession.commit();
		} catch(Exception e) {
			System.out.println("error:::"+e);
			
		} finally {
			sqlSession.close();
		}
	}

	public boolean createUserForLogin(AuthUser auth) {
		SqlSession sqlSession = MyBatisConfiguration.fetchSqlSessionFactory().openSession();
		try{
			UserMapper mapper = sqlSession.getMapper(UserMapper.class);
			boolean result = mapper.createUserForLogin(auth);
			sqlSession.commit();
			return result;
		}catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}finally {
			sqlSession.close();
		}
	}

}
