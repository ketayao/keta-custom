<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<dwz:paginationForm action="${r"${contextPath }"}/${requestMapping}/list" page="${r"${page }"}">
	<input type="hidden" name="search_LIKE_${indexName}" value="${r"${param.search_LIKE_"}${indexName}}"/>
</dwz:paginationForm>

<form method="post" action="${r"${contextPath }"}/${requestMapping}/list" onsubmit="return navTabSearch(this)">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li>
			<#list columns as column>
				<#if column.fieldName == indexName>
					<#if column.comment != ''>
					<label>${column.comment}：</label>
					<#else>
					<label>${column.fieldName}：</label>
					</#if>
					<#break>
				</#if>
			</#list>
					<input type="text" name="search_LIKE_${indexName}" value="${r"${param.search_LIKE_"}${indexName}}"/>			
				</li>
			</ul>
			<div class="subBar">
				<ul>						
					<li><div class="button"><div class="buttonContent"><button type="submit">搜索</button></div></div></li>
				</ul>
			</div>
		</div>
	</div>
</form>

<div class="pageContent">

	<div class="panelBar">
		<ul class="toolBar">
			<shiro:hasPermission name="${className}:view">
				<li><a iconClass="magnifier" target="dialog" mask="true" width="530" height="250" rel="${className}_view" href="${r"${contextPath }"}/${requestMapping}/view/{slt_uid}"><span>查看${functionName}</span></a></li>
			</shiro:hasPermission>		
			<shiro:hasPermission name="${className}:save">
				<li><a class="add" target="dialog" mask="true" width="530" height="250" rel="${className}_save" href="${r"${contextPath }"}/${requestMapping}/create"><span>添加${functionName}</span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="${className}:edit">
				<li><a class="edit" target="dialog" mask="true" width="530" height="250" rel="${className}_edit" href="${r"${contextPath }"}/${requestMapping}/update/{slt_uid}"><span>编辑${functionName}</span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="${className}:delete">
				<li><a class="delete" target="selectedTodo" rel="ids" href="${r"${contextPath }"}/${requestMapping}/delete" title="确认要删除选定${functionName}?"><span>删除${functionName}</span></a></li>
			</shiro:hasPermission>
		</ul>
	</div>
	
	<table class="table" layoutH="137" width="100%">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
			<#list columns as column>
				<#if column.comment != ''>
				<th>${column.comment}</th>
				<#else>
				<th>${column.fieldName}</th>
				</#if>
			</#list>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${r"${"}${instanceName}s}">
			<tr target="slt_uid" rel="${r"${item.id}"}">
				<td><input name="ids" value="${r"${item.id}"}" type="checkbox"></td>
				<#list columns as column>
				<#if column.javaType == "Date">
				<td><fmt:formatDate value="${r"${item."}${column.fieldName}}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<#else>
				<td>${r"${item."}${column.fieldName}}</td>
				</#if>
				</#list>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<dwz:pagination page="${r"${page }"}"/>
</div>