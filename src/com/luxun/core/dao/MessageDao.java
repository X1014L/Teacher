package com.luxun.core.dao;
import java.util.List;
import com.luxun.core.po.Message;
/**
 * Message接口
 */
public interface MessageDao {
    // 课程列表
	public List<Message> selectMessageList(Message message);
	// 课程数
	public Integer selectMessageListCount(Message message);
	// 创建课程
	public int createMessage(Message message);
	public Message getMessageById(Integer id);
	public int updateMessage(Message message);
	public int deleteMessage(Integer id);
}
