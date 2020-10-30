package com.luxun.core.service.impl;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.luxun.common.utils.Page;
import com.luxun.core.dao.RewardDao;
import com.luxun.core.po.Notice;
import com.luxun.core.po.Reward;
import com.luxun.core.service.RewardService;
/**
 * 客户管理
 */
@Service("rewardService")
@Transactional
public class RewardServiceImpl implements RewardService {
	// 声明DAO属性并注入
		@Autowired
		private RewardDao rewardDao;

		@Override
		public Page<Reward> findRewardList(Integer page, Integer rows, String name, String grand) {
			            // 创建客户对象
			            Reward reward = new Reward();
						// 判断客户信息来源
						if(StringUtils.isNotBlank(name)){
							reward.setName(name);
						}
						// 判断客户所属行业
						if(StringUtils.isNotBlank(grand)){
							reward.setGrand(grand);
						}
						// 当前页
						reward.setStart((page-1) * rows) ;
						// 每页数
						reward.setRows(rows);
						// 查询客户列表
						List<Reward> rewards = 
								rewardDao.selectRewardList(reward);
						// 查询客户列表总记录数
						Integer count = rewardDao.selectRewardListCount(reward);
						// 创建Page返回对象
						Page<Reward> result = new Page<>();
						result.setPage(page);
						result.setRows(rewards);
						result.setSize(rows);
						result.setTotal(count);
						return result;
		}

		@Override
		public int createReward(Reward reward) {
			return rewardDao.createReward(reward);
		}

		@Override
		public Reward getRewardById(Integer id) {
			Reward reward = rewardDao.getRewardById(id);
		    return reward;
		}

		@Override
		public int updateReward(Reward reward) {
			return rewardDao.updateReward(reward);
		}

		@Override
		public int deleteReward(Integer id) {
			return rewardDao.deleteReward(id);
		}
		
}
