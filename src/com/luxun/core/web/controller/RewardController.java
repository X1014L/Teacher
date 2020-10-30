package com.luxun.core.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.luxun.common.utils.Page;
import com.luxun.core.po.Reward;
import com.luxun.core.service.RewardService;
/**
 * 客户管理控制器类
 */
@Controller
public class RewardController {
	// 依赖注入
		@Autowired
		private RewardService rewardService;
		/**
		 *  学生列表
		 */
		@RequestMapping(value = "/reward/list.action")
		public String list(@RequestParam(defaultValue="1")Integer page,
				@RequestParam(defaultValue="10")Integer rows,
				 String name, String grand,Model model) {
			// 条件查询所有学生		
			
			Page<Reward> rewards = rewardService
					.findRewardList(page, rows,name,grand);
			model.addAttribute("page", rewards);
			model.addAttribute("name", name);
			model.addAttribute("grand", grand);
			model.addAttribute("func", "reward");
			return "teacher";
		}
		/**
		 * 创建学生
		 */
		@RequestMapping("/reward/create.action")
		@ResponseBody
		public String rewardCreate(Reward reward,HttpSession session) {
		    // 执行Service层中的创建方法，返回的是受影响的行数
		    int rows = rewardService.createReward(reward);
		    if(rows > 0){
		        return "OK";
		    }else{
		        return "FAIL";
		    }
		}
		/**
		 * 通过id获取学生信息
		 */
		@RequestMapping("/reward/getRewardById.action")
		@ResponseBody
		public Reward getRewardById(Integer id) {
			Reward reward = rewardService.getRewardById(id);
		    return reward;
		}
		
		/**
		 * 更新学生
		 */
		@RequestMapping("/reward/update.action")
		@ResponseBody
		public String rewardUpdate(Reward reward) {
			//System.out.println(Classes.getId()+"这是id呀");
		    int rows = rewardService.updateReward(reward);
		    if(rows > 0){
		        return "OK";
		    }else{
		        return "FAIL";
		    }
		}

		/**
		 * 删除客户
		 */
		@RequestMapping("/reward/delete.action")
		@ResponseBody
		public String rewardDelete(Integer id) {
			System.out.println("我是表现层");
		    int rows = rewardService.deleteReward(id);
		    if(rows > 0){			
		        return "OK";
		    }else{
		        return "FAIL";			
		    }
		}
}
