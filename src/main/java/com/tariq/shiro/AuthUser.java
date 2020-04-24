package com.tariq.shiro;

public class AuthUser {
	
	int id;
	String userName;
	String password;
	String userRole;
	
	public AuthUser(String userName, String password) {
		super();
		this.userName = userName;
		this.password = password;
	}

	public AuthUser() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	@Override
	public String toString() {
		return "AuthCred [id=" + id + ", userName=" + userName + ", password=" + password + ", userRole=" + userRole
				+ "]";
	}

}
