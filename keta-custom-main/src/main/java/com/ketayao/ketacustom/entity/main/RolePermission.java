/**
 * <pre>
 * Copyright:		Copyright(C) 2012-2013, ketayao.com
 * Filename:		com.ketayao.ketacustom.entity.main.RolePermission.java
 * Class:			RolePermission
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
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.google.common.base.Objects;
import com.google.common.collect.Lists;
import com.ketayao.ketacustom.entity.Idable;

/** 
 * 	
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version  2.0.0
 * @since   2013-4-16 下午1:47:51 
 */
@Entity
@Table(name="security_role_permission")
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="com.ketayao.ketacustom.entity.main.RolePermission")
public class RolePermission implements Idable<Long> {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@ManyToOne
	@JoinColumn(name="roleId")
	private Role role;
	
	@ManyToOne
	@JoinColumn(name="permissionId")
	private Permission permission;
	
	@OneToMany(mappedBy="rolePermission", cascade={CascadeType.PERSIST, CascadeType.REMOVE}, orphanRemoval=true)
	private List<RolePermissionDataControl> rolePermissionDataControls = Lists.newArrayList();
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	/**  
	 * 返回 role 的值   
	 * @return role  
	 */
	public Role getRole() {
		return role;
	}

	/**  
	 * 设置 role 的值  
	 * @param role
	 */
	public void setRole(Role role) {
		this.role = role;
	}

	/**  
	 * 返回 permission 的值   
	 * @return permission  
	 */
	public Permission getPermission() {
		return permission;
	}

	/**  
	 * 设置 permission 的值  
	 * @param permission
	 */
	public void setPermission(Permission permission) {
		this.permission = permission;
	}
	
	/**
	 * @return the rolePermissionDataControls
	 */
	public List<RolePermissionDataControl> getRolePermissionDataControls() {
		return rolePermissionDataControls;
	}

	/**
	 * @param rolePermissionDataControls the rolePermissionDataControls to set
	 */
	public void setRolePermissionDataControls(
			List<RolePermissionDataControl> rolePermissionDataControls) {
		this.rolePermissionDataControls = rolePermissionDataControls;
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
		
		if (obj instanceof RolePermission) { 
			RolePermission that = (RolePermission) obj; 
            return Objects.equal(id, that.getId()); 
        } 

        return false; 
	}

	/**   
	 * @return  
	 * @see java.lang.Object#hashCode()  
	 */
	@Override
	public int hashCode() {
		return Objects.hashCode(id);
	}
}
