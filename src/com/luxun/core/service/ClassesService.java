package com.luxun.core.service;
import com.luxun.common.utils.Page;
import com.luxun.core.po.Classes;
public interface ClassesService {
	// 查询客户列表
	public Page<Classes> findClassesList(Integer page, Integer rows,
			String time,String place,String classname);

	public int createClasses(Classes classes);

	public Classes getClassesById(Integer id);

	public int updateClasses(Classes classes);

	public int deleteClasses(Integer id);
}
