package com.tariq.shiro;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.config.IniSecurityManagerFactory;
import org.apache.shiro.util.Factory;
import org.apache.shiro.mgt.SecurityManager;

public class ShiroManager {
	
	private static Logger logger = Logger.getLogger(ShiroManager.class);
	
	private static Factory<org.apache.shiro.mgt.SecurityManager> factory;
	private static SecurityManager securityManager;
	private static UsernamePasswordToken token;

	static {
		factory = new IniSecurityManagerFactory("classpath:shiro.ini");
		securityManager = factory.getInstance();
		SecurityUtils.setSecurityManager(securityManager);
	}

}
