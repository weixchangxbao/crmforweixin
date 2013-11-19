package com.brother.basic.repository;

import java.util.Date;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springside.modules.test.spring.SpringTransactionalTestCase;

import com.brother.basic.entity.User;

@ContextConfiguration(locations = { "/applicationContext.xml" })
public class UserDaoTest extends SpringTransactionalTestCase {

	@Autowired
	private UserDao userDao;

	@Test
	public void save(){
		userDao.findUserById(112l);
	}
}
