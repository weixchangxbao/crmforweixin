package com.brother.basic.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="BT_ActionLog")
public class ActionLog extends IdEntity{

	private String actionName;

	@Temporal(TemporalType.TIME)
	private Date actionTime;

	private String ip;

	private String detail;

	@ManyToOne()
	@JoinColumn(name="userId")
	private User user;

	public String getActionName() {
		return actionName;
	}

	public void setActionName(String actionName) {
		this.actionName = actionName;
	}

	public Date getActionTime() {
		return actionTime;
	}

	public void setActionTime(Date actionTime) {
		this.actionTime = actionTime;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
}
