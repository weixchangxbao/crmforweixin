package com.brother.basic.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.brother.basic.entity.Module;
import com.brother.basic.entity.Role;

public interface RoleDao extends PagingAndSortingRepository<Role, Long>, JpaSpecificationExecutor<Role>{

}
