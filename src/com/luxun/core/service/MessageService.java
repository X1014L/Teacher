package com.luxun.core.service;
import com.luxun.common.utils.Page;
import com.luxun.core.po.Message;
public interface MessageService {
	// 查询客户列表
	public Page<Message> findMessageList(Integer page, Integer rows,
			Integer userid,String content,Integer id);

	public int createMessage(Message message);

	public Message getMessageById(Integer id);

	public int updateMessage(Message message);

	public int deleteMessage(Integer id);
}
