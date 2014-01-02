/**
 * There are <a href="https://github.com/ketayao/keta-custom">keta-custom</a> code generation
 */
package com.ketayao.ketacustom.service;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import com.ketayao.ketacustom.entity.main.RolePermission;
import com.ketayao.ketacustom.util.dwz.Page;

public interface RolePermissionService {
	RolePermission get(Long id);

	void saveOrUpdate(RolePermission rolePermission);

	void delete(Long id);
	
	List<RolePermission> findAll(Page page);
	
	List<RolePermission> findByExample(Specification<RolePermission> specification, Page page);

	/**
	 * @param id
	 * @return
	 */
	List<RolePermission> findByRoleId(Long id);

	/**
	 * @param newRList
	 */
	void save(List<RolePermission> newRList);
	
	void delete(List<RolePermission> delRList);
}
