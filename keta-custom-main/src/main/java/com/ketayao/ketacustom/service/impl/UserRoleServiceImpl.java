/**
 * There are <a href="https://github.com/ketayao/keta-custom">keta-custom</a> code generation
 */
package	com.ketayao.ketacustom.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ketayao.ketacustom.util.dwz.Page;
import com.ketayao.ketacustom.util.dwz.PageUtils;
import com.ketayao.ketacustom.entity.main.UserRole;
import com.ketayao.ketacustom.dao.UserRoleDAO;
import com.ketayao.ketacustom.service.UserRoleService;

@Service
@Transactional
public class UserRoleServiceImpl implements UserRoleService {
	
	@Autowired
	private UserRoleDAO userRoleDAO;

	/*
	 * (non-Javadoc)
	 * @see com.ketayao.ketacustom.service.UserRoleService#get(java.lang.Long)  
	 */ 
	@Override
	public UserRole get(Long id) {
		return userRoleDAO.findOne(id);
	}

	/*
	 * (non-Javadoc) 
	 * @see com.ketayao.ketacustom.service.UserRoleService#saveOrUpdate(com.ketayao.ketacustom.entity.main.UserRole)  
	 */
	@Override
	public void saveOrUpdate(UserRole userRole) {
		userRoleDAO.save(userRole);
	}

	/*
	 * (non-Javadoc)
	 * @see com.ketayao.ketacustom.service.UserRoleService#delete(java.lang.Long)  
	 */
	@Override
	public void delete(Long id) {
		userRoleDAO.delete(id);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.ketayao.ketacustom.service.UserRoleService#findAll(com.ketayao.ketacustom.util.dwz.Page)  
	 */
	@Override
	public List<UserRole> findAll(Page page) {
		org.springframework.data.domain.Page<UserRole> springDataPage = userRoleDAO.findAll(PageUtils.createPageable(page));
		page.setTotalCount(springDataPage.getTotalElements());
		return springDataPage.getContent();
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.ketayao.ketacustom.service.UserRoleService#findByExample(org.springframework.data.jpa.domain.Specification, com.ketayao.ketacustom.util.dwz.Page)	
	 */
	@Override
	public List<UserRole> findByExample(
			Specification<UserRole> specification, Page page) {
		org.springframework.data.domain.Page<UserRole> springDataPage = userRoleDAO.findAll(specification, PageUtils.createPageable(page));
		page.setTotalCount(springDataPage.getTotalElements());
		return springDataPage.getContent();
	}

	/* (non-Javadoc)
	 * @see com.ketayao.ketacustom.service.UserRoleService#findByUserId(java.lang.Long)
	 */
	@Override
	public List<UserRole> findByUserId(Long userId) {
		return userRoleDAO.findByUserId(userId);
	}
	
}
