<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="contextPath" value="${r"${pageContext.request.contextPath}"}"/>    
<div class="pageContent">
<form method="post" action="${r"${contextPath }"}/${requestMapping}/create" class="required-validate pageForm" onsubmit="return validateCallback(this, dialogReloadNavTab);">
	<div class="pageFormContent" layoutH="58">
	<#list columns as column>
	<p>
		<#if column.comment != ''>
		<label>${column.comment}：</label>
		<#else>
		<label>${column.fieldName}：</label>
		</#if>
		<#if column.javaType == "Date">
		<input type="text" name="${column.fieldName}" class="date<#if column.nullable != true> validate[required]</#if>" readonly="readonly" style="float:left;"/>
		<a class="inputDateButton" href="javascript:;" style="float:left;">选择</a>
		<#else>
		<input type="text" name="${column.fieldName}" size="32" maxlength="${column.size}" alt="请输入${column.comment}" <#if column.nullable != true>class="required validate[required]"</#if>/>
		</#if>
	</p>	
	</#list>
	</div>
	
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="submit">确定</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</form>
</div>