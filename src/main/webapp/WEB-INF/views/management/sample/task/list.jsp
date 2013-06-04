<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>

<keta:paginationForm action="${contextPath }/management/sample/task/list" page="${page }">
	<input type="hidden" name="keywords" value="${keywords}"/>
</keta:paginationForm>

<form method="post" action="${contextPath }/management/sample/task/list" onsubmit="return navTabSearch(this)">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li>
					<label>任务名称：</label>
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
			<shiro:hasPermission name="Task:look">
				<li><a class="magnifier" target="dialog" mask="true" width="530" height="250" href="${contextPath }/management/sample/task/view/{slt_uid}"><span>查看任务</span></a></li>
			</shiro:hasPermission>		
			<shiro:hasPermission name="Task:save">
				<li><a class="add" target="dialog" mask="true" width="530" height="250" href="${contextPath }/management/sample/task/create"><span>添加任务</span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="Task:edit">
				<li><a class="edit" target="dialog" mask="true" width="530" height="250" href="${contextPath }/management/sample/task/update/{slt_uid}"><span>编辑任务</span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="Task:delete">
				<li><a class="delete" target="selectedTodo" rel="ids" href="${contextPath }/management/sample/task/delete" title="确认要删除选定任务?"><span>删除任务</span></a></li>
			</shiro:hasPermission>
		</ul>
	</div>
	
	<table class="table" layoutH="138" width="100%">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="200">任务名称</th>
				<th>描述</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${tasks}">
			<tr target="slt_uid" rel="${item.id}">
				<td><input name="ids" value="${item.id}" type="checkbox"></td>
				<td>${item.title}</td>
				<td>${item.description}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<keta:pagination page="${page }"/>
</div>