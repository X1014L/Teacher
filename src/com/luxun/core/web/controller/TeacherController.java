package com.luxun.core.web.controller;
import java.sql.Timestamp;
import java.util.Date;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.luxun.common.utils.Page;
import com.luxun.core.po.Teacher;
import com.luxun.core.po.Manager;
import com.luxun.core.service.TeacherService;
/**
 * 客户管理控制器类
 */
@Controller
public class TeacherController {
	// 依赖注入
	@Autowired
	private TeacherService teacherService;
	
	/**
	 *  客户列表
	 */
	@RequestMapping(value = "/teacher/list.action")
	public String list(@RequestParam(defaultValue="1")Integer page,
			@RequestParam(defaultValue="10")Integer rows, 
			String username, String teacherid, String birthday,
			String work, Model model) {
		// 条件查询所有客户
		Page<Teacher> teachers = teacherService
				.findTeacherList(page, rows, username, 
						teacherid,birthday,work);
		model.addAttribute("page", teachers);
		// 添加参数
		model.addAttribute("username", username);
		model.addAttribute("teacherid", teacherid);
		model.addAttribute("birthday", birthday);
		model.addAttribute("work", work);
		model.addAttribute("func", "teacher");
		return "teacher";
	}
	
	/**
	 * 创建客户
	 */
	@RequestMapping("/teacher/create.action")
	@ResponseBody
	public String teacherCreate(Teacher teacher,HttpSession session) {
	    // 获取Session中的当前用户信息
		Manager manager = (Manager) session.getAttribute("USER_SESSION");
	    // 将当前用户id存储在客户对象中
		teacher.setId(manager.getId());
	    // 创建Date对象
	    Date date = new Date();
	    // 得到一个Timestamp格式的时间，存入mysql中的时间格式“yyyy/MM/dd HH:mm:ss”
	    Timestamp timeStamp = new Timestamp(date.getTime());
	    teacher.setCreatetime(timeStamp);
	    // 执行Service层中的创建方法，返回的是受影响的行数
	    int rows = teacherService.createTeacher(teacher);
	    if(rows > 0){
	        return "OK";
	    }else{
	        return "FAIL";
	    }
	}

	/**
	 * 通过id获取客户信息
	 */
	@RequestMapping("/teacher/getTeacherById.action")
	@ResponseBody
	public Teacher getTeacherById(Integer id) {
		Teacher teacher = teacherService.getTeacherById(id);
	    return teacher;
	}
	/**
	 * 更新客户
	 */
	@RequestMapping("/teacher/update.action")
	@ResponseBody
	public String teacherUpdate(Teacher teacher) {
	    int rows = teacherService.updateTeacher(teacher);
	    if(rows > 0){
	        return "OK";
	    }else{
	        return "FAIL";
	    }
	}

	/**
	 * 删除客户
	 */
	@RequestMapping("/teacher/delete.action")
	@ResponseBody
	public String teacherDelete(Integer id) {
	    int rows = teacherService.deleteTeacher(id);
	    if(rows > 0){			
	        return "OK";
	    }else{
	        return "FAIL";			
	    }
	}

}
