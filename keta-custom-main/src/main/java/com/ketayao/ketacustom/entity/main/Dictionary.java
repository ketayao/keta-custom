package com.ketayao.ketacustom.entity.main;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;

import com.ketayao.ketacustom.entity.Idable;

/** 
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * @since   2014年1月8日 上午10:36:40 
 */
@Entity
@Table(name="keta_dictionary")
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="com.ketayao.ketacustom.entity.main.Dictionary")
public class Dictionary implements Idable<Long> {  
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@NotBlank
	@Length(max=64)
	@Column(length=64, nullable=false)
	private String name;

	@Length(max=128)
	@Column(length=128)
	private String value;
	
	@NotNull
	@Range(min=1, max=999)
	@Column(length=3, nullable=false)
	private Integer priority = 999;
	
	@Column(length=16)
	@Enumerated(EnumType.STRING)
	private DictionaryType type;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="parentId")
	private Dictionary parent;
	
	@OneToMany(mappedBy="parent", cascade={CascadeType.PERSIST, CascadeType.REMOVE}, orphanRemoval=true)
	@OrderBy("priority ASC")
	private List<Dictionary> children = new ArrayList<Dictionary>();
	
	/* (non-Javadoc)
	 * @see com.ketayao.ketacustom.entity.Idable#getId()
	 */
	@Override
	public Long getId() {
		return id;
	}

	/* (non-Javadoc)
	 * @see com.ketayao.ketacustom.entity.Idable#setId(java.io.Serializable)
	 */
	@Override
	public void setId(Long id) {
		this.id = id;
	}
	
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the value
	 */
	public String getValue() {
		return value;
	}

	/**
	 * @param value the value to set
	 */
	public void setValue(String value) {
		this.value = value;
	}

	/**
	 * @return the priority
	 */
	public Integer getPriority() {
		return priority;
	}

	/**
	 * @param priority the priority to set
	 */
	public void setPriority(Integer priority) {
		this.priority = priority;
	}

	/**
	 * @return the type
	 */
	public DictionaryType getType() {
		return type;
	}

	/**
	 * @param type the type to set
	 */
	public void setType(DictionaryType type) {
		this.type = type;
	}

	/**
	 * @return the parent
	 */
	public Dictionary getParent() {
		return parent;
	}

	/**
	 * @param parent the parent to set
	 */
	public void setParent(Dictionary parent) {
		this.parent = parent;
	}

	/**
	 * @return the children
	 */
	public List<Dictionary> getChildren() {
		return children;
	}

	/**
	 * @param children the children to set
	 */
	public void setChildren(List<Dictionary> children) {
		this.children = children;
	}



	public enum DictionaryType {
		// 主题
		THEME,
		// 词条
		ITEM
	}
}
