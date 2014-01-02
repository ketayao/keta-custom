<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>

<dwz:paginationForm action="${contextPath }/management/security/user/list" page="${page }">
	<input type="hidden" name="search_LIKE_username" value="${param.search_LIKE_username }"/>
	<input type="hidden" name="search_LIKE_realname" value="${param.search_LIKE_realname }"/>
</dwz:paginationForm>

<form method="post" action="${contextPath }/management/security/user/list" onsubmit="return navTabSearch(this)">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li>
					<label>登录名称：</label>
					<input type="text" name="search_LIKE_username" value="${param.search_LIKE_username }"/>
				</li>
				<li>
					<label>姓名：</label>
					<input type="text" name="search_LIKE_realname" value="${param.search_LIKE_realname }"/>
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
			<shiro:hasPermission name="User:save">
				<li><a iconClass="user_add" target="dialog" rel="lookup2organization_add" mask="true" width="530" height="330" href="${contextPath }/management/security/user/create"><span>添加用户</span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="User:edit:User拥有的资源">
				<li><a iconClass="user_edit" target="dialog" rel="lookup2organization_edit" mask="true" width="530" height="330" href="${contextPath }/management/security/user/update/{slt_uid}"><span>编辑用户</span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="User:delete:User拥有的资源">
				<li><a iconClass="user_delete" target="selectedTodo" rel="ids" href="${contextPath }/management/security/user/delete" title="确认要删除?"><span>删除用户</span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="User:reset:User拥有的资源">
				<li class="line">line</li>
				<li><a iconClass="arrow_refresh" target="ajaxTodo" href="${contextPath }/management/security/user/reset/password/{slt_uid}" title="确认重置密码为123456?"><span>重置密码</span></a></li>
				<li><a iconClass="user_go" target="ajaxTodo" href="${contextPath }/management/security/user/reset/status/{slt_uid}" title="确认更新状态?"><span>更新状态</span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="User:assign">				
				<li class="line">line</li>
				<li><a iconClass="shield_add" target="dialog" mask="true" width="400" height="500" href="${contextPath }/management/security/user/lookup2create/userRole/{slt_uid}"><span>分配角色</span></a></li>
				<li><a iconClass="shield_delete" target="dialog" mask="true" width="400" height="500" href="${contextPath }/management/security/user/lookup2delete/userRole/{slt_uid}"><span>撤销角色</span></a></li>
			</shiro:hasPermission>
		</ul>
	</div>
	
	<table class="table" layoutH="137" width="100%">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>			
				<th width="100">登录名称</th>
				<th width="100">姓名</th>
				<th width="200">邮箱地址</th>
				<th width="120">电话</th>
				<th width="150" orderField=organization.name class="${page.orderField eq 'organization.name' ? page.orderDirection : ''}">所在组织</th>
				<th >角色</th>
				<th width="60" orderField="status" class="${page.orderField eq 'status' ? page.orderDirection : ''}">账户状态</th>
				<th width="130" orderField="createTime" class="${page.orderField eq 'createTime' ? page.orderDirection : ''}">创建时间</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${users}">
			<tr target="slt_uid" rel="${item.id}">
				<td><input name="ids" value="${item.id}" type="checkbox"></td>
				<td>${item.username}</td>
				<td>${item.realname}</td>
				<td>${item.email}</td>
				<td>${item.phone}</td>
				<td>${item.organization.name}</td>
				<td>
					<c:forEach var="ur" items="${item.userRoles }">
						${ur.role.name }&nbsp;&nbsp;
					</c:forEach>
				</td>
				<td>${item.status == "enabled" ? "可用":"不可用"}</td>
				<td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			</tr>			
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<dwz:pagination page="${page }"/>
</div>