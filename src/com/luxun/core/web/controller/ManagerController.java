package com.luxun.core.web.controller;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.luxun.core.po.Manager;
import com.luxun.core.service.ManagerService;
/**
 * 用户控制器类
 */
@Controller
public class ManagerController {
	// 依赖注入
	@Autowired
	private ManagerService managerService;
	/**
	 * 用户登录
	 */
	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public String login(String username,String password, Model model, 
                                                          HttpSession session) {
		// 通过账号和密码查询用户
		Manager manager = managerService.findManager(username, password);
		if(manager != null){		
			// 将用户对象添加到Session
			session.setAttribute("USER_SESSION", manager);
			// 跳转到主页面
//			return "teacher";
			return "redirect:teacher/list.action";
		}
		model.addAttribute("msg", "账号或密码错误，请重新输入！");
         // 返回到登录页面
		return "login";
	}
	
	/**
	 * 模拟其他类中跳转到客户管理页面的方法
	 */
	@RequestMapping(value = "/toTeacher.action")
	public String toTeacher() {
	    return "teacher";
	}
	
	/**
	 * 退出登录
	 */
	@RequestMapping(value = "/logout.action")
	public String logout(HttpSession session) {
	    // 清除Session
	    session.invalidate();
	    // 重定向到登录页面的跳转方法
	    return "redirect:login.action";
	}
	/**
	 * 向用户登陆页面跳转
	 */
	@RequestMapping(value = "/login.action", method = RequestMethod.GET)
	public String toLogin() {
	    return "login";
	}


}
