/**
 * There are <a href="https://github.com/ketayao/keta-custom">keta-custom</a> code generation
 */
package ${pknService};

import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import ${pknEntity}.${className};
import com.ketayao.ketacustom.util.dwz.Page;

public interface ${className}Service {
	${className} get(Long id);

	void saveOrUpdate(${className} ${instanceName});

	void delete(Long id);
	
	List<${className}> findAll(Page page);
	
	List<${className}> findByExample(Specification<${className}> specification, Page page);
}
