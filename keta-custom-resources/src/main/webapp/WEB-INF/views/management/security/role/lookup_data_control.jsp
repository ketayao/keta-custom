<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="dwz" uri="http://www.ketayao.com/dwz"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<dwz:paginationForm action="${contextPath }/management/security/role/lookup?rp.id=${param['rp.id'] }&prefix=${param.prefix }" page="${page }">
	<input type="hidden" name="search_LIKE_name" value="${param.search_LIKE_name}"/>
</dwz:paginationForm>

<form method="post" action="${contextPath }/management/security/role/lookup?rp.id=${param['rp.id'] }&prefix=${param.prefix }" onsubmit="return dialogSearch(this)">
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
					<li><div class="button"><div class="buttonContent"><button type="reset">清空</button></div></div></li>
					<li><div class="button"><div class="buttonContent"><button type="button" multLookup="${param.prefix }rolePermissionDataControls[]">选择带回</button></div></div></li>
				</ul>
			</div>
		</div>
	</div>
</form>

<div class="pageContent">	
	<table class="table" layoutH="118" targetType="dialog" width="100%">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="${param.prefix }rolePermissionDataControls[]" class="checkboxCtrl"></th>
				<th width="200">名称</th>
				<th width="400">条件</th>
				<th>描述</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${dataControls}">
			<tr>
				<td><input type="checkbox" name="${param.prefix }rolePermissionDataControls[]" value="{'dataControl.id':'${item.id }', 'rolePermission.id':'${param['rp.id'] }', 'dataControl.name':'${item.name }'}"></td>
				<td>${item.name}</td>
				<td>${item.control}</td>
				<td>${item.description}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<dwz:pagination page="${page }" onchange="dialogPageBreak({numPerPage:this.value})" targetType="dialog"/>
</div>