/**
 * <pre>
 * Copyright:		Copyright(C) 2012-2013, ketayao.com
 * Filename:		com.ketayao.ketacustom.entity.main.CustomPermission.java
 * Class:			CustomPermission
 * Date:			2013-4-16
 * Author:			<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version          2.0.0
 * Description:		
 *
 * </pre>
 **/
 
package com.ketayao.ketacustom.entity.main;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import com.google.common.base.Objects;
import com.google.common.collect.Lists;
import com.ketayao.ketacustom.entity.IdEntity;

/** 
 * 除了CRUD以外的自定义权限 	
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version  2.0.0
 * @since   2013-4-16 下午1:34:54 
 */
@Entity
@Table(name="security_permission")
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="com.ketayao.ketacustom.entity.main")
public class Permission extends IdEntity {
	
	/** 描述  */
	private static final long serialVersionUID = -7905701060290158981L;
	
	/**
	 * 操作
	 */
	public final static String PERMISSION_CREATE = "save";
	
	public final static String PERMISSION_READ = "view";
	
	public final static String PERMISSION_UPDATE = "edit";
	
	public final static String PERMISSION_DELETE = "delete";

	@NotBlank
	@Length(min=1, max=32)
	@Column(nullable=false, length=32)
	private String name;

	@NotBlank
	@Length(min=1, max=16)
	@Column(nullable=false, length=16)
	private String shortName;
	
	@Length(max=255)
	@Column(length=255)
	private String description;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="moduleId")
	private Module module;
	
	@OneToMany(mappedBy="permission", cascade={CascadeType.PERSIST, CascadeType.REMOVE}, orphanRemoval=true)
	private List<RolePermission> rolePermissiones = Lists.newArrayList();

	/**  
	 * 返回 name 的值   
	 * @return name  
	 */
	public String getName() {
		return name;
	}

	/**  
	 * 设置 name 的值  
	 * @param name
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**  
	 * 返回 description 的值   
	 * @return description  
	 */
	public String getDescription() {
		return description;
	}

	/**  
	 * 设置 description 的值  
	 * @param description
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**  
	 * 返回 module 的值   
	 * @return module  
	 */
	public Module getModule() {
		return module;
	}

	/**  
	 * 设置 module 的值  
	 * @param module
	 */
	public void setModule(Module module) {
		this.module = module;
	}

	/**  
	 * 返回 rolePermissiones 的值   
	 * @return rolePermissiones  
	 */
	public List<RolePermission> getRolePermissiones() {
		return rolePermissiones;
	}

	/**  
	 * 设置 rolePermissiones 的值  
	 * @param rolePermissiones
	 */
	public void setRolePermissiones(List<RolePermission> rolePermissiones) {
		this.rolePermissiones = rolePermissiones;
	}

	/**  
	 * 返回 shortName 的值   
	 * @return shortName  
	 */
	public String getShortName() {
		return shortName;
	}

	/**  
	 * 设置 shortName 的值  
	 * @param shortName
	 */
	public void setShortName(String shortName) {
		this.shortName = shortName;
	}

	/**   
	 * @param arg0
	 * @return  
	 * @see java.lang.Object#equals(java.lang.Object)  
	 */
	@Override
	public boolean equals(Object obj) {
		if (obj == null) {
			return false;
		}
		
		if (obj == this) {
			return true;
		}
		
		if (obj instanceof Role) { 
			Permission that = (Permission) obj; 
            return Objects.equal(id, that.getId()) 
                    && Objects.equal(name, that.getName())
                    && Objects.equal(shortName, that.getShortName());
        } 

        return false; 
	}

	/**   
	 * @return  
	 * @see java.lang.Object#hashCode()  
	 */
	@Override
	public int hashCode() {
		return Objects.hashCode(id, name);
	}
	
}
