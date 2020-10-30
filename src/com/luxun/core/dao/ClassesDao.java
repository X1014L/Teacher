package com.luxun.core.dao;
import java.util.List;
import com.luxun.core.po.Classes;
/**
 * Classes接口
 */
public interface ClassesDao {
    // 课程列表
	public List<Classes> selectClassesList(Classes classes);
	// 课程数
	public Integer selectClassesListCount(Classes classes);
	// 创建课程
	public int createClasses(Classes classes);
	public Classes getClassesById(Integer id);
	public int updateClasses(Classes classes);
	public int deleteClasses(Integer id);
}
