package com.luxun.core.dao;
import java.util.List;
import com.luxun.core.po.Notice;
/**
 * Notice接口
 */
public interface NoticeDao {
    // 课程列表
	public List<Notice> selectNoticeList(Notice notice);
	// 课程数
	public Integer selectNoticeListCount(Notice notice);
	// 创建课程
	public int createNotice(Notice notice);
	public Notice getNoticeById(Integer id);
	public int updateNotice(Notice notice);
	public int deleteNotice(Integer id);
}
