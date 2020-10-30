package com.luxun.core.dao;
import java.util.List;
import com.luxun.core.po.Reward;
/**
 * Reward接口
 */
public interface RewardDao {
    // 奖惩列表
	public List<Reward> selectRewardList(Reward reward);
	// 奖惩数
	public Integer selectRewardListCount(Reward reward);
	// 创建奖惩
	public int createReward(Reward reward);
	public Reward getRewardById(Integer id);
	public int updateReward(Reward reward);
	public int deleteReward(Integer id);
}
