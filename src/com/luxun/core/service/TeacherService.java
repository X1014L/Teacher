package com.luxun.core.service;
import com.luxun.common.utils.Page;
import com.luxun.core.po.Teacher;
public interface TeacherService {
	// 查询客户列表
	public Page<Teacher> findTeacherList(Integer page, Integer rows, 
                                        String username,String teacherid,
                                        String birthday,String work);
	//创建客户
	public int createTeacher(Teacher teacher);
	
	// 通过id查询客户
	public Teacher getTeacherById(Integer id);
	// 更新客户
	public int updateTeacher(Teacher teacher);
	// 删除客户
	public int deleteTeacher(Integer id);

}
