package com.brother.basic.entity;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="BT_Role")
public class Role extends IdEntity{

	private String name;

	private String code;

	private String createBy;

	@Temporal(TemporalType.TIME)
	private Date createTime;
	
	@ManyToMany(mappedBy="roles",targetEntity=User.class ,fetch=FetchType.LAZY)
	private Collection<User> users = new ArrayList<User>();

	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(name="BT_Menu_Authority",joinColumns={@JoinColumn(name="roleId")}
	,inverseJoinColumns={@JoinColumn(name="menuId")})
	private Collection<Menu> menus = new ArrayList<Menu>();
	
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(name="BT_Module_Authority",joinColumns={@JoinColumn(name="roleId")}
	,inverseJoinColumns={@JoinColumn(name="moduleId")})
	private Collection<Module> modules = new ArrayList<Module>();
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
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

	public Collection<Menu> getMenus() {
		return menus;
	}

	public void setMenus(Collection<Menu> menus) {
		this.menus = menus;
	}

	public Collection<Module> getModules() {
		return modules;
	}

	public void setModules(Collection<Module> modules) {
		this.modules = modules;
	}

	public Collection<User> getUsers() {
		return users;
	}

	public void setUsers(Collection<User> users) {
		this.users = users;
	}
	
	
	
}
