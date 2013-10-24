<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="contextPath" value="${r"${pageContext.request.contextPath}"}"/>
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
		<input type="text" name="${column.fieldName}" size="32" maxlength="${column.size}" value="${r"${"}${instanceName}.${column.fieldName}}"/>
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