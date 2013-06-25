package com.sample.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import com.ketayao.ketacustom.entity.IdEntity;


//JPA标识
@Entity
@Table(name = "ss_task")
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class Task extends IdEntity {
	/** 描述  */
	private static final long serialVersionUID = -2677876323206901899L;

	@NotBlank
	@Length(max=32)
	@Column(length=32, nullable=false)
	private String title;
	
	@Length(max=255)
	@Column(length=255)
	private String description;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}
