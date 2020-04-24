package com.tariq.shiro;

import java.util.LinkedHashSet;

import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.mybatis.spring.annotation.MapperScan;


@MapperScan
public interface ShiroMapper {
	
	public static final String QRY_Validate = "select password from auth_cred where user_name=#{userName}";
	public static final String QRY_GetRole = "select user_role from auth_cred where user_name=#{userName}";
	public static final String QRY_GetPermission = "select user_permission from auth_role where role_name =#{roleName}";

	@Select(QRY_Validate)
	@Results({ @Result(id = true, property = "password", column = "password") })
	public String authenticateUserPassword(String userName);
	
	@Select(QRY_GetPermission)
	@Results({ @Result(id = true, property = "userPermission", column = "user_permission") })
	public LinkedHashSet<String> getPermissionList(String roleName);

	@Select(QRY_GetRole)
	@Results({ @Result(id = true, property = "userRole", column = "user_role") })
	public LinkedHashSet<String> getUserRoleList(String userName);

}
