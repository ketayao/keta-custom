<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<div class="pageContent">
<form method="post" action="${r"${contextPath }"}/${requestMapping}/update" class="required-validate pageForm" onsubmit="return validateCallback(this, dialogReloadNavTab);">
	<input type="hidden" name="id" value="${r"${"}${instanceName}.id}"/>
	<div class="pageFormContent" layoutH="58">
	<#list columns as column>
	<p>
		<#if column.comment != ''>
		<label>${column.comment}：</label>
		<#else>
		<label>${column.fieldName}：</label>
		</#if>
		<#if column.javaType == "Date">
		<input type="text" name="${column.fieldName}" class="input-medium date<#if column.nullable != true> validate[required]</#if>" readonly="readonly" style="float:left;" value="<fmt:formatDate value="${r"${"}${instanceName}.${column.fieldName}}" pattern="yyyy-MM-dd HH:mm:ss"/>"/>
		<a class="inputDateButton" href="javascript:;" style="float:left;">选择</a>
		<#else>
		<input type="text" name="${column.fieldName}" maxlength="${column.size}" value="${r"${"}${instanceName}.${column.fieldName}}" <#if column.nullable != true>class="input-medium required validate[required]"<#else>class="input-medium"</#if>/>
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