/**
 * There are <a href="https://github.com/ketayao/keta-custom">keta-custom</a> code generation
 */
package ${pknDAO};

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import ${pknEntity}.${className};

public interface ${className}DAO extends JpaRepository<${className}, Long> {
	Page<${className}> findBy${indexName?cap_first}Containing(String title, Pageable pageable);
}