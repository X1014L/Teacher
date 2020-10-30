package com.luxun.core.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.luxun.core.dao.ManagerDao;
import com.luxun.core.po.Manager;
import com.luxun.core.service.ManagerService;
/**
 * 用户Service接口实现类
 */
@Service("managerService")
@Transactional
public class ManagerServiceImpl implements ManagerService {
	// 注入UserDao
	@Autowired
	private ManagerDao managerDao;
	// 通过账号和密码查询用户

	@Override
	public Manager findManager(String username, String password) {
		Manager manager = this.managerDao.findManager(username, password);
		return manager;
	}
	
}
