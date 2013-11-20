package com.brother.basic.service.account;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.security.utils.Digests;
import org.springside.modules.utils.DateProvider;
import org.springside.modules.utils.Encodes;

import com.brother.basic.entity.User;
import com.brother.basic.exception.ServiceException;
import com.brother.basic.repository.UserDao;
import com.brother.basic.service.account.ShiroDbRealm.ShiroUser;

@Component
@Transactional
public class AccountService {
	public static final String HASH_ALGORITHM = "SHA-1";
	public static final int HASH_INTERATIONS = 1024;
	private static final int SALT_SIZE = 8;

	private static Logger logger = LoggerFactory.getLogger(AccountService.class);

	private UserDao userDao;
	private DateProvider dateProvider = DateProvider.DEFAULT;


	public User getUser(Long id) {
		return userDao.findOne(id);
	}

	public User findUserByUsername(String username) {
		return userDao.findByUsername(username);
	}

	public void registerUser(User user) {
		entryptPassword(user);
		user.setCreateTime(dateProvider.getCurrentDate());

		userDao.save(user);
	}

	public void updateUser(User user) {
		if (StringUtils.isNotBlank(user.getPlainPassword())) {
			entryptPassword(user);
		}
		userDao.save(user);
	}

	public void deleteUser(Long id) {
		if (isSupervisor(id)) {
			logger.warn("操作员{}尝试删除超级管理员用户", getCurrentUserName());
			throw new ServiceException("不能删除超级管理员用户");
		}
		userDao.delete(id);
	}

	/**
	 * 判断是否超级管理员.
	 */
	private boolean isSupervisor(Long id) {
		return id == 1;
	}

	/**
	 * 取出Shiro中的当前用户LoginName.
	 */
	private String getCurrentUserName() {
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		return user.loginName;
	}

	/**
	 * 设定安全的密码，生成随机的salt并经过1024次 sha-1 hash
	 */
	private void entryptPassword(User user) {
		byte[] salt = Digests.generateSalt(SALT_SIZE);
		user.setSalt(Encodes.encodeHex(salt));

		byte[] hashPassword = Digests.sha1(user.getPlainPassword().getBytes(), salt, HASH_INTERATIONS);
		user.setPassword(Encodes.encodeHex(hashPassword));
	}

	@Autowired
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}


	public void setDateProvider(DateProvider dateProvider) {
		this.dateProvider = dateProvider;
	}
}
