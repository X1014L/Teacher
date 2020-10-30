package com.luxun.core.dao;
import org.apache.ibatis.annotations.Param;
import com.luxun.core.po.Manager;
/**
 * 用户DAO层接口
 */
public interface ManagerDao {
	/**
	 * 通过账号和密码查询用户
	 */
	public Manager findManager(@Param("username") String username,
			                @Param("password") String password);
}
