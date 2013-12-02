package com.brother.basic.entity;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="BT_Role")
public class Role extends IdEntity{

	private String name;

	private String code;

	private String createBy;

	@Temporal(TemporalType.DATE)
	private Date createTime;
	
	@ManyToMany(mappedBy="roles",targetEntity=User.class ,fetch=FetchType.LAZY,cascade={CascadeType.REFRESH})
	private Collection<User> users = new ArrayList<User>();
	
	@ManyToMany(fetch=FetchType.LAZY,cascade=CascadeType.REFRESH )
	@JoinTable(name="BT_RolePermission",joinColumns={@JoinColumn(name="role_id")},
		inverseJoinColumns={@JoinColumn(name="permission_id")})
	private Collection<Permission> permissions = new ArrayList<Permission>();
	
	@ManyToMany(fetch=FetchType.LAZY,cascade=CascadeType.REFRESH )
	@JoinTable(name="BT_RoleRelModule",joinColumns={@JoinColumn(name="role_id")},
		inverseJoinColumns={@JoinColumn(name="module_id")})
	private Collection<Module> modules = new ArrayList<Module>();
	
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

	public Collection<User> getUsers() {
		return users;
	}

	public void setUsers(Collection<User> users) {
		this.users = users;
	}

	@JsonIgnore
	public Collection<Permission> getPermissions() {
		return permissions;
	}

	public void setPermissions(Collection<Permission> permissions) {
		this.permissions = permissions;
	}

	public String getName() {
		return name;
	}
	
	@JsonIgnore
	public Collection<Module> getModules() {
		return modules;
	}

	public void setModules(Collection<Module> module) {
		this.modules = module;
	}

	@Override
	public String toString() {
		return "Role [name=" + name + ", code=" + code + "]";
	}
		
}
