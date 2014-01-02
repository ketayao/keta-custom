<%@page import="java.util.Date"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>

<dwz:paginationForm action="${contextPath }/management/security/role/list" page="${page }">
	<input type="hidden" name="search_LIKE_name" value="${param.search_LIKE_name}"/>
</dwz:paginationForm>

<form method="post" action="${contextPath }/management/security/role/list" onsubmit="return navTabSearch(this)">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li>
					<label>角色名称：</label>
					<input type="text" name=search_LIKE_name value="${param.search_LIKE_name }"/>
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
				<li><a iconClass="magnifier" rel="Role_navTab" target="navTab" href="${contextPath }/management/security/role/view/{slt_uid}"><span>查看角色</span></a></li>
			</shiro:hasPermission>		
			<shiro:hasPermission name="Role:save">
				<li><a iconClass="shield_add" rel="Role_navTab" target="navTab" href="${contextPath }/management/security/role/create"><span>添加角色</span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="Role:edit">
				<li><a iconClass="shield_go" rel="Role_navTab" target="navTab" href="${contextPath }/management/security/role/update/{slt_uid}"><span>编辑角色</span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="Role:delete">
				<li><a iconClass="shield_delete" target="ajaxTodo" href="${contextPath }/management/security/role/delete/{slt_uid}" title="确认要删除该角色?"><span>删除角色</span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="Role:assign">
				<li><a iconClass="database_go" rel="Role_navTab" target="navTab" href="${contextPath }/management/security/role/assign/{slt_uid}"><span>分配数据权限</span></a></li>
			</shiro:hasPermission>			
		</ul>
	</div>
	
	<table class="table" layoutH="137" width="100%">
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
	<dwz:pagination page="${page }"/>
</div>