/**
 * There are <a href="https://github.com/ketayao/keta-custom">keta-custom</a> code generation
 */
package com.ketayao.ketacustom.service;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import com.ketayao.ketacustom.entity.main.Module;
import com.ketayao.ketacustom.util.dwz.Page;

public interface ModuleService {
	Module get(Long id);

	void saveOrUpdate(Module module);

	void delete(Long id);
	
	List<Module> findAll(Page page);
	
	List<Module> findByExample(Specification<Module> specification, Page page);
	
	Module getTree();
	
	List<Module> findAll();
}
