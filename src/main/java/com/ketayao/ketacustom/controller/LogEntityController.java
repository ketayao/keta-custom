/**
 * <pre>
 * Copyright:		Copyright(C) 2011-2012, ketayao.com
 * Filename:		com.ketayao.ketacustom.controller.LogEntityController.java
 * Class:			LogEntityController
 * Date:			2013-5-26
 * Author:			<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version          2.1.0
 * Description:		
 *
 * </pre>
 **/
 
package com.ketayao.ketacustom.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Lists;
import com.ketayao.ketacustom.entity.main.LogEntity;
import com.ketayao.ketacustom.log.Log;
import com.ketayao.ketacustom.log.LogLevel;
import com.ketayao.ketacustom.log.LogMessageObject;
import com.ketayao.ketacustom.log.impl.LogUitl;
import com.ketayao.ketacustom.service.LogEntityService;
import com.ketayao.ketacustom.util.dwz.AjaxObject;
import com.ketayao.ketacustom.util.dwz.Page;

/** 
 * 	
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version  2.1.0
 * @since   2013-5-26 下午1:54:30 
 */
@Controller
@RequestMapping("/management/security/logEntity")
public class LogEntityController {
	@Autowired
	private LogEntityService logEntityService;
	
	private static final String LIST = "management/security/logEntity/list";
	
	@InitBinder
	public void dataBinder(WebDataBinder dataBinder) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		dataBinder.registerCustomEditor(Date.class, 
				new CustomDateEditor(df, true));
	}
	
	@RequiresPermissions("LogEntity:view")
	@RequestMapping(value="/list", method={RequestMethod.GET, RequestMethod.POST})
	public String list(Page page, LogEntity logEntity,  Date startDate, Date endDate, Map<String, Object> map) {
		LogEntitySpecification logEntitySpecification = new LogEntitySpecification(logEntity, startDate, endDate);
		List<LogEntity> logEntities = logEntityService.findByExample(logEntitySpecification, page); 
		
		map.put("logEntity", logEntity);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("page", page);
		map.put("logEntities", logEntities);
		map.put("logLevels", LogLevel.values());
		
		return LIST;
	}
	
	@Log(message="删除了{0}条日志。")
	@RequiresPermissions("LogEntity:delete")
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public @ResponseBody String deleteMany(Long[] ids) {
		AjaxObject ajaxObject = new AjaxObject("删除日志成功！");
		for (Long id : ids) {
			logEntityService.delete(id);
		}
		
		LogUitl.putArgs(LogMessageObject.newWrite().setObjects(new Object[]{ids.length}));
		ajaxObject.setCallbackType("");
		return ajaxObject.toString();
	}
	
	private class LogEntitySpecification implements Specification<LogEntity> {
		
		private LogEntity logEntity;
		private Date startDate;
		private Date endDate; 
		
		public LogEntitySpecification(LogEntity logEntity) {
			this.logEntity = logEntity;	
		}
		
		public LogEntitySpecification(LogEntity logEntity, Date startDate, Date endDate) {
			this(logEntity);
			this.startDate = startDate;
			this.endDate = endDate;
		}

		/**   
		 * @param root
		 * @param query
		 * @param criteriabuilder
		 * @return  
		 * @see org.springframework.data.jpa.domain.Specification#toPredicate(javax.persistence.criteria.Root, javax.persistence.criteria.CriteriaQuery, javax.persistence.criteria.CriteriaBuilder)  
		 */
		@Override
		public Predicate toPredicate(Root<LogEntity> root,
				CriteriaQuery<?> query, CriteriaBuilder criteriabuilder) {
			List<Predicate> predicateList = Lists.newArrayList();
			
			if (logEntity.getLogLevel() != null) {
				Predicate logLevelPredicate = criteriabuilder.equal(root.get("logLevel"), logEntity.getLogLevel());
				predicateList.add(logLevelPredicate);
			}
			
			if (logEntity.getUsername() != null && StringUtils.isNotBlank(logEntity.getUsername())) {
				Predicate usernamePredicate = criteriabuilder.equal(root.get("username"), logEntity.getUsername());
				predicateList.add(usernamePredicate);
			}
			
			if (logEntity.getIpAddress() != null && StringUtils.isNotBlank(logEntity.getIpAddress())) {
				Predicate ipAddressPredicate = criteriabuilder.equal(root.get("ipAddress"), logEntity.getIpAddress());
				predicateList.add(ipAddressPredicate);
			}
			
			if (startDate != null && endDate == null) {
				endDate = new Date();
			} else if (endDate != null && startDate == null) {
				startDate = new Date(0L);
		    } 
			
			if (startDate != null && endDate != null) {
				Calendar calendar = Calendar.getInstance();
				calendar.setTime(endDate);
				calendar.add(Calendar.DAY_OF_YEAR, 1);
				endDate = calendar.getTime();
		    	
				Predicate datePredicate = criteriabuilder.between(root.<Date>get("createTime"), startDate, endDate);
				predicateList.add(datePredicate);	
			}
			
			Predicate[] predicates = new Predicate[predicateList.size()];
	        predicateList.toArray(predicates);
			
			return criteriabuilder.and(predicates);
		}
		
	}
}
