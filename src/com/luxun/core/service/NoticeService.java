package com.luxun.core.service;
import com.luxun.common.utils.Page;
import com.luxun.core.po.Notice;
public interface  NoticeService {
	// 查询客户列表
	public Page<Notice> findNoticeList(Integer page, Integer rows,
			Integer id,String content,String title);

	public int createNotice(Notice notice);

	public Notice getNoticeById(Integer id);

	public int updateNotice(Notice notice);

	public int deleteNotice(Integer id);
}
