package com.luxun.core.service.impl;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.luxun.common.utils.Page;
import com.luxun.core.dao.NoticeDao;
import com.luxun.core.po.Notice;
import com.luxun.core.po.Teacher;
import com.luxun.core.service.NoticeService;
/**
 * 客户管理
 */
@Service("noticeService")
@Transactional
public class NoticeServiceImpl implements NoticeService {
	// 声明DAO属性并注入
		@Autowired
		private NoticeDao noticeDao;

		@Override
		public Page<Notice> findNoticeList(Integer page, Integer rows, Integer id, String content, String title) {
			// 创建客户对象
			Notice notice = new Notice();
			// 判断客户信息来源
			if(StringUtils.isNotBlank(content)){
				notice.setContent(content);
			}
			// 判断客户所属行业
			if(StringUtils.isNotBlank(title)){
				notice.setTitle(title);
			}
			// 当前页
			notice.setStart((page-1) * rows) ;
			// 每页数
			notice.setRows(rows);
			// 查询客户列表
			List<Notice> notices = 
					noticeDao.selectNoticeList(notice);
			// 查询客户列表总记录数
			Integer count = noticeDao.selectNoticeListCount(notice);
			// 创建Page返回对象
			Page<Notice> result = new Page<>();
			result.setPage(page);
			result.setRows(notices);
			result.setSize(rows);
			result.setTotal(count);
			return result;
		}

		@Override
		public int createNotice(Notice notice) {
			return noticeDao.createNotice(notice);
		}

		@Override
		public Notice getNoticeById(Integer id) {
			Notice notice = noticeDao.getNoticeById(id);
		    return notice;
		}

		@Override
		public int updateNotice(Notice notice) {
			 return noticeDao.updateNotice(notice);
		}

		@Override
		public int deleteNotice(Integer id) {
			return noticeDao.deleteNotice(id);
		}

}
