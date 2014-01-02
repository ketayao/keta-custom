/**
 * There are <a href="https://github.com/ketayao/keta-custom">keta-custom</a> code generation
 */
package com.ketayao.ketacustom.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.ketayao.ketacustom.entity.main.User;

public interface UserDAO extends JpaRepository<User, Long>, JpaSpecificationExecutor<User> {
	User getByUsername(String username);

	List<User> findByOrganizationId(Long id);
}