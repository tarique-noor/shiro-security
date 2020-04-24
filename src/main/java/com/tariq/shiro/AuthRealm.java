package com.tariq.shiro;

import java.util.Set;

import org.apache.log4j.Logger;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

public class AuthRealm extends AuthorizingRealm {

	private static Logger logger = Logger.getLogger(AuthRealm.class);

	@Autowired
	UserService userService;

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken atoken) throws AuthenticationException {
		UsernamePasswordToken token = (UsernamePasswordToken) atoken;
		
		String userName = (String)token.getPrincipal();
		logger.info("Trying login for " + userName + " after authentication");
		AuthUser user = userService.getUserFromDB(userName);
		if (user == null) {
			return null;
		}
		
		logger.info("user name : "+userName +" and user pass : "+user.getPassword());
		SimpleAuthenticationInfo  authcInfo = new SimpleAuthenticationInfo(userName, user.getPassword(), getName());
		authcInfo.setCredentialsSalt(ByteSource.Util.bytes(userName) );
		
		return authcInfo;
		
	}
	
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		String username = (String) principals.getPrimaryPrincipal();
		logger.info("user name in authorization :: "+username);
	    SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
	    authorizationInfo.setRoles(userService.getRoles(username));
	    authorizationInfo.setStringPermissions(userService.getPermissions(userService.getRoles(username).iterator().next().toString()));
	    
	    
	    return authorizationInfo;
	}

}
