package com.luxun.core.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.luxun.common.utils.Page;
import com.luxun.core.po.Message;
import com.luxun.core.service.MessageService;
/**
 * 客户管理控制器类
 */
@Controller
public class MessageController {
	// 依赖注入
		@Autowired
		private MessageService messageService;
		/**
		 *  学生列表
		 */
		@RequestMapping(value = "/message/list.action")
		public String list(@RequestParam(defaultValue="1")Integer page,
				@RequestParam(defaultValue="10")Integer rows,
				Integer userid, String content, Integer id,Model model) {
			// 条件查询所有学生		
			
			Page<Message> messages = messageService
					.findMessageList(page, rows,userid,content,id);
			model.addAttribute("page", messages);
			model.addAttribute("userid", userid);
			model.addAttribute("id", id);
			model.addAttribute("content", content);
			model.addAttribute("func", "message");
			return "teacher";
		}
		/**
		 * 创建学生
		 */
		@RequestMapping("/message/create.action")
		@ResponseBody
		public String messageCreate(Message message,HttpSession session) {
		    // 执行Service层中的创建方法，返回的是受影响的行数
		    int rows = messageService.createMessage(message);
		    if(rows > 0){
		        return "OK";
		    }else{
		        return "FAIL";
		    }
		}
		/**
		 * 通过id获取学生信息
		 */
		@RequestMapping("/message/getMessageById.action")
		@ResponseBody
		public Message getMessageById(Integer id) {
			Message classes = messageService.getMessageById(id);
		    return classes;
		}
		
		/**
		 * 更新学生
		 */
		@RequestMapping("/message/update.action")
		@ResponseBody
		public String messageUpdate(Message message) {
			//System.out.println(Classes.getId()+"这是id呀");
		    int rows = messageService.updateMessage(message);
		    if(rows > 0){
		        return "OK";
		    }else{
		        return "FAIL";
		    }
		}

		/**
		 * 删除客户
		 */
		@RequestMapping("/message/delete.action")
		@ResponseBody
		public String messageDelete(Integer id) {
			System.out.println("我是表现层");
		    int rows = messageService.deleteMessage(id);
		    if(rows > 0){			
		        return "OK";
		    }else{
		        return "FAIL";			
		    }
		}
}
