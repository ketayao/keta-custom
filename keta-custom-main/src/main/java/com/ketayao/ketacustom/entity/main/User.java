/**
 * <pre>
 * Copyright:		Copyright(C) 2011-2012, ketayao.com
 * Filename:		com.ketayao.ketacustom.entity.authenticate.User.java
 * Class:			User
 * Date:			2012-8-2
 * Author:			<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version          1.1.0
 * Description:		
 *
 * </pre>
 **/
 
package com.ketayao.ketacustom.entity.main;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import com.ketayao.ketacustom.entity.Idable;

/** 
 * 	
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version  1.1.0
 * @since   2012-8-2 下午2:44:58 
 */
@Entity
@Table(name="keta_user")
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="com.ketayao.ketacustom.entity.main.User")
public class User implements Idable<Long> {
	
	public static final String STATUS_DISABLED = "disabled";
	public static final String STATUS_ENABLED = "enabled";
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@NotBlank
	@Length(max=32)
	@Column(length=32, nullable=false)
	private String realname;

	@NotBlank
	@Length(max=32)
	@Column(length=32, nullable=false, unique=true, updatable=false)
	private String username;
	
	@Column(length=64, nullable=false)
	private String password;
	
	@Transient
	private String plainPassword;
	
	@Column(length=32, nullable=false)
	private String salt;
	
	@Length(max=32)
	@Column(length=32)
	private String phone;
	
	@Email
	@Length(max=128)
	@Column(length=128)
	private String email;
	
	/**
	 * 使用状态disabled，enabled
	 */
	@NotBlank
	@Length(max=16)
	@Column(length=16, nullable=false)
	private String status = STATUS_ENABLED;
	
	/**
	 * 帐号创建时间
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(updatable=false)
	private Date createTime;
	
	@OneToMany(mappedBy="user", cascade={CascadeType.PERSIST, CascadeType.REMOVE}, orphanRemoval=true)
	@OrderBy("priority ASC")
	private List<UserRole> userRoles = new ArrayList<UserRole>();
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="organizationId")
	private Organization organization;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	/**  
	 * 返回 realname 的值   
	 * @return realname  
	 */
	public String getRealname() {
		return realname;
	}

	/**  
	 * 设置 realname 的值  
	 * @param realname
	 */
	public void setRealname(String realname) {
		this.realname = realname;
	}

	/**  
	 * 返回 username 的值   
	 * @return username  
	 */
	public String getUsername() {
		return username;
	}

	/**  
	 * 设置 username 的值  
	 * @param username
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**  
	 * 返回 password 的值   
	 * @return password  
	 */
	public String getPassword() {
		return password;
	}

	/**  
	 * 设置 password 的值  
	 * @param password
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**  
	 * 返回 createTime 的值   
	 * @return createTime  
	 */
	public Date getCreateTime() {
		return createTime;
	}

	/**  
	 * 设置 createTime 的值  
	 * @param createTime
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	/**  
	 * 返回 status 的值   
	 * @return status  
	 */
	public String getStatus() {
		return status;
	}

	/**  
	 * 设置 status 的值  
	 * @param status
	 */
	public void setStatus(String status) {
		this.status = status;
	}

	/**  
	 * 返回 plainPassword 的值   
	 * @return plainPassword  
	 */
	public String getPlainPassword() {
		return plainPassword;
	}

	/**  
	 * 设置 plainPassword 的值  
	 * @param plainPassword
	 */
	public void setPlainPassword(String plainPassword) {
		this.plainPassword = plainPassword;
	}

	/**  
	 * 返回 salt 的值   
	 * @return salt  
	 */
	public String getSalt() {
		return salt;
	}

	/**  
	 * 设置 salt 的值  
	 * @param salt
	 */
	public void setSalt(String salt) {
		this.salt = salt;
	}
	
	/**  
	 * 返回 email 的值   
	 * @return email  
	 */
	public String getEmail() {
		return email;
	}

	/**  
	 * 设置 email 的值  
	 * @param email
	 */
	public void setEmail(String email) {
		this.email = email;
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
	 * 返回 phone 的值   
	 * @return phone  
	 */
	public String getPhone() {
		return phone;
	}

	/**  
	 * 设置 phone 的值  
	 * @param phone
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	/**  
	 * 返回 organization 的值   
	 * @return organization  
	 */
	public Organization getOrganization() {
		return organization;
	}

	/**  
	 * 设置 organization 的值  
	 * @param organization
	 */
	public void setOrganization(Organization organization) {
		this.organization = organization;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
