/**
 * There are <a href="https://github.com/ketayao/keta-custom">keta-custom</a> code generation
 */
package com.ketayao.ketacustom.service;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import com.ketayao.ketacustom.entity.main.User;
import com.ketayao.ketacustom.util.dwz.Page;

public interface UserService {
	User get(Long id);

	void saveOrUpdate(User user);

	void delete(Long id);
	
	List<User> findAll(Page page);
	
	List<User> findByExample(Specification<User> specification, Page page);
	
	void updatePwd(User user, String newPwd);
	
	void resetPwd(User user, String newPwd);
	
	User getByUsername(String username);
}
