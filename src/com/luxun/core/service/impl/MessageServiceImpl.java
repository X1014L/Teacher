package com.luxun.core.service.impl;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.luxun.common.utils.Page;
import com.luxun.core.dao.MessageDao;
import com.luxun.core.po.Message;
import com.luxun.core.po.Teacher;
import com.luxun.core.service.MessageService;
/**
 * 客户管理
 */
@Service("messageService")
@Transactional
public class MessageServiceImpl implements  MessageService {
	// 声明DAO属性并注入
		@Autowired
		private MessageDao messageDao;

		@Override
		public Page<Message> findMessageList(Integer page, Integer rows, Integer userid, String content, Integer id) {
			// 创建客户对象
			Message message = new Message();
			// 判断客户所属行业
			if(StringUtils.isNotBlank(content)){
				message.setContent(content);
			}
			// 当前页
			message.setStart((page-1) * rows) ;
			// 每页数
			message.setRows(rows);
			// 查询客户列表
			List<Message> messages = 
					messageDao.selectMessageList(message);
			// 查询客户列表总记录数
			Integer count = messageDao.selectMessageListCount(message);
			// 创建Page返回对象
			Page<Message> result = new Page<>();
			result.setPage(page);
			result.setRows(messages);
			result.setSize(rows);
			result.setTotal(count);
			return result;
		}

		@Override
		public int createMessage(Message message) {
			return messageDao.createMessage(message);
		}

		@Override
		public Message getMessageById(Integer id) {
			Message message = messageDao.getMessageById(id);
		    return message;
		}

		@Override
		public int updateMessage(Message message) {
			 return messageDao.updateMessage(message);
		}

		@Override
		public int deleteMessage(Integer id) {
			return messageDao.deleteMessage(id);
		}
		
}
