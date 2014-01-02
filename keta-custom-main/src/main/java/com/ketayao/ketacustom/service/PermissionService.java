/**
 * There are <a href="https://github.com/ketayao/keta-custom">keta-custom</a> code generation
 */
package com.ketayao.ketacustom.service;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import com.ketayao.ketacustom.entity.main.Permission;
import com.ketayao.ketacustom.util.dwz.Page;

public interface PermissionService {
	Permission get(Long id);

	void saveOrUpdate(Permission permission);

	void delete(Long id);
	
	List<Permission> findAll(Page page);
	
	List<Permission> findByExample(Specification<Permission> specification, Page page);
}
