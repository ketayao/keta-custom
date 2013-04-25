/**
 * <pre>
 * Copyright:		Copyright(C) 2011-2012, ketayao.com
 * Filename:		com.ygsoft.security.service.impl.ModuleServiceImpl.java
 * Class:			ModuleServiceImpl
 * Date:			2012-8-6
 * Author:			<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version          1.1.0
 * Description:		
 *
 * </pre>
 **/
 
package com.ketayao.security.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ketayao.security.dao.ModuleDao;
import com.ketayao.security.entity.main.Module;
import com.ketayao.security.exception.ExistedException;
import com.ketayao.security.exception.ServiceException;
import com.ketayao.security.service.ModuleService;
import com.ketayao.util.dwz.Page;
import com.ketayao.util.dwz.springdata.PageUtils;

/** 
 * 	
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version  1.1.0
 * @since   2012-8-6 上午9:45:28 
 */
@Service
@Transactional(readOnly=true)
public class ModuleServiceImpl implements ModuleService {
	@Autowired
	private ModuleDao moduleDao;
	
	@Transactional
	@Override
	public void save(Module module) throws ExistedException {
		if (moduleDao.findBySn(module.getSn()).size() > 0) {
			throw new ExistedException("已存在sn=" + module.getSn() + "的模块。");
		}
		moduleDao.save(module);
	}

	@Override
	public Module get(Long id) {
		return moduleDao.findOne(id);
	}

	@Transactional
	@Override
	public void update(Module module) {
		moduleDao.save(module);
	}

	/**   
	 * @param id
	 * @throws ServiceException  
	 * @see com.ketayao.security.service.ModuleService#delete(int)  
	 */
	@Transactional
	public void delete(Long id) throws ServiceException {
		if (isRoot(id)) {
			throw new ServiceException("不允许删除根模块。");
		}
		
		Module module = this.get(id);
		
		//先判断是否存在子模块，如果存在子模块，则不允许删除
		if(module.getChildren().size() > 0){
			throw new ServiceException(module.getName() + "模块下存在子模块，不允许删除。");
		}
		
		moduleDao.delete(module);
	}

	/**   
	 * @param parentId
	 * @param page
	 * @return  
	 * @see com.ketayao.security.service.ModuleService#find(java.lang.Long, com.ketayao.util.dwz.Page)  
	 */
	public List<Module> find(Long parentId, Page page) {
		org.springframework.data.domain.Page<Module> p = 
				moduleDao.findByParentId(parentId, PageUtils.createPageable(page));
		PageUtils.injectPageProperties(page, p);
		return p.getContent();
	}

	/**   
	 * @param parentId
	 * @param name
	 * @param page
	 * @return  
	 * @see com.ketayao.security.service.ModuleService#find(java.lang.Long, java.lang.String, com.ketayao.util.dwz.Page)  
	 */
	public List<Module> find(Long parentId, String name, Page page) {
		org.springframework.data.domain.Page<Module> p = 
				moduleDao.findByParentIdAndNameContaining(parentId, name, PageUtils.createPageable(page));
		PageUtils.injectPageProperties(page, p);
		return p.getContent();
	}
	
	/**   
	 * @return  
	 * @see com.ketayao.security.service.ModuleService#findAll()  
	 */
	@Override
	public List<Module> findAll() {
		return moduleDao.findAll();
	}

	/**
	 * 判断是否是根模块.
	 */
	private boolean isRoot(Long id) {
		return id == 1;
	}

	/**
	 * 
	 * @return  
	 * @see com.ketayao.security.service.ModuleService#getTree()
	 */
	public Module getTree() {
		List<Module> list = moduleDao.findAllWithCache();
		
		List<Module> rootList = makeTree(list);
				
		return rootList.get(0);
	}

	private List<Module> makeTree(List<Module> list) {
		List<Module> parent = new ArrayList<Module>();
		// get parentId = null;
		for (Module e : list) {
			if (e.getParent() == null) {
				e.setChildren(new ArrayList<Module>(0));
				parent.add(e);
			}
		}
		// 删除parentId = null;
		list.removeAll(parent);
		
		makeChildren(parent, list);
		
		return parent;
	}
	
	private void makeChildren(List<Module> parent, List<Module> children) {
		if (children.isEmpty()) {
			return ;
		}
		
		List<Module> tmp = new ArrayList<Module>();
		for (Module c1 : parent) {
			for (Module c2 : children) {
				c2.setChildren(new ArrayList<Module>(0));
				if (c1.getId().equals(c2.getParent().getId())) {
					c1.getChildren().add(c2);
					tmp.add(c2);
				}
			}
		}
		
		children.removeAll(tmp);
		
		makeChildren(tmp, children);
	}
	
}
