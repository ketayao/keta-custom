/**
 * <pre>
 * Copyright:		Copyright(C) 2011-2012, ketayao.com
 * Filename:		com.ketayao.ketacustom.entity.Role.java
 * Class:			Role
 * Date:			2012-6-7
 * Author:			<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version          1.1.0
 * Description:		
 *
 * </pre>
 **/
 
package com.ketayao.ketacustom.entity.main;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import com.ketayao.ketacustom.entity.Idable;

/** 
 * 	
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version  1.1.0
 * @since   2012-6-7 上午11:07:45 
 */
@Entity
@Table(name="keta_role")
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="com.ketayao.ketacustom.entity.main.Role")
public class Role implements Idable<Long> {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@NotBlank
	@Length(max=64)
	@Column(length=64, nullable=false, unique=true)
	private String name;
	
	@Length(max=256)
	@Column(length=256)
	private String description;
	
	@OneToMany(mappedBy="role", cascade={CascadeType.PERSIST, CascadeType.REMOVE}, orphanRemoval=true)
	@OrderBy("priority ASC")
	private List<UserRole> userRoles = new ArrayList<UserRole>();
	
	@OneToMany(mappedBy="role", cascade={CascadeType.PERSIST, CascadeType.REMOVE}, orphanRemoval=true)
	@OrderBy("priority ASC")
	private List<OrganizationRole> organizationRoles = new ArrayList<OrganizationRole>();
	
	@OneToMany(mappedBy="role", cascade={CascadeType.PERSIST, CascadeType.REMOVE}, orphanRemoval=true)
	private List<RolePermission> rolePermissions = new ArrayList<RolePermission>();
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
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
	 * 返回 userRoles 的值   
	 * @return userRoles  
	 */
	public List<UserRole> getUserRoles() {
		return userRoles;
	}

	/**  
	 * 设置 userRoles 的值  
	 * @param userRoles
	 */
	public void setUserRoles(List<UserRole> userRoles) {
		this.userRoles = userRoles;
	}

	/**  
	 * 返回 organizationRoles 的值   
	 * @return organizationRoles  
	 */
	public List<OrganizationRole> getOrganizationRoles() {
		return organizationRoles;
	}

	/**  
	 * 设置 organizationRoles 的值  
	 * @param organizationRoles
	 */
	public void setOrganizationRoles(List<OrganizationRole> organizationRoles) {
		this.organizationRoles = organizationRoles;
	}

	/**  
	 * 返回 rolePermissions 的值   
	 * @return rolePermissions  
	 */
	public List<RolePermission> getRolePermissions() {
		return rolePermissions;
	}

	/**  
	 * 设置 rolePermissions 的值  
	 * @param rolePermissions
	 */
	public void setRolePermissions(List<RolePermission> rolePermissions) {
		this.rolePermissions = rolePermissions;
	}

	/**   
	 * @param arg0
	 * @return  
	 * @see java.lang.Object#equals(java.lang.Object)  
	 */
	@Override
	public boolean equals(Object obj) {
		return EqualsBuilder.reflectionEquals(this, obj, false);
	}

	/**   
	 * @return  
	 * @see java.lang.Object#hashCode()  
	 */
	@Override
	public int hashCode() {
		return HashCodeBuilder.reflectionHashCode(this, false);
	}
}
