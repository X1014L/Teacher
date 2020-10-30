package com.luxun.core.po;

import java.io.Serializable;
/**
 * 奖惩持久化类
 */
public class Reward implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String createtime;
	private String grand;
	private String name;
	private Integer type;
	private Integer userid;
	private Integer start;            // 起始行
	private Integer rows;             // 所取行数
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCreatetime() {
		return createtime;
	}
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
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public String getGrand() {
		return grand;
	}
	public void setGrand(String grand) {
		this.grand = grand;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
}
