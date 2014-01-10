/**
 * There are <a href="https://github.com/ketayao/keta-custom">keta-custom</a> code generation
 */
package com.sample.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.ketayao.ketacustom.entity.Idable;
import com.ketayao.ketacustom.entity.main.User;

@Entity
@Table(name="sample_task")
public class Task implements Idable<Long>{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
	/**
	 * 标题
	 */
    @Column(nullable=false, length=64)
    private String title;
    
	/**
	 * 内容
	 */
    @Column(length=256)
    private String content;
    
	/**
	 * 等级
	 */
    @Column(nullable=false, length=64)
    private String level;
    
	/**
	 * 创建人
	 */
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="userId")
	private User user;
    
	/**
	 * 创建时间
	 */
    @Column(length=19)
	@Temporal(TemporalType.TIMESTAMP)
    private Date createTime;
    
    /**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}
	
	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}
	
	/**
	 * @param title the title to set
	 */
    public void setTitle(String title){
       this.title = title;
    }
    
    /**
     * @return the title 
     */
    public String getTitle(){
       return this.title;
    }
	
	/**
	 * @param content the content to set
	 */
    public void setContent(String content){
       this.content = content;
    }
    
    /**
     * @return the content 
     */
    public String getContent(){
       return this.content;
    }
	
	/**
	 * @param level the level to set
	 */
    public void setLevel(String level){
       this.level = level;
    }
    
    /**
     * @return the level 
     */
    public String getLevel(){
       return this.level;
    }
	
	/**
	 * @return the user
	 */
	public User getUser() {
		return user;
	}

	/**
	 * @param user the user to set
	 */
	public void setUser(User user) {
		this.user = user;
	}

	/**
	 * @param createTime the createTime to set
	 */
    public void setCreateTime(Date createTime){
       this.createTime = createTime;
    }
    
    /**
     * @return the createTime 
     */
    public Date getCreateTime(){
       return this.createTime;
    }
}
