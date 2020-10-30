package com.luxun.core.service;
import com.luxun.core.po.Manager;
/**
 * 用户Service层接口
 */
public interface ManagerService {
	// 通过账号和密码查询用户
	public Manager findManager(String username,String password);
}
