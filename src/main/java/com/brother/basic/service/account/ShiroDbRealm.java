package com.brother.basic.service.account;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.PostConstruct;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springside.modules.utils.Encodes;

import com.brother.basic.entity.Module;
import com.brother.basic.entity.ModuleType;
import com.brother.basic.entity.Permission;
import com.brother.basic.entity.Role;
import com.brother.basic.entity.User;
import com.brother.basic.service.permission.PermissionService;
import com.google.common.base.Objects;

public class ShiroDbRealm extends AuthorizingRealm{

	protected AccountService accountService;
	protected PermissionService	permissionService;
	
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		ShiroUser su = (ShiroUser)super.getAvailablePrincipal(principals);
		String account = su.getUserName();
		User user = accountService.findUserByUsername(account);
		List<String> roles = new ArrayList<String>();
		List<String> permissions = new ArrayList<String>();
		List<Long> pictures = new ArrayList<Long>();
		List<Long> functions = new ArrayList<Long>();
		if(user != null){
			//针对超级管理员赋予所有权限
			if(user.getId()==1){
				Iterable<Permission> perms = permissionService.findAll();
				Iterator<Permission> iter = perms.iterator();
				while(iter.hasNext()){
					permissions.add(iter.next().getRule());
				}
				roles.add("admin");
			}else{
				if(user.getRoles() != null && user.getRoles().size() > 0){
					for(Role role : user.getRoles()){
						roles.add(role.getName());
						if(role.getPermissions() != null && role.getPermissions().size()>0){
							for(Permission permission: role.getPermissions()){
								permissions.add(permission.getRule());
							}
						}
						if(role.getModules() != null && role.getModules().size()>0){
							for(Module module:role.getModules()){
								if(module.getType() == ModuleType.PICTURE){
									pictures.add(module.getId());
								}else{
									functions.add(module.getId());
								}
							}
						}
					}
				}
			}
		}else{
			throw new AuthorizationException();
		}
		info.addRoles(roles);
		info.addStringPermissions(permissions);
		su.setFunctionModule(functions);
		su.setPictureModule(pictures);
		return info;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken authcToken) throws AuthenticationException {
		UsernamePasswordToken token = (UsernamePasswordToken)authcToken;
		User user = accountService.findUserByUsername(token.getUsername());
		if (user != null) {
			byte[] salt = Encodes.decodeHex(user.getSalt());
			return new SimpleAuthenticationInfo(new ShiroUser(user.getId(), user.getUsername(), user.getRealname()),
					user.getPassword(), ByteSource.Util.bytes(salt), getName());
		} else {
			return null;
		}
	}
	
	/**
	 * 设定Password校验的Hash算法与迭代次数.
	 */
	@PostConstruct
	public void initCredentialsMatcher() {
		HashedCredentialsMatcher matcher = new HashedCredentialsMatcher(AccountService.HASH_ALGORITHM);
		matcher.setHashIterations(AccountService.HASH_INTERATIONS);

		setCredentialsMatcher(matcher);
	}

	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}
	
	public void setPermissionService(PermissionService permissionService) {
		this.permissionService = permissionService;
	}

	
	/**
	 * 自定义Authentication对象，使得Subject除了携带用户的登录名外还可以携带更多信息.
	 */
	public static class ShiroUser implements Serializable {
		private static final long serialVersionUID = -1373760761780840081L;
		public Long id;
		public String username;
		public String name;
		public List<Long> pictureModule = new ArrayList<Long>();
		public List<Long> functionModule = new ArrayList<Long>();
		
		public ShiroUser(Long id, String username, String name) {
			this.id = id;
			this.username = username;
			this.name = name;
		}

		public String getName() {
			return name;
		}
		
		public String getUserName() {
			return username;
		}
		/**
		 * 本函数输出将作为默认的<shiro:principal/>输出.
		 */
		@Override
		public String toString() {
			return username;
		}

		/**
		 * 重载hashCode,只计算loginName;
		 */
		@Override
		public int hashCode() {
			return Objects.hashCode(username);
		}

		/**
		 * 重载equals,只计算loginName;
		 */
		@Override
		public boolean equals(Object obj) {
			if (this == obj) {
				return true;
			}
			if (obj == null) {
				return false;
			}
			if (getClass() != obj.getClass()) {
				return false;
			}
			ShiroUser other = (ShiroUser) obj;
			if (username == null) {
				if (other.username != null) {
					return false;
				}
			} else if (!username.equals(other.username)) {
				return false;
			}
			return true;
		}

		public List<Long> getPictureModule() {
			return pictureModule;
		}

		public void setPictureModule(List<Long> pictureModule) {
			this.pictureModule = pictureModule;
		}

		public List<Long> getFunctionModule() {
			return functionModule;
		}

		public void setFunctionModule(List<Long> functionModule) {
			this.functionModule = functionModule;
		}
	}

}

