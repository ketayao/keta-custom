<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%@ taglib prefix="dwz" uri="http://www.ketayao.com/dwz"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<dwz:paginationForm action="${contextPath }/management/security/dataControl/list" page="${page }">
	<input type="hidden" name="search_LIKE_name" value="${param.search_LIKE_name}"/>
</dwz:paginationForm>

<form method="post" action="${contextPath }/management/security/dataControl/list" onsubmit="return navTabSearch(this)">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li>
					<label>名称：</label>
					<input type="text" name="search_LIKE_name" value="${param.search_LIKE_name}"/>			
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
			<shiro:hasPermission name="DataControl:view">
				<li><a iconClass="database" target="navTab" rel="DataControl_view" href="${contextPath }/management/security/dataControl/view/{slt_uid}"><span>查看数据权限</span></a></li>
			</shiro:hasPermission>		
			<shiro:hasPermission name="DataControl:save">
				<li><a iconClass="database_add" target="navTab" rel="DataControl_add" href="${contextPath }/management/security/dataControl/create"><span>添加数据权限</span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="DataControl:edit">
				<li><a iconClass="database_edit" target="navTab" rel="DataControl_edit" href="${contextPath }/management/security/dataControl/update/{slt_uid}"><span>编辑数据权限</span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="DataControl:delete">
				<li><a iconClass="database_delete" target="selectedTodo" rel="ids" href="${contextPath }/management/security/dataControl/delete" title="确认要删除选定数据权限?"><span>删除数据权限</span></a></li>
			</shiro:hasPermission>
		</ul>
	</div>
	
	<table class="table" layoutH="137" width="100%">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="200">名称</th>
				<th width="400">条件</th>
				<th>描述</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${dataControls}">
			<tr target="slt_uid" rel="${item.id}">
				<td><input name="ids" value="${item.id}" type="checkbox"></td>
				<td>${item.name}</td>
				<td>${item.control}</td>
				<td>${item.description}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<dwz:pagination page="${page }"/>
</div>