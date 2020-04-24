package com.tariq.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tariq.shiro.LoginUser;

@Controller
public class LoginController {

	Subject currentUser;

	private static final Logger logger = Logger.getLogger(LoginController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is " + locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate);
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String handleRequest(Model model, @ModelAttribute LoginUser authUser, BindingResult errs) {

		String username = authUser.getUserName();
		String password = authUser.getPassword();
		logger.info("USER : " + username + "   Pass: " + password);
		UsernamePasswordToken token = new UsernamePasswordToken(username, password);

		try {
			currentUser = SecurityUtils.getSubject();
			currentUser.login(token);
			currentUser.getSession().setAttribute("loginName", username);
			currentUser.getSession(true).setAttribute("userName", username);
			model.addAttribute("Msg", "Welcome " + username.toUpperCase() + " on this Portal");
			model.addAttribute("userName", username.toUpperCase());
			model.addAttribute(currentUser);
			if (currentUser.isAuthenticated()) {
				logger.info("USER : " + username + " ---- LOGIN SUCCESS !");
			} else {
				token.clear();
			}
			return "home";
		} catch (UnknownAccountException e1) {
			logger.info("USER : " + username + " ----" + e1);
			model.addAttribute("errorMsg", "Check username!");
			return "login";
		} catch (IncorrectCredentialsException e2) {
			logger.info("USER : " + username + " ----" + e2);
			model.addAttribute("errorMsg", "Check password!");
			return "login";
		} catch (LockedAccountException e3) {
			logger.info("USER : " + username + " ----" + e3);
			return "login";
		} catch (ExcessiveAttemptsException e4) {
			logger.info("USER : " + username + " ----" + e4);
			return "login";
		} catch (AuthenticationException e5) {
			logger.info("USER : " + username + " ----" + e5);
			return "login";
		} catch (Exception e) {
			logger.info("USER : " + username + " ----" + e);
			return "login";
		}

	}

	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public String handleRequestLogOut() {
		Subject currentUser = SecurityUtils.getSubject();
		currentUser.logout();
		return "login";
	}

	@RequestMapping(value = "/noAccess", method = RequestMethod.GET)
	public String allUser(Model model) {
		logger.info("NO ACCESS TO REQUEST");
		model.addAttribute("Msg", "You don't have permission to access the resource! YOU ARE NOT AN ADMIN.");
		model.addAttribute("userName", currentUser.getSession().getAttribute("userName").toString().toUpperCase());
		return "home";
	}

}
