package com.luxun.core.service.impl;
import java.util.List;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.luxun.core.dao.TeacherDao;
import com.luxun.common.utils.Page;
import com.luxun.core.po.Teacher;
import com.luxun.core.service.TeacherService;
/**
 * 客户管理
 */
@Service("teacherService")
@Transactional
public class TeacherServiceImpl implements TeacherService {
	// 声明DAO属性并注入
	@Autowired
	private TeacherDao teacherDao;
	@Override
	public Page<Teacher> findTeacherList(Integer page, Integer rows, String username, String teacherid, String birthday,
			String work) {
		// 创建客户对象
		Teacher teacher = new Teacher();
		// 判断客户名称
		if(StringUtils.isNotBlank(username)){
			teacher.setUsername(username);
		}
		// 判断客户信息来源
		if(StringUtils.isNotBlank(teacherid)){
			teacher.setTeacherid(teacherid);
		}
		// 判断客户所属行业
		if(StringUtils.isNotBlank(birthday)){
			teacher.setBirthday(birthday);
		}
		// 判断客户级别
		if(StringUtils.isNotBlank(work)){
			teacher.setWork(work);
		}
		// 当前页
		teacher.setStart((page-1) * rows) ;
		// 每页数
		teacher.setRows(rows);
		// 查询客户列表
		List<Teacher> teachers = 
				teacherDao.selectTeacherList(teacher);
		// 查询客户列表总记录数
		Integer count = teacherDao.selectTeacherListCount(teacher);
		// 创建Page返回对象
		Page<Teacher> result = new Page<>();
		result.setPage(page);
		result.setRows(teachers);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}

	@Override
	public int createTeacher(Teacher teacher) {
		return teacherDao.createTeacher(teacher);
	}

	@Override
	public Teacher getTeacherById(Integer id) {
		Teacher teacher = teacherDao.getTeacherById(id);
	    return teacher;
	}

	@Override
	public int updateTeacher(Teacher teacher) {
		 return teacherDao.updateTeacher(teacher);
	}

	@Override
	public int deleteTeacher(Integer id) {
		return teacherDao.deleteTeacher(id);
	}
	
}
