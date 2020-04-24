package com.tariq.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tariq.entity.User;
import com.tariq.shiro.AuthUser;
import com.tariq.shiro.UserService;

@Controller
public class AdminController {
	
	@Autowired
	UserService userService;
	
	private static final Logger logger = Logger.getLogger(AdminController.class);
	
	@RequestMapping(value = "/allUser", method = RequestMethod.GET)
	public String noAccess(Model model) {
		logger.info("Fetching All User's Details");
		model.addAttribute("users", userService.allUser());
		return "admin";
	}
	
	@RequestMapping( value = "/update", method = RequestMethod.GET)
	public String update(@RequestParam("id") int id, Model model){
		
		model.addAttribute("user", userService.update(id));
		return "update";
	}
	
	@RequestMapping( value = "/register", method = RequestMethod.GET)
	public String register( Model model){
		
		model.addAttribute("user", new User());
		return "update";
	}
	
	@RequestMapping("/newRegister")
	public String createUserForLogin(Model model){
		
		model.addAttribute("authuser", new AuthUser());
		return "createlogin";
	}
	
	@RequestMapping(value = "/newRegister", method = RequestMethod.POST)
	public String saveUserForLogin(@ModelAttribute("authuser") AuthUser auth, Model model){
		
		boolean result = userService.createUserForLogin(auth);
		if(result){
			model.addAttribute("Msg", "New User For login is registered successfully");
		}else{
			model.addAttribute("Msg", "Opss!!!... User Not Register");
		}
		
		return "home";
	}
	
	@RequestMapping("/save")
	public String save(@ModelAttribute("fiberhome") User user){
		
		if(user.getUser_id() == null){
			userService.save(user);
		}else{
			userService.updateData(user);
		}
		return "redirect:/allUser";
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam("id") int id){
		userService.delete(id);
		return "redirect:/allUser";
	}
	

}
