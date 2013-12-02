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
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="BT_User")
public class User extends IdEntity{
	
	private String username;
	
	private String realname;

	private String telephone;

	private String mobilephone;

	private String department;

	@Temporal(TemporalType.DATE)
	private Date createTime;

	private String password;

	private String salt;
	
	@Transient
	@JsonIgnore
	private String plainPassword;

	private String rolename;
	

	@ManyToMany(targetEntity=Role.class,fetch=FetchType.LAZY,cascade={CascadeType.REFRESH})
	@JoinTable(name="BT_RoleRelUser",joinColumns={@JoinColumn(name="BT_User_ID")},
	inverseJoinColumns={@JoinColumn(name="BT_Role_ID")})
	private Collection<Role> roles= new ArrayList<Role>();

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getMobilephone() {
		return mobilephone;
	}

	public void setMobilephone(String mobilephone) {
		this.mobilephone = mobilephone;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	
	public String getPlainPassword() {
		return plainPassword;
	}

	public void setPlainPassword(String plainPassword) {
		this.plainPassword = plainPassword;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	@JsonIgnore
	public Collection<Role> getRoles() {
		return roles;
	}

	public void setRoles(Collection<Role> roles) {
		this.roles = roles;
	}

	public String getRolename() {
		return rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}

	@Override
	public String toString() {
		return "User [username=" + username + ", realname=" + realname
				+ ", telephone=" + telephone + ", mobilephone=" + mobilephone
				+ ", department=" + department + ", rolename=" + rolename + "]";
	}

	
}
