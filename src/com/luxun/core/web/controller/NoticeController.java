package com.luxun.core.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.luxun.common.utils.Page;
import com.luxun.core.po.Notice;
import com.luxun.core.service.NoticeService;
/**
 * 客户管理控制器类
 */
@Controller
public class NoticeController {
	// 依赖注入
		@Autowired
		private NoticeService noticeService;
		/**
		 *  学生列表
		 */
		@RequestMapping(value = "/notice/list.action")
		public String list(@RequestParam(defaultValue="1")Integer page,
				@RequestParam(defaultValue="10")Integer rows,
				Integer id, String content, String title,Model model) {
			// 条件查询所有学生		
			
			Page<Notice> notices = noticeService
					.findNoticeList(page, rows,id,content,title);
			model.addAttribute("page", notices);
			model.addAttribute("id", id);
			model.addAttribute("content", content);
			model.addAttribute("title", title);
			model.addAttribute("func", "notice");
			return "teacher";
		}
		/**
		 * 创建学生
		 */
		@RequestMapping("/notice/create.action")
		@ResponseBody
		public String noticeCreate(Notice notice,HttpSession session) {
		    // 执行Service层中的创建方法，返回的是受影响的行数
		    int rows = noticeService.createNotice(notice);
		    if(rows > 0){
		        return "OK";
		    }else{
		        return "FAIL";
		    }
		}
		/**
		 * 通过id获取学生信息
		 */
		@RequestMapping("/notice/getNoticeById.action")
		@ResponseBody
		public Notice getNoticeById(Integer id) {
			Notice notice = noticeService.getNoticeById(id);
		    return notice;
		}
		
		/**
		 * 更新学生
		 */
		@RequestMapping("/notice/update.action")
		@ResponseBody
		public String noticeUpdate(Notice notice) {
			//System.out.println(Classes.getId()+"这是id呀");
		    int rows = noticeService.updateNotice(notice);
		    if(rows > 0){
		        return "OK";
		    }else{
		        return "FAIL";
		    }
		}

		/**
		 * 删除客户
		 */
		@RequestMapping("/notice/delete.action")
		@ResponseBody
		public String noticeDelete(Integer id) {
			System.out.println("我是表现层");
		    int rows = noticeService.deleteNotice(id);
		    if(rows > 0){			
		        return "OK";
		    }else{
		        return "FAIL";			
		    }
		}
}
