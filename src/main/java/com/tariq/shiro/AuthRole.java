package com.tariq.shiro;

public class AuthRole {
	
	int id;
	String roleName;
	String userPermission;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getUserPermission() {
		return userPermission;
	}
	public void setUserPermission(String userPermission) {
		this.userPermission = userPermission;
	}
	
	@Override
	public String toString() {
		return "AuthRole [id=" + id + ", roleName=" + roleName + ", userPermission="
				+ userPermission + "]";
	}

}
