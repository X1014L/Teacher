package com.luxun.core.service;
import com.luxun.common.utils.Page;
import com.luxun.core.po.Reward;
public interface RewardService {
	// 查询客户列表
	public Page<Reward> findRewardList(Integer page, Integer rows,
			String name,String grand);

	public int createReward(Reward reward);

	public Reward getRewardById(Integer id);

	public int updateReward(Reward reward);

	public int deleteReward(Integer id);
}
