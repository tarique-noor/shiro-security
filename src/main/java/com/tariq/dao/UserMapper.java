package com.tariq.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.tariq.entity.User;
import com.tariq.shiro.AuthUser;

public interface UserMapper {
	
	public static final String QRY_GetUserByID = "SELECT * from user where user_id=#{id}";
	public static final String QRY_GetAllUser = "SELECT * from user";
	public static final String QRY_DeleteUserByID = "DELETE FROM user WHERE user_id=#{id}";
	public static final String QRY_UpdateUserByID  = "UPDATE user SET user_name=#{user_name}, user_phone=#{user_phone}, user_address=#{user_address} WHERE user_id=#{user_id}";
	public static final String QRY_Insert  = "insert into user (user_name, user_phone, user_address) values (#{user_name}, #{user_phone}, #{user_address})";
	public static final String QRY_Create  = "insert into auth_cred (user_name, password, user_role) values (#{userName}, #{password}, #{userRole})";


	@Select(QRY_GetUserByID)
	public User getUserByID(int id);
	
	@Select(QRY_GetAllUser)
	public ArrayList<User> getAllUser();
	
	@Delete(QRY_DeleteUserByID)
	public void deleteUserByID(int id);
	
	@Update(QRY_UpdateUserByID)
	public void updateBlog(User user);
	
	@Insert(QRY_Insert)
	public int insert(User user);
	
	@Insert(QRY_Create)
	public boolean createUserForLogin(AuthUser auth);

}
