/**
 * There are <a href="https://github.com/ketayao/keta-custom">keta-custom</a> code generation
 */
package com.ketayao.ketacustom.dao;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;

import com.ketayao.ketacustom.entity.main.Dictionary;
import com.ketayao.ketacustom.entity.main.Dictionary.DictionaryType;

public interface DictionaryDAO extends JpaRepository<Dictionary, Long>, JpaSpecificationExecutor<Dictionary> {
	@QueryHints(value={
			@QueryHint(name="org.hibernate.cacheable",value="true"),
			@QueryHint(name="org.hibernate.cacheRegion",value="com.ketayao.ketacustom.entity.main.Dictionary")
		}
	)
	Page<Dictionary> findByParentNameAndType(String name, DictionaryType dictionaryType, Pageable pageable);
	
	@QueryHints(value={
			@QueryHint(name="org.hibernate.cacheable",value="true"),
			@QueryHint(name="org.hibernate.cacheRegion",value="com.ketayao.ketacustom.entity.main.Dictionary")
		}
	)
	@Query("FROM Dictionary d WHERE d.parent.name=?1 AND d.type='ITEM' ORDER BY d.priority ASC")
	List<Dictionary> findAllItems(String themeName);
}