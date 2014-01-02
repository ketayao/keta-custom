/**
 * <pre>
 * Copyright:		Copyright(C) 2011-2012, ketayao.com
 * Filename:		com.ketayao.ketacustom.entity.component.Resource.java
 * Class:			Resource
 * Date:			2013-6-28
 * Author:			<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version          3.1.0
 * Description:		
 *
 * </pre>
 **/
 
package com.ketayao.ketacustom.entity.component;

import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import com.ketayao.ketacustom.entity.Idable;
import com.ketayao.utils.FileUtils;

/** 
 * 	
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version  3.1.0
 * @since   2013-6-28 上午9:20:21 
 */
@Entity
@Table(name = "keta_component_resource")
public class Resource implements Idable<Long> {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(length=32)
	private String size;
	
	@Column(length=128)
	private String name;

	@Column(updatable=false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date uploadTime;
	
	@Lob
	@Basic(fetch=FetchType.LAZY)
	@Column(length=10240, updatable=false)
	private byte[] file;
	
	@Transient
	private String type;
	
	/**
	 * db,file
	 */
	@Column(length=16, updatable=false)
	@Enumerated(EnumType.STRING)
	private StoreType storeType = StoreType.FILE;
	
	/**
	 * 唯一id用作，下载标识。
	 */
	@Column(length=32, unique=true, updatable=false)
	private String uuid;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	/**  
	 * 返回 size 的值   
	 * @return size  
	 */
	public String getSize() {
		return size;
	}

	/**  
	 * 设置 size 的值  
	 * @param size
	 */
	public void setSize(String size) {
		this.size = size;
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
	 * 返回 file 的值   
	 * @return file  
	 */
	public byte[] getFile() {
		return file;
	}

	/**  
	 * 设置 file 的值  
	 * @param file
	 */
	public void setFile(byte[] file) {
		this.file = file;
	}

	/**  
	 * 返回 uploadTime 的值   
	 * @return uploadTime  
	 */
	public Date getUploadTime() {
		return uploadTime;
	}

	/**  
	 * 设置 uploadTime 的值  
	 * @param uploadTime
	 */
	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}

	/**  
	 * 返回 type 的值   
	 * @return type  
	 */
	public String getType() {
		type = FileUtils.getFileExt(name);
		return type;
	}

	/**  
	 * 返回 storeType 的值   
	 * @return storeType  
	 */
	public StoreType getStoreType() {
		return storeType;
	}

	/**  
	 * 设置 storeType 的值  
	 * @param storeType
	 */
	public void setStoreType(StoreType storeType) {
		this.storeType = storeType;
	}

	/**  
	 * 返回 uuid 的值   
	 * @return uuid  
	 */
	public String getUuid() {
		return uuid;
	}

	/**  
	 * 设置 uuid 的值  
	 * @param uuid
	 */
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	
	/**
	 * 得到实际文件的存储名。
	 * 描述
	 * @return
	 */
	public String getRealStoreName() {
		if (getUuid() == null || getUuid().equals("")) {
			return null;
		}
		return getUuid() + "." + getType();
	}
	
	/**
	 * 得到不含后缀的文件名。
	 * 描述
	 * @return
	 */
	public String getOnlyName() {
		if (getName() == null) {
			return null;
		}
		
		int endIndex = getName().lastIndexOf(".");
		if (endIndex == -1) {
			return null;
		}
		return getName().substring(0, endIndex);
	}
}
