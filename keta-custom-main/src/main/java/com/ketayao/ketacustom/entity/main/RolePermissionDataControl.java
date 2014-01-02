/**
 * 
 */
package com.ketayao.ketacustom.entity.main;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.ketayao.ketacustom.entity.Idable;

/**
 * @author KETAYAO
 *
 */
@Entity
@Table(name="keta_role_permission_data_control")
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="com.ketayao.ketacustom.entity.main.RolePermissionDataControl")
public class RolePermissionDataControl implements Idable<Long>{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="rolePermissionId")
	private RolePermission rolePermission;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="dataControlId")
	private DataControl dataControl;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return the rolePermission
	 */
	public RolePermission getRolePermission() {
		return rolePermission;
	}

	/**
	 * @param rolePermission the rolePermission to set
	 */
	public void setRolePermission(RolePermission rolePermission) {
		this.rolePermission = rolePermission;
	}

	/**
	 * @return the dataControl
	 */
	public DataControl getDataControl() {
		return dataControl;
	}

	/**
	 * @param dataControl the dataControl to set
	 */
	public void setDataControl(DataControl dataControl) {
		this.dataControl = dataControl;
	}
	
}
