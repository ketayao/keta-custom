/**
 * There are <a href="https://github.com/ketayao/keta-custom">keta-custom</a> code generation
 */
package	com.ketayao.ketacustom.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ketayao.ketacustom.dao.ModuleDAO;
import com.ketayao.ketacustom.entity.main.Module;
import com.ketayao.ketacustom.exception.ExistedException;
import com.ketayao.ketacustom.exception.NotDeletedException;
import com.ketayao.ketacustom.service.ModuleService;
import com.ketayao.ketacustom.util.dwz.Page;
import com.ketayao.ketacustom.util.dwz.PageUtils;

@Service
@Transactional
public class ModuleServiceImpl implements ModuleService {
	
	@Autowired
	private ModuleDAO moduleDAO;

	/*
	 * (non-Javadoc)
	 * @see com.ketayao.ketacustom.service.ModuleService#get(java.lang.Long)  
	 */ 
	@Override
	public Module get(Long id) {
		return moduleDAO.findOne(id);
	}

	/*
	 * (non-Javadoc) 
	 * @see com.ketayao.ketacustom.service.ModuleService#saveOrUpdate(com.ketayao.ketacustom.entity.main.Module)  
	 */
	@Override
	public void saveOrUpdate(Module module) {
		if (module.getId() == null) {
			if (moduleDAO.getBySn(module.getSn()) != null) {
				throw new ExistedException("已存在sn=" + module.getSn() + "的模块。");
			}
		}

		moduleDAO.save(module);
	}

	/*
	 * (non-Javadoc)
	 * @see com.ketayao.ketacustom.service.ModuleService#delete(java.lang.Long)  
	 */
	@Override
	public void delete(Long id) {
		if (isRoot(id)) {
			throw new NotDeletedException("不允许删除根模块。");
		}
		
		Module module = this.get(id);
		
		//先判断是否存在子模块，如果存在子模块，则不允许删除
		if(module.getChildren().size() > 0){
			throw new NotDeletedException(module.getName() + "模块下存在子模块，不允许删除。");
		}
		
		moduleDAO.delete(module);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.ketayao.ketacustom.service.ModuleService#findAll(com.ketayao.ketacustom.util.dwz.Page)  
	 */
	@Override
	public List<Module> findAll(Page page) {
		org.springframework.data.domain.Page<Module> springDataPage = moduleDAO.findAll(PageUtils.createPageable(page));
		page.setTotalCount(springDataPage.getTotalElements());
		return springDataPage.getContent();
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.ketayao.ketacustom.service.ModuleService#findByExample(org.springframework.data.jpa.domain.Specification, com.ketayao.ketacustom.util.dwz.Page)	
	 */
	@Override
	public List<Module> findByExample(
			Specification<Module> specification, Page page) {
		org.springframework.data.domain.Page<Module> springDataPage = moduleDAO.findAll(specification, PageUtils.createPageable(page));
		page.setTotalCount(springDataPage.getTotalElements());
		return springDataPage.getContent();
	}

	/* (non-Javadoc)
	 * @see com.ketayao.ketacustom.service.ModuleService#findAll()
	 */
	@Override
	public List<Module> findAll() {
		return moduleDAO.findAll();
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
	 * @see com.ketayao.ketacustom.service.ModuleService#getTree()
	 */
	public Module getTree() {
		List<Module> list = moduleDAO.findAllWithCache();
		
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
