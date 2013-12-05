/**
 * There are <a href="https://github.com/ketayao/keta-custom">keta-custom</a> code generation
 */
package	com.ketayao.ketacustom.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ketayao.ketacustom.dao.DataControlDAO;
import com.ketayao.ketacustom.entity.main.DataControl;
import com.ketayao.ketacustom.service.DataControlService;
import com.ketayao.ketacustom.util.dwz.Page;
import com.ketayao.ketacustom.util.dwz.PageUtils;

@Service
@Transactional
public class DataControlServiceImpl implements DataControlService {
	
	@Autowired
	private DataControlDAO dataControlDAO;

	/**   
	 * @param id
	 * @return  
	 * @see com.ketayao.ketacustom.service.DataControlService#get(java.lang.Long)  
	 */ 
	@Override
	public DataControl get(Long id) {
		return dataControlDAO.findOne(id);
	}
	
	@Override
	public DataControl getByName(String name) {
		return dataControlDAO.getByName(name);
	}

	/**   
	 * @param dataControl  
	 * @see com.ketayao.ketacustom.service.DataControlService#saveOrUpdate(com.ketayao.ketacustom.entity.DataControl)  
	 */
	@Override
	public void saveOrUpdate(DataControl dataControl) {
		dataControlDAO.save(dataControl);
	}

	/**   
	 * @param id  
	 * @see com.ketayao.ketacustom.service.DataControlService#delete(java.lang.Long)  
	 */
	@Override
	public void delete(Long id) {
		dataControlDAO.delete(id);
	}
	
	/**   
	 * @param page
	 * @return  
	 * @see com.ketayao.ketacustom.service.DataControlService#findAll(com.ketayao.ketacustom.util.dwz.Page)  
	 */
	@Override
	public List<DataControl> findAll(Page page) {
		org.springframework.data.domain.Page<DataControl> springDataPage = dataControlDAO.findAll(PageUtils.createPageable(page));
		page.setTotalCount(springDataPage.getTotalElements());
		return springDataPage.getContent();
	}
	
	/**
	 * 
	 * @param specification
	 * @param page
	 * @return
	 * @see com.ketayao.ketacustom.service.DataControlService#findByExample(org.springframework.data.jpa.domain.Specification, com.ketayao.ketacustom.util.dwz.Page)	
	 */
	@Override
	public List<DataControl> findByExample(
			Specification<DataControl> specification, Page page) {
		org.springframework.data.domain.Page<DataControl> springDataPage = dataControlDAO.findAll(specification, PageUtils.createPageable(page));
		page.setTotalCount(springDataPage.getTotalElements());
		return springDataPage.getContent();
	}
}
