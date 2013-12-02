package com.brother.basic.service.account;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.brother.basic.entity.Role;
import com.brother.basic.repository.RoleDao;
import com.brother.basic.search.SearchBean;

@Component
@Transactional
public class RoleService {

	private static Logger logger = LoggerFactory.getLogger(RoleService.class);

	@Autowired
	private RoleDao roleDao;

	@Autowired
	private EntityManagerFactory entityManagerFactory;

	public Page<Role> getRolesByPageInfo(SearchBean search) {
		Pageable pageable = new PageRequest(search.getPage(),
				search.getiDisplayLength());
		if(search.getsSearch() != null && !search.getsSearch().equals("")){
			roleDao.findBySearch(search.getsSearch(),pageable);
		}
		return roleDao.findAll(pageable);
	}

	public Role saveOrUpdate(Role role) {
		return roleDao.save(role);
	}

	public List<Role> getAllRoles() {
		return (List<Role>) roleDao.findAll();
	}

	public Role getRoleById(Long id) {
		return roleDao.findOne(id);
	}

	public void deleteById(Long id) {
		EntityManager em = entityManagerFactory.createEntityManager();
		EntityTransaction tx = em.getTransaction();
		tx.begin();
		Query query = em.createNativeQuery("delete from bt_role_rel_user  where bt_role_id="+ id);
		query.executeUpdate();
		tx.commit();
		em.close();
		roleDao.delete(id);
	}

	public Role getRoleByName(String name) {
		return roleDao.findByName(name);
	}

}
