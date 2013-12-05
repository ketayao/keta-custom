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
import com.ketayao.ketacustom.entity.main.RolePermissionDataControl;
import com.ketayao.ketacustom.dao.RolePermissionDataControlDAO;
import com.ketayao.ketacustom.service.RolePermissionDataControlService;

@Service
@Transactional
public class RolePermissionDataControlServiceImpl implements RolePermissionDataControlService {
	
	@Autowired
	private RolePermissionDataControlDAO rolePermissionDataControlDAO;

	/**   
	 * @param id
	 * @return  
	 * @see com.ketayao.ketacustom.service.RolePermissionDataControlService#get(java.lang.Long)  
	 */ 
	@Override
	public RolePermissionDataControl get(Long id) {
		return rolePermissionDataControlDAO.findOne(id);
	}

	/**   
	 * @param rolePermissionDataControl  
	 * @see com.ketayao.ketacustom.service.RolePermissionDataControlService#saveOrUpdate(com.ketayao.ketacustom.entity.main.RolePermissionDataControl)  
	 */
	@Override
	public void saveOrUpdate(RolePermissionDataControl rolePermissionDataControl) {
		rolePermissionDataControlDAO.save(rolePermissionDataControl);
	}

	/**   
	 * @param id  
	 * @see com.ketayao.ketacustom.service.RolePermissionDataControlService#delete(java.lang.Long)  
	 */
	@Override
	public void delete(Long id) {
		rolePermissionDataControlDAO.delete(id);
	}
	
	/**   
	 * @param page
	 * @return  
	 * @see com.ketayao.ketacustom.service.RolePermissionDataControlService#findAll(com.ketayao.ketacustom.util.dwz.Page)  
	 */
	@Override
	public List<RolePermissionDataControl> findAll(Page page) {
		org.springframework.data.domain.Page<RolePermissionDataControl> springDataPage = rolePermissionDataControlDAO.findAll(PageUtils.createPageable(page));
		page.setTotalCount(springDataPage.getTotalElements());
		return springDataPage.getContent();
	}
	
	/**
	 * 
	 * @param specification
	 * @param page
	 * @return
	 * @see com.ketayao.ketacustom.service.RolePermissionDataControlService#findByExample(org.springframework.data.jpa.domain.Specification, com.ketayao.ketacustom.util.dwz.Page)	
	 */
	@Override
	public List<RolePermissionDataControl> findByExample(
			Specification<RolePermissionDataControl> specification, Page page) {
		org.springframework.data.domain.Page<RolePermissionDataControl> springDataPage = rolePermissionDataControlDAO.findAll(specification, PageUtils.createPageable(page));
		page.setTotalCount(springDataPage.getTotalElements());
		return springDataPage.getContent();
	}

	/* (non-Javadoc)
	 * @see com.ketayao.ketacustom.service.RolePermissionDataControlService#save(java.lang.Iterable)
	 */
	@Override
	public void save(Iterable<RolePermissionDataControl> entities) {
		rolePermissionDataControlDAO.save(entities);
	}

	/* (non-Javadoc)
	 * @see com.ketayao.ketacustom.service.RolePermissionDataControlService#deleteInBatch(java.lang.Iterable)
	 */
	@Override
	public void deleteInBatch(Iterable<RolePermissionDataControl> entities) {
		rolePermissionDataControlDAO.delete(entities);
	}

	/* (non-Javadoc)
	 * @see com.ketayao.ketacustom.service.RolePermissionDataControlService#findByRolePermissionId(java.lang.Long)
	 */
	@Override
	public List<RolePermissionDataControl> findByRolePermissionId(
			Long rolePermissionId) {
		return rolePermissionDataControlDAO.findByRolePermissionId(rolePermissionId);
	}

	/* (non-Javadoc)
	 * @see com.ketayao.ketacustom.service.RolePermissionDataControlService#findByRoleId(java.lang.Long)
	 */
	@Override
	public List<RolePermissionDataControl> findByRoleId(Long roleId) {
		return rolePermissionDataControlDAO.findByRolePermissionRoleId(roleId);
	}

}
