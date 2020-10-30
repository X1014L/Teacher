package com.luxun.core.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.luxun.common.utils.Page;
import com.luxun.core.po.Classes;
import com.luxun.core.service.ClassesService;
/**
 * 客户管理控制器类
 */
@Controller
public class ClassesController {
	// 依赖注入
		@Autowired
		private ClassesService classesService;
		/**
		 *  学生列表
		 */
		@RequestMapping(value = "/classes/list.action")
		public String list(@RequestParam(defaultValue="1")Integer page,
				@RequestParam(defaultValue="10")Integer rows,
				String place,String classname,String time,Model model) {
			// 条件查询所有学生		
			
			Page<Classes> classess = classesService
					.findClassesList(page, rows,place,classname,time);
			model.addAttribute("page", classess);
			model.addAttribute("place", place);
			model.addAttribute("classname", classname);
			model.addAttribute("time", time);
			model.addAttribute("func", "classes");
			return "teacher";
		}
		/**
		 * 创建学生
		 */
		@RequestMapping("/classes/create.action")
		@ResponseBody
		public String classesCreate(Classes classes,HttpSession session) {
		    // 执行Service层中的创建方法，返回的是受影响的行数
		    int rows = classesService.createClasses(classes);
		    if(rows > 0){
		        return "OK";
		    }else{
		        return "FAIL";
		    }
		}
		/**
		 * 通过id获取学生信息
		 */
		@RequestMapping("/classes/getClassesById.action")
		@ResponseBody
		public Classes getClassesById(Integer id) {
			Classes classes = classesService.getClassesById(id);
		    return classes;
		}
		
		/**
		 * 更新学生
		 */
		@RequestMapping("/classes/update.action")
		@ResponseBody
		public String classesUpdate(Classes classes) {
			//System.out.println(Classes.getId()+"这是id呀");
		    int rows = classesService.updateClasses(classes);
		    if(rows > 0){
		        return "OK";
		    }else{
		        return "FAIL";
		    }
		}

		/**
		 * 删除客户
		 */
		@RequestMapping("/classes/delete.action")
		@ResponseBody
		public String classesDelete(Integer id) {
			System.out.println("我是表现层");
		    int rows = classesService.deleteClasses(id);
		    if(rows > 0){			
		        return "OK";
		    }else{
		        return "FAIL";			
		    }
		}
}
