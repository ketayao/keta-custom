/**
 * There are <a href="https://github.com/ketayao/keta-custom">keta-custom</a> code generation
 */
package ${pknDAO};

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import ${pknEntity}.${className};

public interface ${className}DAO extends JpaRepository<${className}, Long>, JpaSpecificationExecutor<${className}> {

}