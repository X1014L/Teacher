package com.luxun.core.dao;
import java.util.List;
import com.luxun.core.po.Teacher;
/**
 * Teacher接口
 */
public interface TeacherDao{
    // 教师列表
	public List<Teacher> selectTeacherList(Teacher teacher);
	// 教师数
	public Integer selectTeacherListCount(Teacher teacher);
	
	// 教师客户
	public int createTeacher(Teacher teacher);
	// 通过id查询教师
	public Teacher getTeacherById(Integer id);
	// 更新教师信息
	public int updateTeacher(Teacher teacher);
	// 删除教师
	int deleteTeacher (Integer id);

}
