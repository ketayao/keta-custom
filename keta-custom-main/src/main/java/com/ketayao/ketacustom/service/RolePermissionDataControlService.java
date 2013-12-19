/**
 * There are <a href="https://github.com/ketayao/keta-custom">keta-custom</a> code generation
 */
package com.ketayao.ketacustom.service;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import com.ketayao.ketacustom.entity.main.RolePermissionDataControl;
import com.ketayao.ketacustom.util.dwz.Page;

public interface RolePermissionDataControlService {
	RolePermissionDataControl get(Long id);

	void saveOrUpdate(RolePermissionDataControl rolePermissionDataControl);

	void delete(Long id);
	
	List<RolePermissionDataControl> findAll(Page page);
	
	List<RolePermissionDataControl> findByExample(Specification<RolePermissionDataControl> specification, Page page);
	
	void save(Iterable<RolePermissionDataControl> entities);
	
	void delete(Iterable<RolePermissionDataControl> entities);

	List<RolePermissionDataControl> findByRolePermissionId(Long rolePermissionId);
	
	List<RolePermissionDataControl> findByRoleId(Long roleId);
}
