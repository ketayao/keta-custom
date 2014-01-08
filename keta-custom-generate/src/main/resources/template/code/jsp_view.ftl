<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<div class="pageContent">
	<div class="pageFormContent" layoutH="58">
	<#list columns as column>
	<p>
		<#if column.comment != ''>
		<label>${column.comment}：</label>
		<#else>
		<label>${column.fieldName}：</label>
		</#if>
		<span class="unit">${r"${"}${instanceName}.${column.fieldName}}</span>
	</p>
	</#list>
	</div>
	
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</div>