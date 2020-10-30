package com.luxun.core.po;

import java.io.Serializable;
/**
 * 公告持久化类
 */
public class Notice implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String content;
	private String createtime;
	private Integer start;            // 起始行
	private Integer rows;             // 所取行数
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	private String title;
}
