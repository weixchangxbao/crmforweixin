package com.brother.basic.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Enumerated;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

@Entity
@Table(name="BT_Module")
public class Module extends IdEntity{

	private String name;

	private String picture;

	@Column(name="type")
	@Enumerated
	private ModuleType type;

	private int orderIndex;

	private String url;

	private String createBy;

	@Temporal(TemporalType.DATE)
	private Date createTime;
	
	@Transient
	private boolean chosed;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public ModuleType getType() {
		return type;
	}

	public void setType(ModuleType type) {
		this.type = type;
	}

	public int getOrderIndex() {
		return orderIndex;
	}

	public void setOrderIndex(int orderIndex) {
		this.orderIndex = orderIndex;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getCreateBy() {
		return createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((type == null) ? 0 : type.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Module other = (Module) obj;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (type != other.type)
			return false;
		return true;
	}

	public boolean isChosed() {
		return chosed;
	}

	public void setChosed(boolean chosed) {
		this.chosed = chosed;
	}

	@Override
	public String toString() {
		return "Module [name=" + name + ", picture=" + picture + ", type="
				+ type + ", orderIndex=" + orderIndex + ", url=" + url + "]";
	}
	
}
