package com.luxun.core.service.impl;
import java.util.List;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.luxun.common.utils.Page;
import com.luxun.core.dao.ClassesDao;
import com.luxun.core.po.Classes;
import com.luxun.core.po.Teacher;
import com.luxun.core.service.ClassesService;
/**
 * 客户管理
 */
@Service("classesService")
@Transactional
public class ClassesServiceImpl implements ClassesService {
	// 声明DAO属性并注入
		@Autowired
		private ClassesDao classesDao;

		@Override
		public Page<Classes> findClassesList(Integer page, Integer rows, String time, String place,
				String classname) {
			// 创建学生对象
			Classes classes = new Classes();
	         // 判断学生姓名
			if(StringUtils.isNoneBlank(time)){
	 			classes.setTime(time);
	 		}
	 		// 判断学生性别
	 		if(StringUtils.isNotBlank(place)){
	 			classes.setPlace(place);
	 		}
			// 判断学生年龄
	 		if(StringUtils.isNotBlank(classname)){
	 			classes.setClassname(classname);
	 		}
			// 当前页
	 		classes.setStart((page-1) * rows) ;
			// 每页数
	 		classes.setRows(rows);
			// 查询客户列表
			List<Classes> classess = 
					classesDao.selectClassesList(classes);
			// 查询客户列表总记录数
			Integer count = classesDao.selectClassesListCount(classes);
			// 创建Page返回对象
			Page<Classes> result = new Page<>();
			result.setPage(page);
			result.setRows(classess);
			result.setSize(rows);
			result.setTotal(count);
			return result;
		}

		@Override
		public int createClasses(Classes classes) {
			return classesDao.createClasses(classes);
		}

		@Override
		public Classes getClassesById(Integer id) {
			Classes classes = classesDao.getClassesById(id);
		    return classes;
		}

		@Override
		public int updateClasses(Classes classes) {
			return classesDao.updateClasses(classes);
		}

		@Override
		public int deleteClasses(Integer id) {
			return classesDao.deleteClasses(id);
		}
		
}
