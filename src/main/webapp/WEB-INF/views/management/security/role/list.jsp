<%@page import="java.util.Date"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>

<keta:paginationForm action="${contextPath }/management/security/role/list" page="${page }">
	<input type="hidden" name="keywords" value="${keywords}"/>
</keta:paginationForm>

<form method="post" action="${contextPath }/management/security/role/list" onsubmit="return navTabSearch(this)">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li>
					<label>角色名称：</label>
					<input type="text" name="keywords" value="${keywords}"/>
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
			<shiro:hasPermission name="Role:view">
				<li><a class="magnifier" target="dialog" mask="true" width="530" height="600" href="${contextPath }/management/security/role/view/{slt_uid}"><span>查看角色</span></a></li>
			</shiro:hasPermission>		
			<shiro:hasPermission name="Role:save">
				<li><a class="shield_add" target="dialog" mask="true" width="530" height="600" href="${contextPath }/management/security/role/create"><span>添加角色</span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="Role:edit">
				<li><a class="shield_go" target="dialog" mask="true" width="530" height="600" href="${contextPath }/management/security/role/update/{slt_uid}"><span>编辑角色</span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="Role:delete">
				<li><a class="shield_delete" target="ajaxTodo" href="${contextPath }/management/security/role/delete/{slt_uid}" title="确认要删除该角色?"><span>删除角色</span></a></li>
			</shiro:hasPermission>
		</ul>
	</div>
	
	<table class="table" layoutH="138" width="100%">
		<thead>
			<tr>
				<th width="200">角色名称</th>
				<th>描述</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${roles}">
			<tr target="slt_uid" rel="${item.id}">
				<td>${item.name}</td>
			    <td>${item.description }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<keta:pagination page="${page }"/>
</div>