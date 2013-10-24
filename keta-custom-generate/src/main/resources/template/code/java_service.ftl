/**
 * There are <a href="https://github.com/ketayao/keta-custom">keta-custom</a> code generation
 */
package ${pknService};

import java.util.List;

import ${pknEntity}.${className};
import com.ketayao.ketacustom.util.dwz.Page;

public interface ${className}Service {
	void save(${className} ${instanceName});
	
	${className} get(Long id);

	void update(${className} ${instanceName});

	void delete(Long id);
	
	List<${className}> find(Page page, String ${indexName});

	List<${className}> findAll(Page page);
}
